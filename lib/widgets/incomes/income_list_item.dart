import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../utils/formatters.dart';

/// Widget untuk menampilkan setiap item income
class IncomeListItem extends StatelessWidget {
  final String source;
  final double amount;
  final DateTime date;
  final String? description;
  final VoidCallback? onTap;

  const IncomeListItem({
    super.key,
    required this.source,
    required this.amount,
    required this.date,
    this.description,
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
            // Income Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: AppDimensions.borderRadiusMD,
              ),
              child: const Icon(
                Icons.arrow_downward,
                color: AppColors.success,
                size: AppDimensions.iconMD,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),

            // Source & Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(source, style: AppTypography.titleSmall),
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
                  '+ ${Formatters.formatCurrency(amount)}',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.success,
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
