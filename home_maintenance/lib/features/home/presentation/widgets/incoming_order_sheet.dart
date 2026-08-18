import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/authenticated_image.dart';
import '../../domain/entities/dispatch_offer.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class IncomingOrderSheet extends StatefulWidget {
  final DispatchOffer offer;

  const IncomingOrderSheet({
    super.key,
    required this.offer,
  });

  @override
  State<IncomingOrderSheet> createState() => _IncomingOrderSheetState();
}

class _IncomingOrderSheetState extends State<IncomingOrderSheet> {
  Timer? _countdownTimer;
  int _secondsRemaining = 90;
  int _totalSeconds = 90;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    if (widget.offer.expiresAt != null) {
      final now = DateTime.now();
      final diff = widget.offer.expiresAt!.difference(now).inSeconds;
      _secondsRemaining = diff > 0 ? diff : 0;
      if (widget.offer.offeredAt != null) {
        _totalSeconds = widget.offer.expiresAt!.difference(widget.offer.offeredAt!).inSeconds;
        if (_totalSeconds <= 0) _totalSeconds = 90;
      } else {
        _totalSeconds = _secondsRemaining > 0 ? _secondsRemaining : 90;
      }
    }

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        if (mounted) {
          setState(() {
            _secondsRemaining--;
          });
        }
      } else {
        timer.cancel();
        // Offer expired -> automatically dismiss sheet and refresh offers
        if (mounted) {
          context.read<HomeBloc>().add(const HomeEvent.dismissOffer());
          context.read<HomeBloc>().add(const HomeEvent.fetchOffers());
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant IncomingOrderSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.offer.id != widget.offer.id) {
      _countdownTimer?.cancel();
      _initTimer();
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  String _formatDuration(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;
    final isUrgent = offer.orderType == 'urgent';
    final isWarranty = offer.orderKind == 'warranty';
    final isScheduled = offer.orderType == 'scheduled' || offer.scheduledAt != null;
    final progress = _totalSeconds > 0 ? (_secondsRemaining / _totalSeconds).clamp(0.0, 1.0) : 0.0;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.80;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final isProcessing = state.isProcessingOffer;

        return Container(
          margin: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.16),
                blurRadius: 24,
                offset: const Offset(0, -4),
              ),
            ],
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: 1.0,
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag Handle Indicator
                  Center(
                    child: Container(
                      width: 44,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCBD5E1),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // 1. Top Expiration Timer Bar & Order ID
                  if (offer.expiresAt != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              size: 18,
                              color: _secondsRemaining < 20 ? const Color(0xFFDC2626) : const Color(0xFF003882),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'الوقت المتبقي للرد: ${_formatDuration(_secondsRemaining)}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: _secondsRemaining < 20 ? const Color(0xFFDC2626) : const Color(0xFF003882),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'طلب #${offer.orderId}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: const Color(0xFFF1F5F9),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _secondsRemaining < 20 ? const Color(0xFFDC2626) : const Color(0xFF003882),
                        ),
                        minHeight: 5,
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],

                  // 2. Service Category & Status Badges
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isUrgent ? const Color(0xFFFEF2F2) : const Color(0xFFEEF2FF),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Icon(
                          isUrgent ? Icons.bolt_rounded : Icons.build_circle_rounded,
                          color: isUrgent ? const Color(0xFFDC2626) : const Color(0xFF003882),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.serviceName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                if (isUrgent)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEE2E2),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text(
                                      'طلب طارئ ⚡',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDC2626),
                                      ),
                                    ),
                                  ),
                                if (isScheduled)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0F2FE),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text(
                                      'طلب مجدول 📅',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0369A1),
                                      ),
                                    ),
                                  ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: isWarranty ? const Color(0xFFF3E8FF) : const Color(0xFFF1F5F9),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    isWarranty ? 'زيارة ضمان 🛡️' : 'زيارة عادية',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: isWarranty ? const Color(0xFF7E22CE) : const Color(0xFF475569),
                                    ),
                                  ),
                                ),
                                if (offer.distanceKm != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.near_me_rounded, size: 12, color: Color(0xFF64748B)),
                                        const SizedBox(width: 4),
                                        Text(
                                          offer.distanceKm!,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF475569),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // 3. Problem Description (وصف العطل)
                  if (offer.description != null && offer.description!.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.description_outlined, size: 18, color: Color(0xFF003882)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'تفاصيل المشكلة / العطل:',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  offer.description!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF1E293B),
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // 4. Photos Section (صور العطل المرفقة)
                  if (offer.photos.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    const Row(
                      children: [
                        Icon(Icons.photo_library_outlined, size: 16, color: Color(0xFF64748B)),
                        SizedBox(width: 6),
                        Text(
                          'صور العطل المرفقة (اضغط للتكبير):',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 75,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: offer.photos.length,
                        separatorBuilder: (context, i) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final url = offer.photos[index];
                          return AuthenticatedImage(
                            imageUrl: url,
                            width: 75,
                            height: 75,
                            borderRadius: BorderRadius.circular(12),
                            enableZoomOnTap: true,
                          );
                        },
                      ),
                    ),
                  ],

                  const SizedBox(height: 14),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 14),

                  // 5. Structured Address & Inspection Fee Card
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14.0),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      children: [
                        // Address Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFEE2E2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.location_on_rounded, size: 16, color: Color(0xFFEF4444)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    offer.addressLabel ?? 'موقع العميل',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E293B),
                                    ),
                                  ),
                                  if (offer.buildingNo != null || offer.floor != null) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      '${offer.buildingNo != null ? "بناء ${offer.buildingNo}، " : ""}${offer.floor != null ? "طابق ${offer.floor}" : ""}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF64748B),
                                      ),
                                    ),
                                  ],
                                  if (offer.addressNotes != null && offer.addressNotes!.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      'ملاحظات: ${offer.addressNotes}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF475569),
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                        const Divider(height: 1, color: Color(0xFFE2E8F0)),
                        const SizedBox(height: 10),

                        // Financial & Fee Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.payments_outlined, size: 16, color: Color(0xFF16A34A)),
                                const SizedBox(width: 6),
                                Text(
                                  'أجور الكشف: ${offer.inspectionFee ?? "50.00"} ل.س',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF16A34A),
                                  ),
                                ),
                              ],
                            ),
                            if (offer.commissionRate != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF6FF),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'عمولة: ${(double.tryParse(offer.commissionRate!) != null ? (double.parse(offer.commissionRate!) * 100).toInt() : 10)}%',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2563EB),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  if (offer.scheduledAt != null) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2FE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.event_available_rounded, size: 16, color: Color(0xFF0284C7)),
                          const SizedBox(width: 8),
                          Text(
                            'الموعد المحدد: ${offer.scheduledAt!.year}/${offer.scheduledAt!.month.toString().padLeft(2, '0')}/${offer.scheduledAt!.day.toString().padLeft(2, '0')} - ${offer.scheduledAt!.hour.toString().padLeft(2, '0')}:${offer.scheduledAt!.minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0369A1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 18),

                  // 6. Action Buttons (Accept & Decline)
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: isProcessing
                              ? null
                              : () {
                                  context.read<HomeBloc>().add(HomeEvent.acceptOffer(offer.id));
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF003882),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            elevation: 0,
                          ),
                          child: isProcessing
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'قبول الطلب',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          onPressed: isProcessing
                              ? null
                              : () {
                                  context.read<HomeBloc>().add(HomeEvent.declineOffer(offer.id));
                                },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF64748B),
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            side: const BorderSide(color: Color(0xFFCBD5E1)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: const Text(
                            'رفض',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
