import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import '../constants/app_dimensions.dart';

/// App Theme Configuration
/// Mengintegrasikan shadcn UI dengan custom theme kita
class AppTheme {
  AppTheme._();

  // Light Theme
  static ShadThemeData lightTheme() {
    return ShadThemeData(
      brightness: Brightness.light,
      colorScheme: const ShadSlateColorScheme.light(),

      // Text Theme
      textTheme: ShadTextTheme(
        h1Large: AppTypography.displayLarge,
        h1: AppTypography.displayMedium,
        h2: AppTypography.displaySmall,
        h3: AppTypography.headlineLarge,
        h4: AppTypography.headlineMedium,
        p: AppTypography.bodyLarge,
        blockquote: AppTypography.bodyMedium,
        table: AppTypography.bodyMedium,
        list: AppTypography.bodyMedium,
        lead: AppTypography.titleLarge.copyWith(color: AppColors.textSecondary),
        large: AppTypography.bodyLarge.copyWith(fontSize: 18),
        small: AppTypography.bodySmall,
        muted: AppTypography.bodyMedium.copyWith(color: AppColors.textMuted),
      ),

      // Button Theme
      primaryButtonTheme: const ShadButtonTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnDark,
        hoverBackgroundColor: AppColors.primaryDark,
      ),

      secondaryButtonTheme: const ShadButtonTheme(
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        hoverBackgroundColor: AppColors.secondaryDark,
      ),

      // Input Theme
      inputTheme: ShadInputTheme(
        style: AppTypography.bodyMedium,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: AppColors.inputBorder,
            width: AppDimensions.borderWidthThin,
            radius: BorderRadius.circular(AppDimensions.radiusMD),
          ),
          focusedBorder: ShadBorder.all(
            color: AppColors.inputBorderFocus,
            width: AppDimensions.borderWidthMedium,
            radius: BorderRadius.circular(AppDimensions.radiusMD),
          ),
        ),
      ),

      // Card Theme
      cardTheme: ShadCardTheme(
        backgroundColor: AppColors.card,
        border: ShadBorder.all(
          color: AppColors.cardBorder,
          width: AppDimensions.borderWidthThin,
          radius: BorderRadius.circular(AppDimensions.radiusLG),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimensions.elevationSM,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }

  // Dark Theme
  static ShadThemeData darkTheme() {
    return ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: const ShadSlateColorScheme.dark(),

      // Text Theme
      textTheme: ShadTextTheme(
        h1Large: AppTypography.displayLarge.copyWith(
          color: AppColors.textOnDark,
        ),
        h1: AppTypography.displayMedium.copyWith(color: AppColors.textOnDark),
        h2: AppTypography.displaySmall.copyWith(color: AppColors.textOnDark),
        h3: AppTypography.headlineLarge.copyWith(color: AppColors.textOnDark),
        h4: AppTypography.headlineMedium.copyWith(color: AppColors.textOnDark),
        p: AppTypography.bodyLarge.copyWith(color: AppColors.textOnDark),
        blockquote: AppTypography.bodyMedium.copyWith(
          color: AppColors.textMuted,
        ),
        table: AppTypography.bodyMedium.copyWith(color: AppColors.textOnDark),
        list: AppTypography.bodyMedium.copyWith(color: AppColors.textOnDark),
        lead: AppTypography.titleLarge.copyWith(color: AppColors.textMuted),
        large: AppTypography.bodyLarge.copyWith(
          fontSize: 18,
          color: AppColors.textOnDark,
        ),
        small: AppTypography.bodySmall.copyWith(color: AppColors.textMuted),
        muted: AppTypography.bodyMedium.copyWith(color: AppColors.textMuted),
      ),

      // Button Theme
      primaryButtonTheme: const ShadButtonTheme(
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        hoverBackgroundColor: AppColors.secondaryDark,
      ),

      secondaryButtonTheme: ShadButtonTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textOnDark,
        hoverBackgroundColor: AppColors.primaryLight,
      ),
    );
  }

  // Material Theme (for widgets that still need Material theme)
  static ThemeData materialLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: AppColors.textOnDark,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: AppDimensions.elevationSM,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          side: const BorderSide(color: AppColors.cardBorder),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: AppDimensions.dividerThickness,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,
        contentPadding: AppDimensions.paddingMD,
        border: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusMD,
          borderSide: const BorderSide(
            color: AppColors.inputBorderFocus,
            width: AppDimensions.borderWidthMedium,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.inputPlaceholder,
        ),
        labelStyle: AppTypography.labelMedium,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnDark,
          elevation: AppDimensions.elevationSM,
          padding: AppDimensions.paddingHorizontalLG,
          minimumSize: const Size(0, AppDimensions.buttonHeightMD),
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadiusMD,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: AppDimensions.paddingHorizontalMD,
          minimumSize: const Size(0, AppDimensions.buttonHeightMD),
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadiusMD,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.border),
          padding: AppDimensions.paddingHorizontalLG,
          minimumSize: const Size(0, AppDimensions.buttonHeightMD),
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadiusMD,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: AppTypography.displayLarge,
        displayMedium: AppTypography.displayMedium,
        displaySmall: AppTypography.displaySmall,
        headlineLarge: AppTypography.headlineLarge,
        headlineMedium: AppTypography.headlineMedium,
        headlineSmall: AppTypography.headlineSmall,
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
      ),
    );
  }

  static ThemeData materialDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.secondary,
        secondary: AppColors.secondaryLight,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textOnDark,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textOnDark,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: AppColors.textOnDark,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(
          color: AppColors.textOnDark,
        ),
        displayMedium: AppTypography.displayMedium.copyWith(
          color: AppColors.textOnDark,
        ),
        displaySmall: AppTypography.displaySmall.copyWith(
          color: AppColors.textOnDark,
        ),
        headlineLarge: AppTypography.headlineLarge.copyWith(
          color: AppColors.textOnDark,
        ),
        headlineMedium: AppTypography.headlineMedium.copyWith(
          color: AppColors.textOnDark,
        ),
        headlineSmall: AppTypography.headlineSmall.copyWith(
          color: AppColors.textOnDark,
        ),
        titleLarge: AppTypography.titleLarge.copyWith(
          color: AppColors.textOnDark,
        ),
        titleMedium: AppTypography.titleMedium.copyWith(
          color: AppColors.textOnDark,
        ),
        titleSmall: AppTypography.titleSmall.copyWith(
          color: AppColors.textOnDark,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: AppColors.textOnDark,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: AppColors.textOnDark,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(color: AppColors.textMuted),
        labelLarge: AppTypography.labelLarge.copyWith(
          color: AppColors.textOnDark,
        ),
        labelMedium: AppTypography.labelMedium.copyWith(
          color: AppColors.textOnDark,
        ),
        labelSmall: AppTypography.labelSmall.copyWith(
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}
