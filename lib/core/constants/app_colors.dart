import 'package:flutter/material.dart';

/// App Color Constants
/// Menggunakan color palette yang konsisten dengan shadcn/ui
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF0F172A); // Slate 900
  static const Color primaryDark = Color(0xFF020617); // Slate 950
  static const Color primaryLight = Color(0xFF1E293B); // Slate 800

  // Secondary Colors
  static const Color secondary = Color(0xFF6366F1); // Indigo 500
  static const Color secondaryDark = Color(0xFF4F46E5); // Indigo 600
  static const Color secondaryLight = Color(0xFF818CF8); // Indigo 400

  // Background Colors
  static const Color background = Color(0xFFFFFFFF); // White
  static const Color backgroundDark = Color(0xFF0F172A); // Slate 900
  static const Color surface = Color(0xFFF8FAFC); // Slate 50
  static const Color surfaceDark = Color(0xFF1E293B); // Slate 800

  // Card Colors
  static const Color card = Color(0xFFFFFFFF); // White
  static const Color cardBorder = Color(0xFFE2E8F0); // Slate 200
  static const Color cardDisabled = Color(0xFFF1F5F9); // Slate 100
  static const Color cardBorderDisabled = Color(0xFFCBD5E1); // Slate 300

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A); // Slate 900
  static const Color textSecondary = Color(0xFF64748B); // Slate 500
  static const Color textMuted = Color(0xFF94A3B8); // Slate 400
  static const Color textOnDark = Color(0xFFF8FAFC); // Slate 50

  // Status Colors - Success
  static const Color success = Color(0xFF10B981); // Green 500
  static const Color successLight = Color(0xFF34D399); // Green 400
  static const Color successDark = Color(0xFF059669); // Green 600
  static const Color successBackground = Color(0xFFECFDF5); // Green 50

  // Status Colors - Warning
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color warningLight = Color(0xFFFBBF24); // Amber 400
  static const Color warningDark = Color(0xFFD97706); // Amber 600
  static const Color warningBackground = Color(0xFFFFFBEB); // Amber 50

  // Status Colors - Error/Danger
  static const Color error = Color(0xFFEF4444); // Red 500
  static const Color errorLight = Color(0xFFF87171); // Red 400
  static const Color errorDark = Color(0xFFDC2626); // Red 600
  static const Color errorBackground = Color(0xFFFEF2F2); // Red 50

  // Status Colors - Info
  static const Color info = Color(0xFF3B82F6); // Blue 500
  static const Color infoLight = Color(0xFF60A5FA); // Blue 400
  static const Color infoDark = Color(0xFF2563EB); // Blue 600
  static const Color infoBackground = Color(0xFFEFF6FF); // Blue 50

  // Border Colors
  static const Color border = Color(0xFFE2E8F0); // Slate 200
  static const Color borderLight = Color(0xFFF1F5F9); // Slate 100
  static const Color borderDark = Color(0xFFCBD5E1); // Slate 300

  // Input Colors
  static const Color inputBackground = Color(0xFFFFFFFF); // White
  static const Color inputBorder = Color(0xFFE2E8F0); // Slate 200
  static const Color inputBorderFocus = Color(0xFF6366F1); // Indigo 500
  static const Color inputPlaceholder = Color(0xFF94A3B8); // Slate 400

  // Chart Colors
  static const Color chartPrimary = Color(0xFF6366F1); // Indigo 500
  static const Color chartSecondary = Color(0xFF8B5CF6); // Violet 500
  static const Color chartTertiary = Color(0xFFEC4899); // Pink 500
  static const Color chartQuaternary = Color(0xFF10B981); // Green 500
  static const Color chartQuinary = Color(0xFFF59E0B); // Amber 500

  // Budget Progress Colors
  static const Color budgetLow = Color(0xFF10B981); // Green 500 (< 50%)
  static const Color budgetMedium = Color(0xFFF59E0B); // Amber 500 (50-80%)
  static const Color budgetHigh = Color(0xFFEF4444); // Red 500 (> 80%)

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF34D399)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadows
  static const Color shadowLight = Color(0x0F000000); // 6% opacity
  static const Color shadow = Color(0x1A000000); // 10% opacity
  static const Color shadowDark = Color(0x33000000); // 20% opacity

  // Divider
  static const Color divider = Color(0xFFE2E8F0); // Slate 200

  /// Get budget color based on usage percentage
  static Color getBudgetColor(double percentage) {
    if (percentage < 50) return budgetLow;
    if (percentage < 80) return budgetMedium;
    return budgetHigh;
  }

  /// Get budget background color based on usage percentage
  static Color getBudgetBackgroundColor(double percentage) {
    if (percentage < 50) return successBackground;
    if (percentage < 80) return warningBackground;
    return errorBackground;
  }
}
