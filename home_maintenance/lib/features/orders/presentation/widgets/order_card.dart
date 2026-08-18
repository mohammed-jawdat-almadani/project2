import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
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
      case 'parts_waiting':
      case 'quote_pending':
      case 'quote_rejected':
        return const Color(0xFFD97706);
      case 'completed':
      case 'closed':
        return const Color(0xFF003882);
      case 'expired':
        return const Color(0xFF64748B);
      case 'cancelled':
      case 'disputed':
        return const Color(0xFFDC2626);
      default:
        return const Color(0xFF003882);
    }
  }

  Color _getStatusBgColor(BuildContext context, String status) {
    final isDark = AppColors.isDark(context);
    switch (status.toLowerCase()) {
      case 'accepted':
      case 'assigned':
      case 'arrived':
      case 'in_progress':
      case 'quoted':
      case 'approved':
        return isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7);
      case 'pending':
      case 'parts_waiting':
      case 'quote_pending':
      case 'quote_rejected':
        return isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7);
      case 'completed':
      case 'closed':
        return isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF);
      case 'expired':
        return AppColors.inputFill(context);
      case 'cancelled':
      case 'disputed':
        return isDark ? const Color(0xFF7F1D1D).withValues(alpha: 0.3) : const Color(0xFFFEE2E2);
      default:
        return isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF);
    }
  }

  String _getStatusLabel(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
      case 'assigned':
        return context.tr('order_accepted_header');
      case 'arrived':
        return context.tr('arrived_header');
      case 'in_progress':
        return context.tr('in_progress_header');
      case 'quote_pending':
      case 'quoted':
        return context.tr('quote_pending_header');
      case 'quote_rejected':
        return context.tr('quote_rejected_header');
      case 'approved':
        return context.tr('quote_approved_header');
      case 'parts_waiting':
        return context.tr('parts_waiting_header');
      case 'closure_pending':
      case 'closure_requested':
        return context.tr('closure_pending_header');
      case 'completed':
      case 'closed':
        return context.tr('completed_header');
      case 'disputed':
        return context.tr('dispute_header');
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
      'quote_pending',
      'parts_waiting',
      'closure_pending',
      'closure_requested',
      'disputed',
    };
    return active.contains(status.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.status);
    final statusBgColor = _getStatusBgColor(context, order.status);
    final statusLabel = _getStatusLabel(context, order.status);
    final isActiveOrder = _isActive(order.status);
    final isDark = AppColors.isDark(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: isActiveOrder
              ? (isDark ? const Color(0xFF1E40AF) : const Color(0xFFBFDBFE))
              : AppColors.border(context),
          width: isActiveOrder ? 1.4 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : (isActiveOrder ? 0.05 : 0.02)),
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
                            color: isDark
                                ? const Color(0xFF38BDF8).withValues(alpha: 0.12)
                                : const Color(0xFF003882).withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${context.tr('order_no')}${order.id}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary(context),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (order.type == 'urgent')
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF991B1B).withValues(alpha: 0.3) : const Color(0xFFFEE2E2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              context.tr('urgent'),
                              style: const TextStyle(
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary(context),
                  ),
                ),
                if (order.description != null && order.description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    order.description!,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary(context),
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
                Divider(height: 1, color: AppColors.border(context)),
                const SizedBox(height: 10),

                // Location, Date & Inspection Fee
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 15, color: AppColors.textSecondary(context)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        order.address?.label ?? context.tr('address'),
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary(context),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (order.createdAt != null) ...[
                      Text(
                        _formatDate(order.createdAt),
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textMuted(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    if (order.inspectionFee != null) ...[
                      Text(
                        '${context.tr('inspection_fee')}: ${order.inspectionFee} ${context.tr('currency')}',
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
                            final clientTitle = (order.clientName != null && order.clientName!.isNotEmpty)
                                ? order.clientName!
                                : context.tr('client');
                            context.push(
                              '/chat/${order.id}?clientName=${Uri.encodeComponent(clientTitle)}',
                            );
                          },
                          icon: const Icon(Icons.chat_bubble_rounded, size: 16),
                          label: Text(context.tr('chat_with_client')),
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
                        label: Text(context.tr('details')),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary(context),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          side: BorderSide(color: AppColors.border(context)),
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
