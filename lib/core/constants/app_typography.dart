import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App Typography Constants
/// Konsisten dengan design system shadcn/ui
class AppTypography {
  AppTypography._();

  // Font Family
  static const String fontFamily = 'SF Pro Display'; // Fallback to system font

  // Display Styles
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.12,
    letterSpacing: -0.25,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w700,
    height: 1.16,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 1.22,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  // Headline Styles
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.29,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  // Title Styles
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.27,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
  );

  // Label Styles
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
  );

  // Custom Styles for Finance App

  // Currency/Amount Styles
  static const TextStyle amountLarge = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle amountMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: -0.25,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle amountSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  // Button Styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0.5,
    fontFamily: fontFamily,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.25,
    fontFamily: fontFamily,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0.25,
    fontFamily: fontFamily,
  );

  // Caption/Helper Text
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
    color: AppColors.textMuted,
    fontFamily: fontFamily,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.6,
    letterSpacing: 1.5,
    color: AppColors.textMuted,
    fontFamily: fontFamily,
  );

  // Helper methods for text colors
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}
