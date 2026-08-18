import 'package:flutter/material.dart';
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

  Color _getStatusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return const Color(0xFFDCFCE7);
      case 'processing':
      case 'pending':
        return const Color(0xFFFEF3C7);
      case 'rejected':
      case 'cancelled':
        return const Color(0xFFFEE2E2);
      default:
        return const Color(0xFFEEF2FF);
    }
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return 'تم التحويل بنجاح ✅';
      case 'processing':
        return 'قيد المراجعة والمعالجة ⏳';
      case 'pending':
        return 'طلب معلق ⏳';
      case 'rejected':
        return 'تم رفض الطلب 🔴';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(item.status);
    final statusBgColor = _getStatusBgColor(item.status);
    final statusLabel = _getStatusLabel(item.status);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
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
                  color: const Color(0xFFE2E8F0),
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFEEF2FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.receipt_rounded,
                        color: Color(0xFF003882),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'تفاصيل طلب السحب',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        Text(
                          'طلب سحب #${item.id}',
                          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
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
            const Divider(color: Color(0xFFF1F5F9)),
            const SizedBox(height: 12),

            // Main Info Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                children: [
                  _buildDetailRow('المبلغ المسحوب:', '${item.amount} ل.س', isBold: true, valueColor: const Color(0xFF003882)),
                  const Divider(color: Color(0xFFE2E8F0), height: 16),
                  _buildDetailRow('المستفيد:', item.shamCashName ?? 'فني الصيانة'),
                  const SizedBox(height: 10),
                  _buildDetailRow('رقم حساب شام كاش:', item.shamCashNumber ?? '-'),
                  const SizedBox(height: 10),
                  _buildDetailRow('تاريخ ووقت الطلب:', _formatDate(item.createdAt)),
                  if (item.rejectionReason != null && item.rejectionReason!.isNotEmpty) ...[
                    const Divider(color: Color(0xFFE2E8F0), height: 16),
                    _buildDetailRow('سبب الرفض:', item.rejectionReason!, valueColor: const Color(0xFFDC2626)),
                  ],
                ],
              ),
            ),

            // Receipt Section (If uploaded by Admin)
            if (item.hasReceipt) ...[
              const SizedBox(height: 18),
              const Row(
                children: [
                  Icon(Icons.attachment_rounded, color: Color(0xFF003882), size: 18),
                  SizedBox(width: 6),
                  Text(
                    'إشعار التحويل المرفق (اضغط للتكبير):',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
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
                  foregroundColor: const Color(0xFF64748B),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('إغلاق'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 15 : 13,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: valueColor ?? const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}
