import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class WaitingForPartsDialog extends StatefulWidget {
  final int orderId;
  final Function(int orderId, String note) onConfirm;

  const WaitingForPartsDialog({
    super.key,
    required this.orderId,
    required this.onConfirm,
  });

  @override
  State<WaitingForPartsDialog> createState() => _WaitingForPartsDialogState();
}

class _WaitingForPartsDialogState extends State<WaitingForPartsDialog> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noteController.text = 'بانتظار تأمين قطعة الغيار من المورد (~2 يوم)';
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onConfirm(widget.orderId, _noteController.text.trim());
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.hourglass_top_rounded,
                      color: Color(0xFFD97706),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    context.tr('waiting_for_parts_title'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // 72 Hours Guarantee Info Card
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: isDark ? const Color(0xFF2563EB) : const Color(0xFFBFDBFE)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline_rounded, color: Color(0xFF38BDF8), size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        context.tr('waiting_for_parts_desc'),
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? const Color(0xFFBAE6FD) : const Color(0xFF1E40AF),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Note Field
              Text(
                '${context.tr('notes')}:',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context)),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _noteController,
                maxLines: 2,
                style: TextStyle(color: AppColors.textPrimary(context)),
                decoration: InputDecoration(
                  hintText: context.tr('notes'),
                  filled: true,
                  fillColor: AppColors.inputFill(context),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.border(context))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.border(context))),
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
                        backgroundColor: const Color(0xFFD97706),
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
