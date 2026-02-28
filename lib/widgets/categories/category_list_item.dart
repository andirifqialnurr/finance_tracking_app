import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/expense_category.dart';
import '../../utils/formatters.dart';

class CategoryListItem extends StatelessWidget {
  final ExpenseCategory category;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggle;

  const CategoryListItem({
    super.key,
    required this.category,
    this.onTap,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppDimensions.borderRadiusLG,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
        padding: AppDimensions.paddingMD,
        decoration: BoxDecoration(
          color: category.isActive ? AppColors.card : AppColors.cardDisabled,
          borderRadius: AppDimensions.borderRadiusLG,
          border: Border.all(
            color: category.isActive
                ? AppColors.cardBorder
                : AppColors.cardBorderDisabled,
          ),
        ),
        child: Row(
          children: [
            // Category Icon & Color
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: category.isActive
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.textMuted.withValues(alpha: 0.1),
                borderRadius: AppDimensions.borderRadiusMD,
              ),
              child: Icon(
                _getCategoryIcon(category.type),
                color: category.isActive
                    ? AppColors.primary
                    : AppColors.textMuted,
                size: AppDimensions.iconMD,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),

            // Category Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          category.name,
                          style: AppTypography.titleSmall.copyWith(
                            color: category.isActive
                                ? AppColors.textPrimary
                                : AppColors.textMuted,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppDimensions.spacing8),
                      _buildTypeBadge(category.type),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(
                    'Budget: ${Formatters.formatCurrency(category.monthlyBudget)}',
                    style: AppTypography.bodySmall.copyWith(
                      color: category.isActive
                          ? AppColors.textSecondary
                          : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(
                    'Priority: ${category.allocationPriority}',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),

            // Toggle Switch
            if (onToggle != null)
              Switch(
                value: category.isActive,
                onChanged: onToggle,
                activeThumbColor: AppColors.success,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeBadge(CategoryType type) {
    Color color;
    String label;

    switch (type) {
      case CategoryType.subscription:
        color = AppColors.info;
        label = 'SUB';
        break;
      case CategoryType.dailyContinuous:
        color = AppColors.warning;
        label = 'DAILY';
        break;
      case CategoryType.usageBased:
        color = AppColors.primary;
        label = 'USAGE';
        break;
      case CategoryType.oneTime:
        color = AppColors.error;
        label = 'ONE-TIME';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing8,
        vertical: AppDimensions.spacing4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: AppDimensions.borderRadiusSM,
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  IconData _getCategoryIcon(CategoryType type) {
    switch (type) {
      case CategoryType.subscription:
        return Icons.subscriptions_outlined;
      case CategoryType.dailyContinuous:
        return Icons.trending_up_outlined;
      case CategoryType.usageBased:
        return Icons.sync_outlined;
      case CategoryType.oneTime:
        return Icons.shopping_bag_outlined;
    }
  }
}
