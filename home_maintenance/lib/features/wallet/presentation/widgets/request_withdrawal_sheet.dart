import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/sham_cash_account.dart';
import '../../domain/entities/wallet_info.dart';
import '../bloc/wallet_bloc.dart';
import '../bloc/wallet_event.dart';

class RequestWithdrawalSheet extends StatefulWidget {
  final WalletInfo wallet;
  final ShamCashAccount shamCashAccount;

  const RequestWithdrawalSheet({
    super.key,
    required this.wallet,
    required this.shamCashAccount,
  });

  @override
  State<RequestWithdrawalSheet> createState() => _RequestWithdrawalSheetState();
}

class _RequestWithdrawalSheetState extends State<RequestWithdrawalSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final amount = _amountController.text.trim();
      context.read<WalletBloc>().add(WalletEvent.requestWithdrawal(amount));
      Navigator.of(context).pop();
    }
  }

  void _setAmount(double val) {
    _amountController.text = val.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final available = double.tryParse(widget.wallet.availableBalance) ?? 0.0;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        14,
        20,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
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

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'طلب سحب أرباح 💸',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'المتاح: ${widget.wallet.availableBalance} ل.س',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF16A34A),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Payout Destination Preview
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.account_balance_rounded, color: Color(0xFF003882), size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'التحويل إلى: ${widget.shamCashAccount.name}',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                          ),
                          Text(
                            'حساب رقم: ${widget.shamCashAccount.number}',
                            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Amount Field
              const Text(
                'المبلغ المراد سحبه (ل.س):',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003882)),
                decoration: InputDecoration(
                  hintText: '100.00',
                  hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF94A3B8)),
                  prefixIcon: const Icon(Icons.attach_money_rounded, size: 22, color: Color(0xFF003882)),
                  suffixText: 'ل.س',
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'يرجى إدخال المبلغ';
                  }
                  final numVal = double.tryParse(val);
                  if (numVal == null || numVal <= 0) {
                    return 'يرجى إدخال مبلغ صحيح';
                  }
                  if (numVal < 100.0) {
                    return 'الحد الأدنى لطلب السحب هو 100.00 ل.س';
                  }
                  if (numVal > available) {
                    return 'المبلغ المطلوب يتجاوز الرصيد المتاح';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              // Quick Amount Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuickChip(100.0, '100 ل.س'),
                    _buildQuickChip(250.0, '250 ل.س'),
                    _buildQuickChip(500.0, '500 ل.س'),
                    if (available > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ActionChip(
                          label: const Text('كامل الرصيد 🌟'),
                          backgroundColor: const Color(0xFFEEF2FF),
                          labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF003882)),
                          onPressed: () => _setAmount(available),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.check_circle_outline_rounded, size: 20),
                  label: const Text(
                    'تأكيد إرسال طلب السحب',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003882),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickChip(double amount, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ActionChip(
        label: Text(label),
        backgroundColor: const Color(0xFFF1F5F9),
        labelStyle: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
        onPressed: () => _setAmount(amount),
      ),
    );
  }
}
