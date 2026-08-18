import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class DisputeReassuranceCard extends StatelessWidget {
  const DisputeReassuranceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF7F1D1D).withValues(alpha: 0.25) : const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: isDark ? const Color(0xFF991B1B) : const Color(0xFFFECACA), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: isDark ? 0.2 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shield_outlined, color: Color(0xFFDC2626), size: 22),
              const SizedBox(width: 8),
              Text(
                '${context.tr('dispute_header')} 🛡️',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isDark ? const Color(0xFFFCA5A5) : const Color(0xFF991B1B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            context.tr('dispute_reassurance_desc'),
            style: TextStyle(
              fontSize: 12,
              color: isDark ? const Color(0xFFFECACA) : const Color(0xFF7F1D1D),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
