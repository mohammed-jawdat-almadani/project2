import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_event.dart';
import '../bloc/notifications_state.dart';
import '../widgets/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<NotificationsBloc>()..add(const NotificationsEvent.fetch()),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage ||
          previous.successMessage != current.successMessage,
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        } else if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.successMessage!),
              backgroundColor: const Color(0xFF16A34A),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
      },
      builder: (context, state) {
        final currentFilter = state.currentFilter;

        return Scaffold(
          backgroundColor: AppColors.background(context),
          appBar: AppBar(
            backgroundColor: AppColors.surface(context),
            elevation: 0.5,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                context.isRtl ? Icons.arrow_back_ios_new_rounded : Icons.arrow_back_rounded,
                color: AppColors.textPrimary(context),
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              context.tr('notifications_title'),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.primary(context),
              ),
            ),
            actions: [
              if (state.unreadCount > 0)
                Padding(
                  padding: EdgeInsets.only(
                    left: context.isRtl ? 8.0 : 0,
                    right: context.isRtl ? 0 : 8.0,
                  ),
                  child: TextButton.icon(
                    onPressed: state.isMarkingAllRead
                        ? null
                        : () {
                            context
                                .read<NotificationsBloc>()
                                .add(const NotificationsEvent.markAllRead());
                          },
                    icon: state.isMarkingAllRead
                        ? const SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            Icons.done_all_rounded,
                            size: 17,
                            color: AppColors.primary(context),
                          ),
                    label: Text(
                      context.tr('mark_all_read'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary(context),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          body: Column(
            children: [
              // Filter Chips Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                color: AppColors.surface(context),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _buildFilterChip(
                        context: context,
                        label: context.tr('all'),
                        isSelected: currentFilter == null || currentFilter.isEmpty,
                        onTap: () {
                          context
                              .read<NotificationsBloc>()
                              .add(const NotificationsEvent.filterChanged(null));
                        },
                      ),
                      const SizedBox(width: 8),
                      _buildFilterChip(
                        context: context,
                        label: context.tr('unread'),
                        badgeCount: state.unreadCount > 0 ? state.unreadCount : null,
                        isSelected: currentFilter == 'unread',
                        onTap: () {
                          context
                              .read<NotificationsBloc>()
                              .add(const NotificationsEvent.filterChanged('unread'));
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Notifications Content
              Expanded(
                child: RefreshIndicator(
                  color: const Color(0xFF003882),
                  onRefresh: () async {
                    context.read<NotificationsBloc>().add(const NotificationsEvent.refresh());
                  },
                  child: _buildBody(context, state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterChip({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    int? badgeCount,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF003882) : AppColors.inputFill(context),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: isSelected ? Colors.transparent : AppColors.border(context)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.textSecondary(context),
              ),
            ),
            if (badgeCount != null) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : const Color(0xFFEF4444),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$badgeCount',
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF003882) : Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, NotificationsState state) {
    if (state.isLoading && state.notifications.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primary(context)),
      );
    }

    if (state.notifications.isEmpty) {
      final isDark = AppColors.isDark(context);

      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_off_outlined,
                    size: 46,
                    color: AppColors.primary(context),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  context.tr('no_notifications'),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary(context),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  context.tr('no_notifications_desc'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: state.notifications.length,
      itemBuilder: (context, index) {
        final item = state.notifications[index];
        return NotificationCard(
          item: item,
          onMarkAsRead: () {
            if (!item.isRead) {
              context.read<NotificationsBloc>().add(NotificationsEvent.markRead(item.id));
            }
          },
        );
      },
    );
  }
}
