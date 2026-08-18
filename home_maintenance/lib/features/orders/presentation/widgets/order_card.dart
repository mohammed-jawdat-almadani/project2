import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/authenticated_image.dart';
import '../../domain/entities/order_item.dart';
import 'order_details_sheet.dart';

class OrderCard extends StatelessWidget {
  final OrderItem order;

  const OrderCard({
    super.key,
    required this.order,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final local = date.toLocal();
    return '${local.year}/${local.month.toString().padLeft(2, '0')}/${local.day.toString().padLeft(2, '0')} - ${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
      case 'assigned':
      case 'arrived':
      case 'in_progress':
      case 'quoted':
      case 'approved':
        return const Color(0xFF16A34A);
      case 'pending':
        return const Color(0xFFD97706);
      case 'completed':
      case 'closed':
        return const Color(0xFF003882);
      case 'expired':
        return const Color(0xFF64748B);
      case 'cancelled':
        return const Color(0xFFDC2626);
      default:
        return const Color(0xFF003882);
    }
  }

  Color _getStatusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
      case 'assigned':
      case 'arrived':
      case 'in_progress':
      case 'quoted':
      case 'approved':
        return const Color(0xFFDCFCE7);
      case 'pending':
        return const Color(0xFFFEF3C7);
      case 'completed':
      case 'closed':
        return const Color(0xFFEEF2FF);
      case 'expired':
        return const Color(0xFFF1F5F9);
      case 'cancelled':
        return const Color(0xFFFEE2E2);
      default:
        return const Color(0xFFEEF2FF);
    }
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
      case 'assigned':
        return 'مقبول / قيد التنفيذ 🛠️';
      case 'arrived':
        return 'تم الوصول للموقع 📍';
      case 'in_progress':
        return 'العمل جاري ⚙️';
      case 'quoted':
        return 'تم إرسال عرض السعر 💵';
      case 'approved':
        return 'تمت الموافقة على السعر ✅';
      case 'parts_waiting':
        return 'بانتظار قطعة غيار ⏳';
      case 'closure_requested':
        return 'بانتظار الإغلاق 🔒';
      case 'pending':
        return 'قيد الانتظار ⏳';
      case 'completed':
      case 'closed':
        return 'مكتمل ✅';
      case 'expired':
        return 'منتهي ⚪';
      case 'cancelled':
        return 'ملغي 🔴';
      default:
        return status;
    }
  }

  bool _isActive(String status) {
    const active = {
      'accepted',
      'assigned',
      'arrived',
      'in_progress',
      'quoted',
      'approved',
      'parts_waiting',
      'closure_requested',
    };
    return active.contains(status.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.status);
    final statusBgColor = _getStatusBgColor(order.status);
    final statusLabel = _getStatusLabel(order.status);
    final isActiveOrder = _isActive(order.status);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: isActiveOrder ? const Color(0xFFBFDBFE) : const Color(0xFFE2E8F0),
          width: isActiveOrder ? 1.4 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isActiveOrder ? 0.05 : 0.02),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (ctx) => OrderDetailsSheet(order: order),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Header Row (Order #, Category & Status Pill)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF003882).withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'طلب #${order.id}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF003882),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (order.type == 'urgent')
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEE2E2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'طارئ ⚡',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFDC2626),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        statusLabel,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Service & Description
                Text(
                  order.serviceCategoryName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                if (order.description != null && order.description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    order.description!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF475569),
                      height: 1.35,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],

                // Photos row preview if available
                if (order.photos.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: order.photos.length,
                      separatorBuilder: (ctx, i) => const SizedBox(width: 8),
                      itemBuilder: (ctx, i) {
                        return AuthenticatedImage(
                          imageUrl: order.photos[i].url,
                          width: 50,
                          height: 50,
                          borderRadius: BorderRadius.circular(8),
                          enableZoomOnTap: true,
                        );
                      },
                    ),
                  ),
                ],

                const SizedBox(height: 12),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                const SizedBox(height: 10),

                // Location, Date & Inspection Fee
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 15, color: Color(0xFF64748B)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        order.address?.label ?? 'موقع العميل',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (order.createdAt != null) ...[
                      Text(
                        _formatDate(order.createdAt),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    if (order.inspectionFee != null) ...[
                      Text(
                        'كشف: ${order.inspectionFee} ل.س',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16A34A),
                        ),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 12),

                // Bottom Action Buttons
                Row(
                  children: [
                    // Chat Button (If active)
                    if (isActiveOrder) ...[
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.push(
                              '/chat/${order.id}?clientName=${Uri.encodeComponent(order.clientName ?? "العميل")}',
                            );
                          },
                          icon: const Icon(Icons.chat_bubble_rounded, size: 16),
                          label: const Text('محادثة مع العميل'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF003882),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],

                    // Details Button
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (ctx) => OrderDetailsSheet(order: order),
                          );
                        },
                        icon: const Icon(Icons.info_outline_rounded, size: 16),
                        label: const Text('عرض التفاصيل'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF003882),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          side: const BorderSide(color: Color(0xFFCBD5E1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
