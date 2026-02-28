import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/report.dart';
import '../../providers/report_provider.dart';
import '../../utils/app_toast.dart';
import '../../widgets/common/app_button.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  DateTime _selectedMonthForMonthly = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  );
  int _selectedYearForYearly = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Reports'),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'Monthly Report'),
              Tab(text: 'Yearly Report'),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildMonthlyReportTab(), _buildYearlyReportTab()],
        ),
      ),
    );
  }

  // MARK: - Monthly Report Tab
  Widget _buildMonthlyReportTab() {
    final monthlyAsync = ref.watch(
      monthlyReportProvider(
        _selectedMonthForMonthly.month,
        _selectedMonthForMonthly.year,
      ),
    );
    final isExporting = ref.watch(reportExportNotifierProvider).isLoading;

    return SingleChildScrollView(
      padding: AppDimensions.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimensions.spacing16),
          _buildMonthSelector(),
          const SizedBox(height: AppDimensions.spacing24),
          if (monthlyAsync.isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.spacing32),
                child: CircularProgressIndicator(),
              ),
            )
          else if (monthlyAsync.hasError)
            _buildErrorState(
              message: monthlyAsync.error.toString(),
              onRetry: () => ref.invalidate(monthlyReportProvider),
            )
          else if (monthlyAsync.valueOrNull == null)
            _buildEmptyState('No monthly report data available')
          else ...[
            _buildMonthlyReportSummary(monthlyAsync.value!),
            const SizedBox(height: AppDimensions.spacing24),
            _buildCategoryBreakdown(monthlyAsync.value!),
            const SizedBox(height: AppDimensions.spacing24),
            _buildMonthlyExportButtons(isExporting: isExporting),
            const SizedBox(height: AppDimensions.spacing32),
          ],
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: _selectedMonthForMonthly,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          initialDatePickerMode: DatePickerMode.year,
        );
        if (picked != null) {
          setState(() {
            _selectedMonthForMonthly = picked;
          });
        }
      },
      child: Container(
        padding: AppDimensions.paddingMD,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: AppDimensions.borderRadiusMD,
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _getMonthYearString(_selectedMonthForMonthly),
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.calendar_today,
              color: AppColors.primary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlyReportSummary(MonthlyReport monthlyReport) {
    final savings = monthlyReport.totalIncome - monthlyReport.totalSpent;

    return Container(
      padding: AppDimensions.paddingLG,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppDimensions.borderRadiusLG,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Summary',
            style: AppTypography.titleLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          _buildSummaryRow(
            'Total Income',
            'Rp${(monthlyReport.totalIncome / 1000000).toStringAsFixed(1)}M',
            Icons.trending_up,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _buildSummaryRow(
            'Total Spent',
            'Rp${(monthlyReport.totalSpent / 1000000).toStringAsFixed(2)}M',
            Icons.shopping_cart,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _buildSummaryRow(
            'Budget Allocated',
            'Rp${(monthlyReport.totalBudget / 1000000).toStringAsFixed(1)}M',
            Icons.account_balance_wallet,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _buildSummaryRow(
            'Savings',
            'Rp${(savings / 1000000).toStringAsFixed(2)}M',
            Icons.savings,
            valueColor: Colors.greenAccent,
          ),
          const SizedBox(height: AppDimensions.spacing16),
          const Divider(color: Colors.white24),
          const SizedBox(height: AppDimensions.spacing12),
          Row(
            children: [
              const Icon(Icons.stars, color: Colors.amberAccent, size: 20),
              const SizedBox(width: AppDimensions.spacing8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Spending Category',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      '${monthlyReport.topCategory} - Rp${(monthlyReport.topCategoryAmount / 1000).toStringAsFixed(0)}K',
                      style: AppTypography.bodyMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    IconData icon, {
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: AppDimensions.spacing8),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyLarge.copyWith(
            color: valueColor ?? Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBreakdown(MonthlyReport monthlyReport) {
    final categories = monthlyReport.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category Breakdown', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...categories.map((cat) {
          final percentage = cat.percentage.round();

          return Container(
            margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
            padding: AppDimensions.paddingMD,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: AppDimensions.borderRadiusMD,
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cat.name,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$percentage%',
                      style: AppTypography.bodyMedium.copyWith(
                        color: percentage > 100
                            ? AppColors.error
                            : AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacing8),
                Text(
                  'Rp${(cat.spent / 1000).toStringAsFixed(0)}K / Rp${(cat.budget / 1000).toStringAsFixed(0)}K',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing8),
                LinearProgressIndicator(
                  value: (percentage / 100).clamp(0.0, 1.0),
                  backgroundColor: AppColors.background,
                  color: percentage > 100 ? AppColors.error : AppColors.primary,
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildMonthlyExportButtons({required bool isExporting}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Export Report', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: 'Export as PDF',
                onPressed: isExporting
                    ? null
                    : () => _exportMonthlyReport('pdf'),
                icon: Icons.picture_as_pdf,
                variant: AppButtonVariant.secondary,
                isLoading: isExporting,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            Expanded(
              child: AppButton(
                text: 'Export as Excel',
                onPressed: isExporting
                    ? null
                    : () => _exportMonthlyReport('excel'),
                icon: Icons.table_chart,
                variant: AppButtonVariant.secondary,
                isLoading: isExporting,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // MARK: - Yearly Report Tab
  Widget _buildYearlyReportTab() {
    final yearlyAsync = ref.watch(yearlyReportProvider(_selectedYearForYearly));

    return SingleChildScrollView(
      padding: AppDimensions.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimensions.spacing16),
          _buildYearSelector(),
          const SizedBox(height: AppDimensions.spacing24),
          if (yearlyAsync.isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.spacing32),
                child: CircularProgressIndicator(),
              ),
            )
          else if (yearlyAsync.hasError)
            _buildErrorState(
              message: yearlyAsync.error.toString(),
              onRetry: () => ref.invalidate(yearlyReportProvider),
            )
          else if (yearlyAsync.valueOrNull == null)
            _buildEmptyState('No yearly report data available')
          else ...[
            _buildYearlySummary(yearlyAsync.value!),
            const SizedBox(height: AppDimensions.spacing24),
            _buildMonthlyBreakdown(yearlyAsync.value!),
            const SizedBox(height: AppDimensions.spacing32),
          ],
        ],
      ),
    );
  }

  Widget _buildYearSelector() {
    return GestureDetector(
      onTap: () async {
        final int? picked = await showDialog<int>(
          context: context,
          builder: (context) =>
              _YearPickerDialog(initialYear: _selectedYearForYearly),
        );
        if (picked != null) {
          setState(() {
            _selectedYearForYearly = picked;
          });
        }
      },
      child: Container(
        padding: AppDimensions.paddingMD,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: AppDimensions.borderRadiusMD,
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$_selectedYearForYearly',
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.calendar_today,
              color: AppColors.primary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYearlySummary(YearlyReport yearlyReport) {
    return Container(
      padding: AppDimensions.paddingLG,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppDimensions.borderRadiusLG,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Annual Summary $_selectedYearForYearly',
            style: AppTypography.titleLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          _buildSummaryRow(
            'Total Income',
            'Rp${(yearlyReport.totalIncome / 1000000).toStringAsFixed(1)}M',
            Icons.trending_up,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _buildSummaryRow(
            'Total Spent',
            'Rp${(yearlyReport.totalSpent / 1000000).toStringAsFixed(2)}M',
            Icons.shopping_cart,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _buildSummaryRow(
            'Avg Monthly Income',
            'Rp${(yearlyReport.averageMonthlyIncome / 1000000).toStringAsFixed(1)}M',
            Icons.calendar_month,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          _buildSummaryRow(
            'Avg Monthly Spending',
            'Rp${(yearlyReport.averageMonthlySpending / 1000000).toStringAsFixed(2)}M',
            Icons.shopping_bag,
          ),
          const SizedBox(height: AppDimensions.spacing16),
          const Divider(color: Colors.white24),
          const SizedBox(height: AppDimensions.spacing12),
          Row(
            children: [
              Expanded(
                child: _buildHighlightItem(
                  'Highest',
                  yearlyReport.highestSpendingMonth,
                  Icons.arrow_upward,
                  Colors.redAccent,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              Expanded(
                child: _buildHighlightItem(
                  'Lowest',
                  yearlyReport.lowestSpendingMonth,
                  Icons.arrow_downward,
                  Colors.greenAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: AppDimensions.paddingSM,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: AppDimensions.borderRadiusMD,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: AppDimensions.spacing4),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(color: Colors.white70),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyBreakdown(YearlyReport yearlyReport) {
    final monthlySummaries = yearlyReport.monthlySummaries;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Monthly Breakdown', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...monthlySummaries.map((month) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
            padding: AppDimensions.paddingMD,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: AppDimensions.borderRadiusMD,
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  month.month,
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Income',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Rp${(month.income / 1000000).toStringAsFixed(1)}M',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.success,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spent',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Rp${(month.spent / 1000000).toStringAsFixed(2)}M',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Remaining',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Rp${(month.remaining / 1000000).toStringAsFixed(2)}M',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // MARK: - Helper Methods
  String _getMonthYearString(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  Future<void> _exportMonthlyReport(String format) async {
    try {
      await ref
          .read(reportExportNotifierProvider.notifier)
          .exportMonthly(
            _selectedMonthForMonthly.month,
            _selectedMonthForMonthly.year,
            format,
          );
      if (!mounted) return;
      AppToast.showSuccess(
        context,
        'Report exported successfully as ${format.toUpperCase()}.',
      );
    } catch (e) {
      if (!mounted) return;
      AppToast.showError(context, e.toString().replaceFirst('Exception: ', ''));
    }
  }

  Widget _buildErrorState({
    required String message,
    required VoidCallback onRetry,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: AppDimensions.spacing16),
            Text(
              'Error',
              style: AppTypography.titleLarge.copyWith(color: AppColors.error),
            ),
            const SizedBox(height: AppDimensions.spacing8),
            Text(
              message,
              style: AppTypography.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacing24),
            AppButton(text: 'Retry', onPressed: onRetry, icon: Icons.refresh),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.inbox_outlined,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppDimensions.spacing16),
            Text(
              message,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: - Year Picker Dialog
class _YearPickerDialog extends StatelessWidget {
  final int initialYear;

  const _YearPickerDialog({required this.initialYear});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final years = List.generate(10, (index) => currentYear - index);

    return AlertDialog(
      title: const Text('Select Year'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: years.length,
          itemBuilder: (context, index) {
            final year = years[index];
            return ListTile(
              title: Text('$year'),
              selected: year == initialYear,
              onTap: () => Navigator.pop(context, year),
            );
          },
        ),
      ),
    );
  }
}
