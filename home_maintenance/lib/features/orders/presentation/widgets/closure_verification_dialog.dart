import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class ClosureVerificationDialog extends StatefulWidget {
  final int orderId;
  final Function(int orderId, String code) onVerify;

  const ClosureVerificationDialog({
    super.key,
    required this.orderId,
    required this.onVerify,
  });

  @override
  State<ClosureVerificationDialog> createState() => _ClosureVerificationDialogState();
}

class _ClosureVerificationDialogState extends State<ClosureVerificationDialog> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onVerify(widget.orderId, _codeController.text.trim());
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.surface(context),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified_rounded,
                  color: Color(0xFF16A34A),
                  size: 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                context.tr('enter_closure_code_btn'),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                context.isArabic
                    ? 'اطلب كود الإغلاق الرقمي من العميل وأدخله هنا لتحويل الطلب إلى مكتمل وإيداع المستحقات في محفظتك 💼'
                    : 'Request the closure code from the client and enter it here to complete the order.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context), height: 1.4),
              ),
              const SizedBox(height: 18),

              // Code Input Field
              TextFormField(
                controller: _codeController,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4.0,
                  color: AppColors.primary(context),
                ),
                decoration: InputDecoration(
                  hintText: context.tr('closure_code'),
                  hintStyle: TextStyle(fontSize: 14, letterSpacing: 0, color: AppColors.textSecondary(context)),
                  filled: true,
                  fillColor: AppColors.inputFill(context),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
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
                  if (val == null || val.trim().isEmpty) return context.tr('required_field');
                  return null;
                },
              ),

              const SizedBox(height: 20),

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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(context.tr('cancel')),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16A34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(context.tr('confirm')),
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
