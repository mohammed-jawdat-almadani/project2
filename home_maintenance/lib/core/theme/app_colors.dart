import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Brand Colors
  static const Color primaryBlue = Color(0xFF003882);
  static const Color primaryBlueLight = Color(0xFF1E40AF);
  static const Color primaryBlueDark = Color(0xFF38BDF8); // Cyan blue for dark mode
  static const Color accentGreen = Color(0xFF16A34A);
  static const Color accentAmber = Color(0xFFD97706);
  static const Color accentRed = Color(0xFFDC2626);

  // Light Palette
  static const Color lightBackground = Color(0xFFF8F9FA);
  static const Color lightSurface = Colors.white;
  static const Color lightCard = Colors.white;
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF1E293B);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightTextMuted = Color(0xFF94A3B8);
  static const Color lightInputFill = Color(0xFFF8FAFC);

  // Dark Palette (Deep OLED Slate)
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkCard = Color(0xFF1E293B);
  static const Color darkBorder = Color(0xFF334155);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkTextMuted = Color(0xFF64748B);
  static const Color darkInputFill = Color(0xFF0B1120);

  // Context-aware color helpers
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color background(BuildContext context) =>
      isDark(context) ? darkBackground : lightBackground;

  static Color surface(BuildContext context) =>
      isDark(context) ? darkSurface : lightSurface;

  static Color card(BuildContext context) =>
      isDark(context) ? darkCard : lightCard;

  static Color border(BuildContext context) =>
      isDark(context) ? darkBorder : lightBorder;

  static Color textPrimary(BuildContext context) =>
      isDark(context) ? darkTextPrimary : lightTextPrimary;

  static Color textSecondary(BuildContext context) =>
      isDark(context) ? darkTextSecondary : lightTextSecondary;

  static Color textMuted(BuildContext context) =>
      isDark(context) ? darkTextMuted : lightTextMuted;

  static Color inputFill(BuildContext context) =>
      isDark(context) ? darkInputFill : lightInputFill;

  static Color primary(BuildContext context) =>
      isDark(context) ? primaryBlueDark : primaryBlue;
}
