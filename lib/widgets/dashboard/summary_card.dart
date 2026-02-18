import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_typography.dart';
import '../../../utils/formatters.dart';

/// Summary Card untuk menampilkan angka summary di Dashboard
class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppDimensions.paddingMD,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.card,
          borderRadius: AppDimensions.borderRadiusLG,
          border: Border.all(color: AppColors.cardBorder),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: AppDimensions.elevationSM,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing8),
                  decoration: BoxDecoration(
                    color: (iconColor ?? AppColors.primary).withOpacity(0.1),
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: Icon(
                    icon,
                    size: AppDimensions.iconMD,
                    color: iconColor ?? AppColors.primary,
                  ),
                ),
                const Spacer(),
                if (onTap != null)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimensions.iconXS,
                    color: AppColors.textMuted,
                  ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacing8),
            Text(
              title,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              Formatters.formatCurrency(amount),
              style: AppTypography.amountMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Summary Card Gradient Variant
class SummaryCardGradient extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback? onTap;

  const SummaryCardGradient({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    this.gradient = AppColors.primaryGradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppDimensions.paddingMD,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: AppDimensions.borderRadiusLG,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowDark,
              blurRadius: AppDimensions.elevationMD,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: Icon(
                    icon,
                    size: AppDimensions.iconMD,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                if (onTap != null)
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimensions.iconXS,
                    color: Colors.white,
                  ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacing8),
            Text(
              title,
              style: AppTypography.labelMedium.copyWith(
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            Text(
              Formatters.formatCurrency(amount),
              style: AppTypography.amountMedium.copyWith(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
