import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';

/// Custom Button Widget
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = false,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = _getButtonHeight();
    final buttonPadding = _getButtonPadding();
    final textStyle = _getTextStyle();

    Widget buttonChild = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                foregroundColor ?? _getForegroundColor(),
              ),
            ),
          )
        : Row(
            mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: _getIconSize()),
                const SizedBox(width: AppDimensions.spacing8),
              ],
              Text(text, style: textStyle),
            ],
          );

    switch (variant) {
      case AppButtonVariant.primary:
        return SizedBox(
          width: isFullWidth ? double.infinity : null,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.primary,
              foregroundColor: foregroundColor ?? AppColors.textOnDark,
              padding: buttonPadding,
              elevation: AppDimensions.elevationSM,
              shape: RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadiusMD,
              ),
            ),
            child: buttonChild,
          ),
        );

      case AppButtonVariant.secondary:
        return SizedBox(
          width: isFullWidth ? double.infinity : null,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.secondary,
              foregroundColor: foregroundColor ?? Colors.white,
              padding: buttonPadding,
              elevation: AppDimensions.elevationSM,
              shape: RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadiusMD,
              ),
            ),
            child: buttonChild,
          ),
        );

      case AppButtonVariant.outline:
        return SizedBox(
          width: isFullWidth ? double.infinity : null,
          height: buttonHeight,
          child: OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: foregroundColor ?? AppColors.primary,
              side: BorderSide(color: backgroundColor ?? AppColors.primary),
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadiusMD,
              ),
            ),
            child: buttonChild,
          ),
        );

      case AppButtonVariant.ghost:
        return SizedBox(
          width: isFullWidth ? double.infinity : null,
          height: buttonHeight,
          child: TextButton(
            onPressed: isLoading ? null : onPressed,
            style: TextButton.styleFrom(
              foregroundColor: foregroundColor ?? AppColors.primary,
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadiusMD,
              ),
            ),
            child: buttonChild,
          ),
        );

      case AppButtonVariant.destructive:
        return SizedBox(
          width: isFullWidth ? double.infinity : null,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.error,
              foregroundColor: foregroundColor ?? Colors.white,
              padding: buttonPadding,
              elevation: AppDimensions.elevationSM,
              shape: RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadiusMD,
              ),
            ),
            child: buttonChild,
          ),
        );
    }
  }

  double _getButtonHeight() {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.buttonHeightSM;
      case AppButtonSize.medium:
        return AppDimensions.buttonHeightMD;
      case AppButtonSize.large:
        return AppDimensions.buttonHeightLG;
    }
  }

  EdgeInsetsGeometry _getButtonPadding() {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.paddingHorizontalMD;
      case AppButtonSize.medium:
        return AppDimensions.paddingHorizontalLG;
      case AppButtonSize.large:
        return AppDimensions.paddingHorizontalXL;
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = switch (size) {
      AppButtonSize.small => AppTypography.buttonSmall,
      AppButtonSize.medium => AppTypography.buttonMedium,
      AppButtonSize.large => AppTypography.buttonLarge,
    };

    return baseStyle.copyWith(color: foregroundColor ?? _getForegroundColor());
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.iconSM;
      case AppButtonSize.medium:
        return AppDimensions.iconMD;
      case AppButtonSize.large:
        return AppDimensions.iconLG;
    }
  }

  Color _getForegroundColor() {
    switch (variant) {
      case AppButtonVariant.primary:
      case AppButtonVariant.secondary:
      case AppButtonVariant.destructive:
        return Colors.white;
      case AppButtonVariant.outline:
      case AppButtonVariant.ghost:
        return AppColors.primary;
    }
  }
}

/// Button Variants
enum AppButtonVariant { primary, secondary, outline, ghost, destructive }

/// Button Sizes
enum AppButtonSize { small, medium, large }

/// Icon Button Widget
class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double? size;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.size,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: color ?? AppColors.textPrimary,
      iconSize: size ?? AppDimensions.iconMD,
      tooltip: tooltip,
    );
  }
}
