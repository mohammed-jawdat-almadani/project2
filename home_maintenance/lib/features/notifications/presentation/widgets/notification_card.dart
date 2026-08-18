import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/bloc/home_event.dart';
import '../../domain/entities/notification_item.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback onMarkAsRead;

  const NotificationCard({
    super.key,
    required this.item,
    required this.onMarkAsRead,
  });

  String _formatDateTime(BuildContext context, DateTime? dateTime) {
    if (dateTime == null) return '';
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) return context.isArabic ? 'الآن' : 'Just now';
    if (diff.inMinutes < 60) return context.isArabic ? 'منذ ${diff.inMinutes} دقيقة' : '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return context.isArabic ? 'منذ ${diff.inHours} ساعة' : '${diff.inHours}h ago';
    if (diff.inDays == 1) return context.isArabic ? 'أمس' : 'Yesterday';
    if (diff.inDays < 7) return context.isArabic ? 'منذ ${diff.inDays} أيام' : '${diff.inDays}d ago';
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}';
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'orders':
        return const Color(0xFF003882);
      case 'financial':
        return const Color(0xFF16A34A);
      case 'admin':
        return const Color(0xFF7E22CE);
      default:
        return const Color(0xFF003882);
    }
  }

  Color _getCategoryBgColor(BuildContext context, String category) {
    final isDark = AppColors.isDark(context);
    switch (category) {
      case 'orders':
        return isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF);
      case 'financial':
        return isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7);
      case 'admin':
        return isDark ? const Color(0xFF581C87).withValues(alpha: 0.3) : const Color(0xFFF3E8FF);
      default:
        return isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF);
    }
  }

  String _getCategoryLabel(BuildContext context, String category) {
    switch (category) {
      case 'orders':
        return context.isArabic ? 'طلب صيانة' : 'Order';
      case 'financial':
        return context.isArabic ? 'معاملة مالية' : 'Finance';
      case 'admin':
        return context.isArabic ? 'إشعار إداري' : 'Admin';
      default:
        return context.isArabic ? 'إشعار عام' : 'General';
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'orders':
        return Icons.handyman_rounded;
      case 'financial':
        return Icons.account_balance_wallet_rounded;
      case 'admin':
        return Icons.verified_user_rounded;
      default:
        return Icons.notifications_rounded;
    }
  }

  void _handleTap(BuildContext context) {
    onMarkAsRead();
    _showDetailsBottomSheet(context);
  }

  void _showDetailsBottomSheet(BuildContext context) {
    final catColor = _getCategoryColor(item.category);
    final catBgColor = _getCategoryBgColor(context, item.category);
    final catIcon = _getCategoryIcon(item.category);
    final catLabel = _getCategoryLabel(context, item.category);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.border(context),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header Row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: catBgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(catIcon, color: catColor, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: catBgColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            catLabel,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: catColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Divider(color: AppColors.border(context)),
              const SizedBox(height: 12),

              // Notification Body Text
              Text(
                item.body,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textPrimary(context),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              // Metadata Row (Created At & Target)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.inputFill(context),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border(context)),
                ),
                child: Column(
                  children: [
                    if (item.targetId != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.isArabic ? 'المرجع المرتبط:' : 'Related Reference:',
                            style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context)),
                          ),
                          Text(
                            '${item.targetType == "Order" ? context.tr('order_no') : "#"}${item.targetId}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.tr('date_time'),
                          style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context)),
                        ),
                        Text(
                          item.createdAt != null
                              ? '${item.createdAt!.year}/${item.createdAt!.month.toString().padLeft(2, '0')}/${item.createdAt!.day.toString().padLeft(2, '0')} - ${item.createdAt!.hour.toString().padLeft(2, '0')}:${item.createdAt!.minute.toString().padLeft(2, '0')}'
                              : '-',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Action Button based on category & target
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    _navigateBasedOnTarget(context);
                  },
                  icon: Icon(
                    context.isRtl ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                    size: 18,
                  ),
                  label: Text(_getActionLabel(context)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003882),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getActionLabel(BuildContext context) {
    if (item.category == 'orders' || item.targetType == 'Order') {
      return context.isArabic ? 'الانتقال إلى خريطة الطلبات والبدء' : 'Go to Order Map';
    } else if (item.category == 'financial') {
      return context.isArabic ? 'الانتقال إلى المحفظة' : 'Go to Wallet';
    } else if (item.category == 'admin') {
      return context.isArabic ? 'الذهاب إلى الملف الشخصي' : 'Go to Profile';
    }
    return context.isArabic ? 'الرجوع للرئيسية' : 'Go Home';
  }

  void _navigateBasedOnTarget(BuildContext context) {
    if (item.category == 'orders' || item.targetType == 'Order') {
      context.read<HomeBloc>().add(const HomeEvent.changeTab(0));
      context.read<HomeBloc>().add(const HomeEvent.fetchOffers());
      context.go('/');
    } else if (item.category == 'financial') {
      context.read<HomeBloc>().add(const HomeEvent.changeTab(2));
      context.go('/');
    } else if (item.category == 'admin') {
      context.read<HomeBloc>().add(const HomeEvent.changeTab(3));
      context.go('/');
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final catColor = _getCategoryColor(item.category);
    final catBgColor = _getCategoryBgColor(context, item.category);
    final catIcon = _getCategoryIcon(item.category);
    final isUnread = !item.isRead;
    final isDark = AppColors.isDark(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: isUnread
            ? (isDark ? const Color(0xFF1E293B) : const Color(0xFFF0F7FF))
            : AppColors.surface(context),
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: isUnread ? const Color(0xFF38BDF8) : AppColors.border(context),
          width: isUnread ? 1.4 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : (isUnread ? 0.05 : 0.02)),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(18.0),
          onTap: () => _handleTap(context),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Icon
                Container(
                  padding: const EdgeInsets.all(11.0),
                  decoration: BoxDecoration(
                    color: catBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    catIcon,
                    color: catColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),

                // Content Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                                color: AppColors.textPrimary(context),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isUnread)
                            Container(
                              width: 9,
                              height: 9,
                              margin: EdgeInsets.only(
                                right: context.isRtl ? 6 : 0,
                                left: context.isRtl ? 0 : 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary(context),
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item.body,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary(context),
                          height: 1.35,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (item.targetId != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.inputFill(context),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${item.targetType == "Order" ? (context.isArabic ? "طلب" : "Order") : "#"} #${item.targetId}',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textSecondary(context),
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: catBgColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                _getCategoryLabel(context, item.category),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: catColor,
                                ),
                              ),
                            ),
                          Text(
                            _formatDateTime(context, item.createdAt),
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.textMuted(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
