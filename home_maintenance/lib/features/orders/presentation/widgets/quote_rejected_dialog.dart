import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class QuoteRejectedDialog extends StatelessWidget {
  final int orderId;
  final String? inspectionFee;
  final VoidCallback onDismiss;
  final VoidCallback onViewWallet;

  const QuoteRejectedDialog({
    super.key,
    required this.orderId,
    this.inspectionFee,
    required this.onDismiss,
    required this.onViewWallet,
  });

  @override
  Widget build(BuildContext context) {
    final fee = inspectionFee ?? '50.00';
    final isDark = AppColors.isDark(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.surface(context),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Status Icon with Wallet & Info badge
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF92400E).withValues(alpha: 0.4) : const Color(0xFFFDE68A),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Color(0xFFD97706),
                    size: 30,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: context.isRtl ? 2 : null,
                  left: context.isRtl ? null : 2,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF4444),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              context.tr('quote_rejected_header'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(context),
              ),
            ),
            const SizedBox(height: 10),

            // Explanation Message Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.inputFill(context),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border(context)),
              ),
              child: Column(
                children: [
                  Text(
                    '${context.tr('order_no')}$orderId',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context), height: 1.4),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: isDark ? const Color(0xFF059669) : const Color(0xFF86EFAC)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 18),
                        const SizedBox(width: 6),
                        Text(
                          '${context.tr('quote_rejected_desc')} ($fee ${context.tr('currency')})',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF15803D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDismiss();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textSecondary(context),
                      side: BorderSide(color: AppColors.border(context)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(context.tr('close')),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onViewWallet();
                    },
                    icon: const Icon(Icons.account_balance_wallet_rounded, size: 16),
                    label: Text(context.tr('tab_wallet')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003882),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
