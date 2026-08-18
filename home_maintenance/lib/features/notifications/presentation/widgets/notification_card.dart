import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) return 'الآن';
    if (diff.inMinutes < 60) return 'منذ ${diff.inMinutes} دقيقة';
    if (diff.inHours < 24) return 'منذ ${diff.inHours} ساعة';
    if (diff.inDays == 1) return 'أمس';
    if (diff.inDays < 7) return 'منذ ${diff.inDays} أيام';
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

  Color _getCategoryBgColor(String category) {
    switch (category) {
      case 'orders':
        return const Color(0xFFEEF2FF);
      case 'financial':
        return const Color(0xFFDCFCE7);
      case 'admin':
        return const Color(0xFFF3E8FF);
      default:
        return const Color(0xFFEEF2FF);
    }
  }

  String _getCategoryLabel(String category) {
    switch (category) {
      case 'orders':
        return 'طلب صيانة';
      case 'financial':
        return 'معاملة مالية';
      case 'admin':
        return 'إشعار إداري';
      default:
        return 'إشعار عام';
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
    final catBgColor = _getCategoryBgColor(item.category);
    final catIcon = _getCategoryIcon(item.category);
    final catLabel = _getCategoryLabel(item.category);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
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
                    color: const Color(0xFFE2E8F0),
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
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF1F5F9)),
              const SizedBox(height: 12),

              // Notification Body Text
              Text(
                item.body,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF334155),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              // Metadata Row (Created At & Target)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    if (item.targetId != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'المرجع المرتبط:',
                            style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                          ),
                          Text(
                            '${item.targetType == "Order" ? "طلب صيانة" : "عنصر"} #${item.targetId}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF003882),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'تاريخ ووقت الإشعار:',
                          style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                        ),
                        Text(
                          item.createdAt != null
                              ? '${item.createdAt!.year}/${item.createdAt!.month.toString().padLeft(2, '0')}/${item.createdAt!.day.toString().padLeft(2, '0')} - ${item.createdAt!.hour.toString().padLeft(2, '0')}:${item.createdAt!.minute.toString().padLeft(2, '0')}'
                              : 'غير متوفر',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B),
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
                  icon: const Icon(Icons.arrow_back_rounded, size: 18),
                  label: Text(_getActionLabel()),
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

  String _getActionLabel() {
    if (item.category == 'orders' || item.targetType == 'Order') {
      return 'الانتقال إلى خريطة الطلبات والبدء';
    } else if (item.category == 'financial') {
      return 'الانتقال إلى المحفظة';
    } else if (item.category == 'admin') {
      return 'الذهاب إلى الملف الشخصي';
    }
    return 'الرجوع للرئيسية';
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
    final catBgColor = _getCategoryBgColor(item.category);
    final catIcon = _getCategoryIcon(item.category);
    final isUnread = !item.isRead;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: isUnread ? const Color(0xFFF0F7FF) : Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: isUnread ? const Color(0xFFBFDBFE) : const Color(0xFFE2E8F0),
          width: isUnread ? 1.4 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isUnread ? 0.05 : 0.02),
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
                                color: const Color(0xFF1E293B),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isUnread)
                            Container(
                              width: 9,
                              height: 9,
                              margin: const EdgeInsets.only(right: 6),
                              decoration: const BoxDecoration(
                                color: Color(0xFF003882),
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item.body,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF64748B),
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
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${item.targetType == "Order" ? "طلب" : "عنصر"} #${item.targetId}',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF475569),
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
                                _getCategoryLabel(item.category),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: catColor,
                                ),
                              ),
                            ),
                          Text(
                            _formatDateTime(item.createdAt),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF94A3B8),
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
