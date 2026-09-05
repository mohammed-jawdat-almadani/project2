import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/sham_cash_account.dart';
import '../bloc/wallet_bloc.dart';
import '../bloc/wallet_event.dart';

class LinkShamCashDialog extends StatefulWidget {
  final ShamCashAccount? initialAccount;

  const LinkShamCashDialog({
    super.key,
    this.initialAccount,
  });

  @override
  State<LinkShamCashDialog> createState() => _LinkShamCashDialogState();
}

class _LinkShamCashDialogState extends State<LinkShamCashDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialAccount?.name ?? '');
    _numberController = TextEditingController(text: widget.initialAccount?.number ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final number = _numberController.text.trim();

      context.read<WalletBloc>().add(
            WalletEvent.setShamCashAccount(name: name, number: number),
          );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initialAccount != null;
    final isDark = AppColors.isDark(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      backgroundColor: AppColors.surface(context),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.credit_card_rounded,
                      color: AppColors.primary(context),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isEditing ? context.tr('edit_account') : context.tr('link_account'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text(
                context.isArabic
                    ? 'أدخل بيانات حسابك في شام كاش بدقة ليتم تحويل مبالغ السحب إليه مباشرة:'
                    : 'Enter your Sham Cash details accurately for direct withdrawal transfers:',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context), height: 1.4),
              ),
              const SizedBox(height: 16),

              // Name Field
              Text(
                context.tr('full_name'),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: AppColors.textPrimary(context)),
                decoration: InputDecoration(
                  hintText: context.isArabic ? 'مثال: محمد أحمد المهندس' : 'e.g. John Doe',
                  hintStyle: TextStyle(fontSize: 13, color: AppColors.textMuted(context)),
                  prefixIcon: Icon(Icons.person_outline_rounded, size: 20, color: AppColors.textSecondary(context)),
                  filled: true,
                  fillColor: AppColors.inputFill(context),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border(context)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border(context)),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return context.tr('required_field');
                  }
                  return null;
                },
              ),

              const SizedBox(height: 14),

              // Account Number Field
              Text(
                context.tr('account_number'),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: AppColors.textPrimary(context)),
                decoration: InputDecoration(
                  hintText: '1234567890123456',
                  hintStyle: TextStyle(fontSize: 13, color: AppColors.textMuted(context)),
                  prefixIcon: Icon(Icons.tag_rounded, size: 20, color: AppColors.textSecondary(context)),
                  filled: true,
                  fillColor: AppColors.inputFill(context),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border(context)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border(context)),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return context.tr('required_field');
                  }
                  return null;
                },
              ),

              const SizedBox(height: 22),

              // Action Buttons
              Row(
                children: [
                  Expanded(
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
                      child: Text(context.tr('cancel')),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003882),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(context.tr('save')),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
