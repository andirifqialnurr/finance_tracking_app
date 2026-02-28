import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../utils/formatters.dart';

/// Income vs Expense Chart (Line Chart)
class IncomeExpenseChart extends StatelessWidget {
  final List<MonthlyData> data;

  const IncomeExpenseChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.chartHeightMD,
      padding: AppDimensions.paddingMD,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1000000, // 1 million
            getDrawingHorizontalLine: (value) {
              return FlLine(color: AppColors.borderLight, strokeWidth: 1);
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value.toInt() >= data.length) return const SizedBox();
                  final monthData = data[value.toInt()];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      Formatters.formatMonthYearShort(
                        monthData.month,
                        monthData.year,
                      ),
                      style: AppTypography.labelSmall,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2000000, // 2 million
                reservedSize: 60,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return Text(
                    Formatters.formatCurrencyCompact(value),
                    style: AppTypography.labelSmall,
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: AppColors.border),
          ),
          minX: 0,
          maxX: (data.length - 1).toDouble(),
          minY: 0,
          lineBarsData: [
            // Income Line
            LineChartBarData(
              spots: data
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value.income))
                  .toList(),
              isCurved: true,
              color: AppColors.success,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.success.withValues(alpha: 0.1),
              ),
            ),
            // Expense Line
            LineChartBarData(
              spots: data
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value.expense))
                  .toList(),
              isCurved: true,
              color: AppColors.error,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.error.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Data model untuk chart
class MonthlyData {
  final int month;
  final int year;
  final double income;
  final double expense;

  MonthlyData({
    required this.month,
    required this.year,
    required this.income,
    required this.expense,
  });
}

/// Chart Legend
class ChartLegend extends StatelessWidget {
  const ChartLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendItem(color: AppColors.success, label: 'Income'),
        const SizedBox(width: AppDimensions.spacing24),
        _LegendItem(color: AppColors.error, label: 'Expense'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: AppDimensions.spacing8),
        Text(label, style: AppTypography.labelMedium),
      ],
    );
  }
}
