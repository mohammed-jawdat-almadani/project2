import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
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
    final isDark = AppColors.isDark(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
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
                    color: AppColors.border(context),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('request_withdrawal_btn')} 💸',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${context.tr('available_balance')}: ${widget.wallet.availableBalance} ${context.tr('currency')}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF16A34A),
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
                  color: AppColors.inputFill(context),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border(context)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_rounded, color: AppColors.primary(context), size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${context.isArabic ? "التحويل إلى" : "Transfer to"}: ${widget.shamCashAccount.name}',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context)),
                          ),
                          Text(
                            '${context.tr('account_number')}: ${widget.shamCashAccount.number}',
                            style: TextStyle(fontSize: 11, color: AppColors.textSecondary(context)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Amount Field
              Text(
                '${context.tr('amount_field')} (${context.tr('currency')}):',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary(context)),
                decoration: InputDecoration(
                  hintText: '100.00',
                  hintStyle: TextStyle(fontSize: 16, color: AppColors.textMuted(context)),
                  prefixIcon: Icon(Icons.attach_money_rounded, size: 22, color: AppColors.primary(context)),
                  suffixText: context.tr('currency'),
                  suffixStyle: TextStyle(color: AppColors.textSecondary(context), fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: AppColors.inputFill(context),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColors.border(context)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColors.border(context)),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return context.tr('required_field');
                  }
                  final numVal = double.tryParse(val);
                  if (numVal == null || numVal <= 0) {
                    return context.isArabic ? 'يرجى إدخال مبلغ صحيح' : 'Please enter a valid amount';
                  }
                  if (numVal < 100.0) {
                    return context.isArabic ? 'الحد الأدنى لطلب السحب هو 100.00 ل.س' : 'Minimum withdrawal is 100.00';
                  }
                  if (numVal > available) {
                    return context.isArabic ? 'المبلغ المطلوب يتجاوز الرصيد المتاح' : 'Amount exceeds available balance';
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
                    _buildQuickChip(context, 100.0, '100 ${context.tr('currency')}'),
                    _buildQuickChip(context, 250.0, '250 ${context.tr('currency')}'),
                    _buildQuickChip(context, 500.0, '500 ${context.tr('currency')}'),
                    if (available > 0)
                      Padding(
                        padding: EdgeInsets.only(
                          left: context.isRtl ? 8.0 : 0,
                          right: context.isRtl ? 0 : 8.0,
                        ),
                        child: ActionChip(
                          label: Text(context.isArabic ? 'كامل الرصيد 🌟' : 'Full Balance 🌟'),
                          backgroundColor: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary(context)),
                          side: BorderSide(color: AppColors.border(context)),
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
                  label: Text(
                    context.tr('confirm'),
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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

  Widget _buildQuickChip(BuildContext context, double amount, String label) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.isRtl ? 8.0 : 0,
        right: context.isRtl ? 0 : 8.0,
      ),
      child: ActionChip(
        label: Text(label),
        backgroundColor: AppColors.inputFill(context),
        side: BorderSide(color: AppColors.border(context)),
        labelStyle: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
        onPressed: () => _setAmount(amount),
      ),
    );
  }
}
