import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../../notifications/presentation/bloc/notifications_bloc.dart';
import '../../../notifications/presentation/bloc/notifications_state.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final isAvailable = state.isAvailable;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: BorderRadius.circular(32.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: AppColors.border(context),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 1. User Avatar with Online Status Indicator
              GestureDetector(
                onTap: () {
                  context.read<HomeBloc>().add(const HomeEvent.changeTab(3));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? const Color(0xFF1E40AF) : const Color(0xFF003882),
                        border: Border.all(
                          color: isDark ? const Color(0xFF38BDF8) : const Color(0xFFD3E3FD),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isAvailable ? const Color(0xFF22C55E) : const Color(0xFF94A3B8),
                          border: Border.all(
                            color: AppColors.surface(context),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 2. Availability Switch Pill (Center)
              GestureDetector(
                onTap: state.isLoadingAvailability
                    ? null
                    : () {
                        context
                            .read<HomeBloc>()
                            .add(HomeEvent.toggleAvailability(!isAvailable));
                      },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: isAvailable
                        ? (isDark ? const Color(0xFF064E3B) : const Color(0xFFF0FDF4))
                        : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC)),
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: isAvailable
                          ? (isDark ? const Color(0xFF059669) : const Color(0xFF86EFAC))
                          : (isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1)),
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isAvailable
                              ? const Color(0xFF16A34A)
                              : const Color(0xFF94A3B8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isAvailable ? context.tr('status_online') : context.tr('status_offline'),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isAvailable
                              ? (isDark ? const Color(0xFF6EE7B7) : const Color(0xFF15803D))
                              : AppColors.textSecondary(context),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Transform.scale(
                        scale: 0.75,
                        child: Switch(
                          value: isAvailable,
                          onChanged: state.isLoadingAvailability
                              ? null
                              : (val) {
                                  context
                                      .read<HomeBloc>()
                                      .add(HomeEvent.toggleAvailability(val));
                                },
                          activeTrackColor: const Color(0xFF16A34A),
                          activeThumbColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 3. Notification Bell with live unread badge
              BlocBuilder<NotificationsBloc, NotificationsState>(
                builder: (context, notifState) {
                  final unreadCount = notifState.unreadCount;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: AppColors.inputFill(context),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.push('/notifications');
                          },
                          icon: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.textPrimary(context),
                            size: 22,
                          ),
                        ),
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEF4444),
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            child: Text(
                              unreadCount > 99 ? '99+' : '$unreadCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
