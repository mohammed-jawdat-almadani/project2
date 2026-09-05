import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/authenticated_image.dart';
import '../../domain/entities/withdrawal_item.dart';

class WithdrawalDetailsSheet extends StatelessWidget {
  final WithdrawalItem item;

  const WithdrawalDetailsSheet({
    super.key,
    required this.item,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final local = date.toLocal();
    return '${local.year}/${local.month.toString().padLeft(2, '0')}/${local.day.toString().padLeft(2, '0')} ${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return const Color(0xFF16A34A);
      case 'processing':
      case 'pending':
        return const Color(0xFFD97706);
      case 'rejected':
      case 'cancelled':
        return const Color(0xFFDC2626);
      default:
        return const Color(0xFF003882);
    }
  }

  Color _getStatusBgColor(BuildContext context, String status) {
    final isDark = AppColors.isDark(context);
    switch (status.toLowerCase()) {
      case 'completed':
        return isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7);
      case 'processing':
      case 'pending':
        return isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7);
      case 'rejected':
      case 'cancelled':
        return isDark ? const Color(0xFF7F1D1D).withValues(alpha: 0.3) : const Color(0xFFFEE2E2);
      default:
        return isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF);
    }
  }

  String _getStatusLabel(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return context.isArabic ? 'تم التحويل بنجاح ✅' : 'Transfer Completed ✅';
      case 'processing':
        return context.isArabic ? 'قيد المراجعة والمعالجة ⏳' : 'Under Review ⏳';
      case 'pending':
        return context.isArabic ? 'طلب معلق ⏳' : 'Pending Request ⏳';
      case 'rejected':
        return context.isArabic ? 'تم رفض الطلب 🔴' : 'Request Rejected 🔴';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(item.status);
    final statusBgColor = _getStatusBgColor(context, item.status);
    final statusLabel = _getStatusLabel(context, item.status);
    final isDark = AppColors.isDark(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      child: SingleChildScrollView(
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

            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.receipt_rounded,
                        color: AppColors.primary(context),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('withdrawal_details'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary(context),
                          ),
                        ),
                        Text(
                          '${context.isArabic ? "طلب سحب" : "Withdrawal"} #${item.id}',
                          style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
                        ),
                      ],
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

            const SizedBox(height: 16),
            Divider(color: AppColors.border(context)),
            const SizedBox(height: 12),

            // Main Info Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.inputFill(context),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border(context)),
              ),
              child: Column(
                children: [
                  _buildDetailRow(
                    context,
                    context.tr('amount_field'),
                    '${item.amount} ${context.tr('currency')}',
                    isBold: true,
                    valueColor: AppColors.primary(context),
                  ),
                  Divider(color: AppColors.border(context), height: 16),
                  _buildDetailRow(context, context.tr('full_name'), item.shamCashName ?? '-'),
                  const SizedBox(height: 10),
                  _buildDetailRow(context, context.tr('account_number'), item.shamCashNumber ?? '-'),
                  const SizedBox(height: 10),
                  _buildDetailRow(context, context.tr('date_time'), _formatDate(item.createdAt)),
                  if (item.rejectionReason != null && item.rejectionReason!.isNotEmpty) ...[
                    Divider(color: AppColors.border(context), height: 16),
                    _buildDetailRow(context, context.isArabic ? 'سبب الرفض:' : 'Rejection Reason:', item.rejectionReason!, valueColor: const Color(0xFFDC2626)),
                  ],
                ],
              ),
            ),

            // Receipt Section (If uploaded by Admin)
            if (item.hasReceipt) ...[
              const SizedBox(height: 18),
              Row(
                children: [
                  Icon(Icons.attachment_rounded, color: AppColors.primary(context), size: 18),
                  const SizedBox(width: 6),
                  Text(
                    context.isArabic ? 'إشعار التحويل المرفق (اضغط للتكبير):' : 'Attached Receipt (tap to zoom):',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AuthenticatedImage(
                    imageUrl: 'https://home-maintenance.me/api/technician/withdrawals/${item.id}/receipt',
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    enableZoomOnTap: true,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Close Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textSecondary(context),
                  side: BorderSide(color: AppColors.border(context)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(context.tr('close')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 15 : 13,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: valueColor ?? AppColors.textPrimary(context),
          ),
        ),
      ],
    );
  }
}
