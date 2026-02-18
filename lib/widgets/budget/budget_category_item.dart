import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../utils/formatters.dart';

/// Widget untuk menampilkan budget kategori dengan progress bar
class BudgetCategoryItem extends StatelessWidget {
  final String categoryName;
  final String categoryType;
  final double allocatedAmount;
  final double spentAmount;
  final double remainingAmount;
  final VoidCallback? onTap;

  const BudgetCategoryItem({
    super.key,
    required this.categoryName,
    required this.categoryType,
    required this.allocatedAmount,
    required this.spentAmount,
    required this.remainingAmount,
    this.onTap,
  });

  double get percentageUsed {
    if (allocatedAmount == 0) return 0;
    return (spentAmount / allocatedAmount) * 100;
  }

  Color get progressColor {
    return AppColors.getBudgetColor(percentageUsed);
  }

  Color get backgroundColor {
    return AppColors.getBudgetBackgroundColor(percentageUsed);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppDimensions.borderRadiusLG,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
        padding: AppDimensions.paddingMD,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: AppDimensions.borderRadiusLG,
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Category Name & Type
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(categoryName, style: AppTypography.titleMedium),
                      const SizedBox(height: AppDimensions.spacing4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.spacing8,
                          vertical: AppDimensions.spacing4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppDimensions.borderRadiusSM,
                        ),
                        child: Text(
                          categoryType,
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Percentage Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing12,
                    vertical: AppDimensions.spacing8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: Text(
                    Formatters.formatPercentage(percentageUsed),
                    style: AppTypography.labelMedium.copyWith(
                      color: progressColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacing16),

            // Progress Bar
            ClipRRect(
              borderRadius: AppDimensions.borderRadiusSM,
              child: LinearProgressIndicator(
                value: percentageUsed / 100,
                backgroundColor: AppColors.borderLight,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: AppDimensions.progressBarHeight,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing12),

            // Amount Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _AmountInfo(
                  label: 'Spent',
                  amount: spentAmount,
                  color: AppColors.textPrimary,
                ),
                _AmountInfo(
                  label: 'Remaining',
                  amount: remainingAmount,
                  color: progressColor,
                ),
                _AmountInfo(
                  label: 'Budget',
                  amount: allocatedAmount,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AmountInfo extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _AmountInfo({
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(height: AppDimensions.spacing4),
        Text(
          Formatters.formatCurrencyCompact(amount),
          style: AppTypography.labelMedium.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
