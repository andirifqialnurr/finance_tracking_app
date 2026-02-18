import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

/// Custom Card Widget menggunakan Material Design
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Border? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.elevation,
    this.borderRadius,
    this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      padding: padding ?? AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: color ?? AppColors.card,
        borderRadius: borderRadius ?? AppDimensions.borderRadiusLG,
        border: border ?? Border.all(color: AppColors.cardBorder),
        boxShadow: elevation != null && elevation! > 0
            ? [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: elevation!,
                  offset: Offset(0, elevation! / 2),
                ),
              ]
            : [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: AppDimensions.elevationSM,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      child: child,
    );

    if (onTap != null) {
      cardContent = InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? AppDimensions.borderRadiusLG,
        child: cardContent,
      );
    }

    if (margin != null) {
      return Padding(padding: margin!, child: cardContent);
    }

    return cardContent;
  }
}

/// Card variant without shadow (flat)
class AppCardFlat extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  const AppCardFlat({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      padding: padding ?? AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: color ?? AppColors.card,
        borderRadius: borderRadius ?? AppDimensions.borderRadiusLG,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: child,
    );

    if (onTap != null) {
      cardContent = InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? AppDimensions.borderRadiusLG,
        child: cardContent,
      );
    }

    if (margin != null) {
      return Padding(padding: margin!, child: cardContent);
    }

    return cardContent;
  }
}

/// Card variant dengan gradient background
class AppCardGradient extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient gradient;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  const AppCardGradient({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.gradient = AppColors.primaryGradient,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      padding: padding ?? AppDimensions.paddingMD,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius ?? AppDimensions.borderRadiusLG,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimensions.elevationMD,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );

    if (onTap != null) {
      cardContent = InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? AppDimensions.borderRadiusLG,
        child: cardContent,
      );
    }

    if (margin != null) {
      return Padding(padding: margin!, child: cardContent);
    }

    return cardContent;
  }
}
