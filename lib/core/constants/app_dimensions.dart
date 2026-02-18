import 'package:flutter/material.dart';

/// App Dimensions & Spacing Constants
/// Menggunakan spacing system yang konsisten (4px, 8px, 12px, 16px, 24px, 32px, 48px, 64px)
class AppDimensions {
  AppDimensions._();

  // Spacing Scale (based on 4px grid)
  static const double spacing2 = 2.0;
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;
  static const double spacing56 = 56.0;
  static const double spacing64 = 64.0;
  static const double spacing80 = 80.0;

  // Padding
  static const EdgeInsets paddingZero = EdgeInsets.zero;
  static const EdgeInsets paddingXS = EdgeInsets.all(spacing4);
  static const EdgeInsets paddingSM = EdgeInsets.all(spacing8);
  static const EdgeInsets paddingMD = EdgeInsets.all(spacing16);
  static const EdgeInsets paddingLG = EdgeInsets.all(spacing24);
  static const EdgeInsets paddingXL = EdgeInsets.all(spacing32);
  static const EdgeInsets paddingXXL = EdgeInsets.all(spacing48);

  // Horizontal Padding
  static const EdgeInsets paddingHorizontalXS = EdgeInsets.symmetric(
    horizontal: spacing4,
  );
  static const EdgeInsets paddingHorizontalSM = EdgeInsets.symmetric(
    horizontal: spacing8,
  );
  static const EdgeInsets paddingHorizontalMD = EdgeInsets.symmetric(
    horizontal: spacing16,
  );
  static const EdgeInsets paddingHorizontalLG = EdgeInsets.symmetric(
    horizontal: spacing24,
  );
  static const EdgeInsets paddingHorizontalXL = EdgeInsets.symmetric(
    horizontal: spacing32,
  );

  // Vertical Padding
  static const EdgeInsets paddingVerticalXS = EdgeInsets.symmetric(
    vertical: spacing4,
  );
  static const EdgeInsets paddingVerticalSM = EdgeInsets.symmetric(
    vertical: spacing8,
  );
  static const EdgeInsets paddingVerticalMD = EdgeInsets.symmetric(
    vertical: spacing16,
  );
  static const EdgeInsets paddingVerticalLG = EdgeInsets.symmetric(
    vertical: spacing24,
  );
  static const EdgeInsets paddingVerticalXL = EdgeInsets.symmetric(
    vertical: spacing32,
  );

  // Screen Padding
  static const EdgeInsets screenPadding = EdgeInsets.all(spacing16);
  static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(
    horizontal: spacing16,
  );
  static const EdgeInsets screenPaddingVertical = EdgeInsets.symmetric(
    vertical: spacing16,
  );

  // Border Radius
  static const double radiusNone = 0.0;
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 24.0;
  static const double radiusFull = 9999.0;

  // Border Radius Objects
  static const BorderRadius borderRadiusNone = BorderRadius.zero;
  static const BorderRadius borderRadiusSM = BorderRadius.all(
    Radius.circular(radiusSM),
  );
  static const BorderRadius borderRadiusMD = BorderRadius.all(
    Radius.circular(radiusMD),
  );
  static const BorderRadius borderRadiusLG = BorderRadius.all(
    Radius.circular(radiusLG),
  );
  static const BorderRadius borderRadiusXL = BorderRadius.all(
    Radius.circular(radiusXL),
  );
  static const BorderRadius borderRadiusXXL = BorderRadius.all(
    Radius.circular(radiusXXL),
  );
  static const BorderRadius borderRadiusFull = BorderRadius.all(
    Radius.circular(radiusFull),
  );

  // Border Width
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 2.0;
  static const double borderWidthThick = 3.0;

  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconSM = 20.0;
  static const double iconMD = 24.0;
  static const double iconLG = 32.0;
  static const double iconXL = 48.0;
  static const double iconXXL = 64.0;

  // Button Heights
  static const double buttonHeightSM = 32.0;
  static const double buttonHeightMD = 40.0;
  static const double buttonHeightLG = 48.0;
  static const double buttonHeightXL = 56.0;

  // Input Heights
  static const double inputHeightSM = 36.0;
  static const double inputHeightMD = 44.0;
  static const double inputHeightLG = 52.0;

  // Card Heights
  static const double cardHeightSM = 80.0;
  static const double cardHeightMD = 120.0;
  static const double cardHeightLG = 160.0;

  // Avatar Sizes
  static const double avatarSM = 32.0;
  static const double avatarMD = 48.0;
  static const double avatarLG = 64.0;
  static const double avatarXL = 96.0;

  // Elevation/Shadow
  static const double elevationNone = 0.0;
  static const double elevationSM = 2.0;
  static const double elevationMD = 4.0;
  static const double elevationLG = 8.0;
  static const double elevationXL = 16.0;

  // App Bar Height
  static const double appBarHeight = 56.0;
  static const double appBarHeightLarge = 64.0;

  // Bottom Nav Bar Height
  static const double bottomNavBarHeight = 64.0;

  // Tab Bar Height
  static const double tabBarHeight = 48.0;

  // Divider
  static const double dividerThickness = 1.0;
  static const double dividerIndent = spacing16;

  // Max Width for responsive layouts
  static const double maxWidthMobile = 480.0;
  static const double maxWidthTablet = 768.0;
  static const double maxWidthDesktop = 1024.0;
  static const double maxWidthWide = 1440.0;

  // Chart Dimensions
  static const double chartHeightSM = 120.0;
  static const double chartHeightMD = 200.0;
  static const double chartHeightLG = 300.0;
  static const double chartHeightXL = 400.0;

  // Progress Indicator
  static const double progressIndicatorSize = 24.0;
  static const double progressIndicatorSizeLarge = 48.0;
  static const double progressBarHeight = 8.0;

  // Helper Methods
  static double getResponsiveValue(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width >= maxWidthDesktop && desktop != null) return desktop;
    if (width >= maxWidthTablet && tablet != null) return tablet;
    return mobile;
  }

  static EdgeInsets getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= maxWidthDesktop) return paddingXL;
    if (width >= maxWidthTablet) return paddingLG;
    return paddingMD;
  }
}
