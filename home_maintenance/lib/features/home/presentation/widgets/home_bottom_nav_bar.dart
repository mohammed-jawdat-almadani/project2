import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
        border: Border(
          top: BorderSide(color: AppColors.border(context), width: 1.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              index: 0,
              icon: Icons.home_rounded,
              label: context.tr('tab_home'),
              isSelected: currentIndex == 0,
            ),
            _buildNavItem(
              context,
              index: 1,
              icon: Icons.format_list_bulleted_rounded,
              label: context.tr('tab_orders'),
              isSelected: currentIndex == 1,
            ),
            _buildNavItem(
              context,
              index: 2,
              icon: Icons.account_balance_wallet_outlined,
              label: context.tr('tab_wallet'),
              isSelected: currentIndex == 2,
            ),
            _buildNavItem(
              context,
              index: 3,
              icon: Icons.person_outline_rounded,
              label: context.tr('tab_profile'),
              isSelected: currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final isDark = AppColors.isDark(context);
    final selectedBg = isDark
        ? const Color(0xFF38BDF8).withValues(alpha: 0.15)
        : const Color(0xFFD3E3FD);
    final selectedColor = isDark ? const Color(0xFF38BDF8) : const Color(0xFF003882);
    final unselectedColor = AppColors.textSecondary(context);

    return GestureDetector(
      onTap: () => onTabSelected(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: isSelected
            ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0)
            : const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? selectedColor : unselectedColor,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? selectedColor : unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
