import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_header.dart';
import '../widgets/home_map_widget.dart';
import '../widgets/home_bottom_nav_bar.dart';
import '../widgets/incoming_order_sheet.dart';
import '../widgets/active_accepted_order_card.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/enums/technician_status.dart';
import '../../../../core/enums/user_role.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../orders/presentation/pages/orders_page.dart';
import '../../../wallet/presentation/pages/wallet_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/bloc/profile_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Validate technician activation status on entry
    context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              unauthenticated: () {
                context.go('/login');
              },
              authenticated: (user) {
                if (user.role == UserRole.technician) {
                  if (user.technicianStatus != TechnicianStatus.active &&
                      user.technicianStatus != TechnicianStatus.probation) {
                    context.go('/activation');
                  }
                }
              },
              error: (_) {
                context.go('/login');
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: getIt<HomeBloc>()..add(const HomeEvent.init()),
          ),
          BlocProvider(
            create: (context) => getIt<ProfileBloc>()..add(const ProfileEvent.fetchProfile()),
          ),
        ],
        child: const _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          (previous.errorMessage != current.errorMessage && current.errorMessage != null) ||
          (previous.successMessage != current.successMessage && current.successMessage != null),
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        } else if (state.successMessage != null) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.successMessage!),
              backgroundColor: const Color(0xFF16A34A),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background(context),
          body: IndexedStack(
            index: state.currentTab,
            children: [
              // Tab 0: Home / Map View
              Stack(
                children: [
                  // Fullscreen Map
                  const Positioned.fill(
                    child: HomeMapWidget(),
                  ),

                  // Floating Top Header
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      bottom: false,
                      child: HomeHeader(),
                    ),
                  ),

                   // Incoming Order Sheet (when offer exists)
                  if (state.currentOffer != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: IncomingOrderSheet(offer: state.currentOffer!),
                    )
                  // Active Accepted Order Card (when an order is accepted and active)
                  else if (state.activeOrder != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ActiveAcceptedOrderCard(
                        order: state.activeOrder!,
                      ),
                    ),
                ],
              ),

              // Tab 1: Orders (طلباتي)
              const OrdersPage(),

              // Tab 2: Wallet (المحفظة)
              const WalletPage(),

              // Tab 3: Account (الحساب)
              const ProfilePage(),
            ],
          ),
          bottomNavigationBar: HomeBottomNavBar(
            currentIndex: state.currentTab,
            onTabSelected: (index) {
              context.read<HomeBloc>().add(HomeEvent.changeTab(index));
            },
          ),
        );
      },
    );
  }
}
