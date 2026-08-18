import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isPhone;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isPassword = false,
    this.isPhone = false,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);
    final borderColor = errorText != null ? Colors.red : AppColors.border(context);
    final isError = errorText != null;

    if (isPhone) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.surface(context),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Container(
                    width: 88,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : const Color(0x5CE1E2EC),
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(11)),
                      border: isError ? const Border(right: BorderSide(color: Colors.red)) : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+963',
                          style: TextStyle(
                            color: AppColors.textPrimary(context),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 0.7,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.language, color: AppColors.textSecondary(context), size: 16),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 32,
                    color: isError ? Colors.red : AppColors.border(context),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      textAlign: context.isRtl ? TextAlign.right : TextAlign.left,
                      style: TextStyle(color: AppColors.textPrimary(context)),
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: TextStyle(
                          color: AppColors.textMuted(context),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Text(
                errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary(context),
            ),
          ),
          const SizedBox(height: 10),
        ],
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            textAlign: context.isRtl ? TextAlign.right : TextAlign.left,
            style: TextStyle(color: AppColors.textPrimary(context)),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: AppColors.textMuted(context),
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: isPassword ? Icon(Icons.visibility_off, color: AppColors.textSecondary(context), size: 22) : null,
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
