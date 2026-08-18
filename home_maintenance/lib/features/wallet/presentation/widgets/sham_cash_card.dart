import 'package:flutter/material.dart';
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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: isLinked ? const Color(0xFFBFDBFE) : const Color(0xFFE2E8F0),
          width: isLinked ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isLinked ? 0.04 : 0.02),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFFEF3C7),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.credit_card_off_rounded,
                color: Color(0xFFD97706),
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حساب شام كاش (غير مرتبط)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'يرجى ربط حسابك لاستقبال مبالغ السحب',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
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
            label: const Text('ربط حساب شام كاش الآن'),
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
                  decoration: const BoxDecoration(
                    color: Color(0xFFDCFCE7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.credit_card_rounded,
                    color: Color(0xFF16A34A),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'حساب شام كاش المعتمد',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'مرتبط ونشط 🟢',
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
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'الاسم الثلاثي:',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                  Text(
                    account!.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'رقم / معرف الحساب:',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      _formatMaskedNumber(account!.number),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003882),
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
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: onLinkOrEdit,
            icon: const Icon(Icons.edit_outlined, size: 16, color: Color(0xFF003882)),
            label: const Text(
              'تعديل بيانات الحساب',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003882),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
