import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/office.dart';

class OfficeCard extends StatelessWidget {
  final Office office;

  const OfficeCard({
    super.key,
    required this.office,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFDFE5F2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Office Name
          Text(
            office.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary(context),
            ),
          ),
          const SizedBox(height: 12),
          // Address Row
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primary(context),
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  office.address,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Phone Row
          Row(
            children: [
              Icon(
                Icons.phone_outlined,
                color: AppColors.primary(context),
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  office.phone,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
