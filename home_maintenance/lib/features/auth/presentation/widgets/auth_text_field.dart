import 'package:flutter/material.dart';

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
    final borderColor = errorText != null ? Colors.red : const Color(0xFFC3C6D4);
    final isError = errorText != null;

    if (isPhone) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
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
                      color: const Color(0x5CE1E2EC), // 0.36 opacity
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(11)),
                      border: isError ? const Border(right: BorderSide(color: Colors.red)) : null,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+963',
                          style: TextStyle(
                            color: Color(0xFF434652),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 0.7,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.language, color: Color(0xFF434652), size: 16),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 32,
                    color: isError ? Colors.red : const Color(0xFFC3C6D4),
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: controller,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.right,
                        onChanged: onChanged,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: const TextStyle(
                            color: Color(0xFF747784),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
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
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF191C1E),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            textAlign: TextAlign.right,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: isPassword ? const Icon(Icons.visibility_off, color: Color(0xFF43474E), size: 22) : null,
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
