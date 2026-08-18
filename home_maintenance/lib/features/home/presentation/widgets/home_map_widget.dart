import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeMapWidget extends StatefulWidget {
  const HomeMapWidget({super.key});

  @override
  State<HomeMapWidget> createState() => _HomeMapWidgetState();
}

class _HomeMapWidgetState extends State<HomeMapWidget> with SingleTickerProviderStateMixin {
  late final MapController _mapController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.35).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          (previous.currentOffer != current.currentOffer && current.currentOffer != null) ||
          (previous.technicianLat != current.technicianLat && current.technicianLat != 0) ||
          (previous.technicianLng != current.technicianLng && current.technicianLng != 0),
      listener: (context, state) {
        if (state.currentOffer != null) {
          final offer = state.currentOffer!;
          _mapController.move(
            LatLng(offer.clientLat, offer.clientLng),
            15.2,
          );
        } else if (state.technicianLat != 0 && state.technicianLng != 0) {
          _mapController.move(
            LatLng(state.technicianLat, state.technicianLng),
            15.0,
          );
        }
      },
      builder: (context, state) {
        final techPosition = LatLng(state.technicianLat, state.technicianLng);

        final markers = <Marker>[
          // 1. Technician Location Marker
          Marker(
            point: techPosition,
            width: 76,
            height: 76,
            child: AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer radar ring
                    Container(
                      width: 60 * _pulseAnimation.value,
                      height: 60 * _pulseAnimation.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF003882).withValues(
                          alpha: (0.22 / _pulseAnimation.value).clamp(0.0, 1.0),
                        ),
                      ),
                    ),
                    // Middle soft glow
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF003882).withValues(alpha: 0.15),
                      ),
                    ),
                    // Inner Core Pin
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF0049AB), Color(0xFF00275C)],
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF003882).withValues(alpha: 0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.build_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ];

        // 2. Incoming Order / Client Marker
        if (state.currentOffer != null) {
          final offer = state.currentOffer!;
          final orderPos = LatLng(offer.clientLat, offer.clientLng);

          markers.add(
            Marker(
              point: orderPos,
              width: 56,
              height: 56,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEF4444).withValues(alpha: 0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.home_repair_service_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          );
        }

        return Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: techPosition,
                initialZoom: 14.5,
                minZoom: 5.0,
                maxZoom: 18.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.homemaintenance.app',
                  tileBuilder: (context, tileWidget, tile) {
                    return ColorFiltered(
                      colorFilter: const ColorFilter.matrix(<double>[
                        0.92, 0.04, 0.04, 0, 0,
                        0.04, 0.92, 0.04, 0, 0,
                        0.04, 0.04, 0.92, 0, 0,
                        0, 0, 0, 1, 0,
                      ]),
                      child: tileWidget,
                    );
                  },
                ),
                MarkerLayer(markers: markers),
              ],
            ),

            // Map Controls (Floating Recenter Button on Right side)
            Positioned(
              right: 16,
              bottom: state.currentOffer != null ? 360 : 32,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      _mapController.move(techPosition, 15.0);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.my_location_rounded,
                        color: Color(0xFF003882),
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
