import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../utils/formatters.dart';

/// Widget untuk menampilkan setiap item expense
class ExpenseListItem extends StatelessWidget {
  final String categoryName;
  final double amount;
  final DateTime date;
  final String? description;
  final IconData? categoryIcon;
  final Color? categoryColor;
  final VoidCallback? onTap;

  const ExpenseListItem({
    super.key,
    required this.categoryName,
    required this.amount,
    required this.date,
    this.description,
    this.categoryIcon,
    this.categoryColor,
    this.onTap,
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
          color: AppColors.card,
          borderRadius: AppDimensions.borderRadiusLG,
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          children: [
            // Category Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: (categoryColor ?? AppColors.error).withOpacity(0.1),
                borderRadius: AppDimensions.borderRadiusMD,
              ),
              child: Icon(
                categoryIcon ?? Icons.shopping_bag_outlined,
                color: categoryColor ?? AppColors.error,
                size: AppDimensions.iconMD,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),

            // Category & Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(categoryName, style: AppTypography.titleSmall),
                  const SizedBox(height: AppDimensions.spacing4),
                  if (description != null && description!.isNotEmpty)
                    Text(
                      description!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    Text(
                      Formatters.formatRelativeDate(date),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                ],
              ),
            ),

            // Amount & Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '- ${Formatters.formatCurrency(amount)}',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing4),
                Text(
                  Formatters.formatDate(date),
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
