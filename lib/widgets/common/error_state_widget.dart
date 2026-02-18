import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';

/// Error Widget untuk menampilkan error state
class ErrorStateWidget extends StatelessWidget {
  final String message;
  final String? title;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback? onRetry;

  const ErrorStateWidget({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.actionLabel,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppDimensions.paddingXL,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: AppDimensions.iconXXL,
              color: AppColors.error,
            ),
            const SizedBox(height: AppDimensions.spacing24),
            if (title != null) ...[
              Text(
                title!,
                style: AppTypography.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spacing8),
            ],
            Text(
              message,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppDimensions.spacing24),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnDark,
                  padding: AppDimensions.paddingHorizontalLG,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                ),
                child: Text(actionLabel ?? 'Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
