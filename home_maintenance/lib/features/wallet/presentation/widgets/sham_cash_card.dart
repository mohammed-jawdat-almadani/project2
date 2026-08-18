import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/sham_cash_account.dart';

class ShamCashCard extends StatelessWidget {
  final ShamCashAccount? account;
  final VoidCallback onLinkOrEdit;

  const ShamCashCard({
    super.key,
    required this.account,
    required this.onLinkOrEdit,
  });

  String _formatMaskedNumber(String number) {
    if (number.isEmpty) return '•••• ••••';
    if (number.length <= 4) return '•••• •••• •••• $number';
    final last4 = number.substring(number.length - 4);
    final prefix = number.length >= 8 ? number.substring(0, 4) : '';
    return '$prefix •••• •••• $last4';
  }

  @override
  Widget build(BuildContext context) {
    final isLinked = account != null;
    final isDark = AppColors.isDark(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: isLinked
              ? (isDark ? const Color(0xFF1E40AF) : const Color(0xFFBFDBFE))
              : AppColors.border(context),
          width: isLinked ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : (isLinked ? 0.04 : 0.02)),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: isLinked ? _buildLinkedView(context) : _buildUnlinkedView(context),
        ),
      ),
    );
  }

  Widget _buildUnlinkedView(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.credit_card_off_rounded,
                color: Color(0xFFD97706),
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('sham_cash_unlinked'),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    context.tr('sham_cash_unlinked_desc'),
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onLinkOrEdit,
            icon: const Icon(Icons.add_link_rounded, size: 18),
            label: Text(context.tr('link_account')),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003882),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLinkedView(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.credit_card_rounded,
                    color: Color(0xFF16A34A),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  context.tr('sham_cash_linked'),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary(context),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'مرتبط 🟢',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16A34A),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Account Details Box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.inputFill(context),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border(context)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('full_name')}:',
                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
                  ),
                  Text(
                    account!.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('account_number')}:',
                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      _formatMaskedNumber(account!.number),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary(context),
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Edit Account Button
        Align(
          alignment: context.isRtl ? Alignment.centerLeft : Alignment.centerRight,
          child: TextButton.icon(
            onPressed: onLinkOrEdit,
            icon: Icon(Icons.edit_outlined, size: 16, color: AppColors.primary(context)),
            label: Text(
              context.tr('edit_account'),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.primary(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
