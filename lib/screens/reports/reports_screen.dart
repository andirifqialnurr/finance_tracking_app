import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../providers/report_provider.dart';
import '../../utils/app_toast.dart';
import '../../widgets/common/app_button.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  DateTime _selectedMonthForMonthly = DateTime(2026, 2);
  int _selectedYearForYearly = 2026;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMonthlyReport();
      _loadYearlyReport();
    });
  }

  void _loadMonthlyReport() {
    context.read<ReportProvider>().fetchMonthlyReport(
      month: _selectedMonthForMonthly.month,
      year: _selectedMonthForMonthly.year,
    );
  }

  void _loadYearlyReport() {
    context.read<ReportProvider>().fetchYearlyReport(
      year: _selectedYearForYearly,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Reports'),
          bottom: TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            tabs: const [
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
    return Consumer<ReportProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),

              // Month Selector
              _buildMonthSelector(),
              const SizedBox(height: AppDimensions.spacing24),

              // Loading State
              if (provider.isLoadingMonthlyReport)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppDimensions.spacing32),
                    child: CircularProgressIndicator(),
                  ),
                )
              // Error State
              else if (provider.monthlyReportError != null)
                _buildErrorState(
                  message: provider.monthlyReportError!,
                  onRetry: _loadMonthlyReport,
                )
              // Empty State
              else if (provider.monthlyReport == null)
                _buildEmptyState('No monthly report data available')
              // Data State
              else ...[
                // Report Summary
                _buildMonthlyReportSummary(provider.monthlyReport!),
                const SizedBox(height: AppDimensions.spacing24),

                // Category Breakdown
                _buildCategoryBreakdown(provider.monthlyReport!),
                const SizedBox(height: AppDimensions.spacing24),

                // Export Buttons
                _buildExportButtons(isMonthly: true, provider: provider),
                const SizedBox(height: AppDimensions.spacing32),
              ],
            ],
          ),
        );
      },
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
          _loadMonthlyReport();
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
            Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlyReportSummary(monthlyReport) {
    final savings = monthlyReport.totalIncome - monthlyReport.totalSpent;

    return Container(
      padding: AppDimensions.paddingLG,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppDimensions.borderRadiusLG,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
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

          // Income
          _buildSummaryRow(
            'Total Income',
            'Rp${(monthlyReport.totalIncome / 1000000).toStringAsFixed(1)}M',
            Icons.trending_up,
          ),
          const SizedBox(height: AppDimensions.spacing12),

          // Spent
          _buildSummaryRow(
            'Total Spent',
            'Rp${(monthlyReport.totalSpent / 1000000).toStringAsFixed(2)}M',
            Icons.shopping_cart,
          ),
          const SizedBox(height: AppDimensions.spacing12),

          // Budget
          _buildSummaryRow(
            'Budget Allocated',
            'Rp${(monthlyReport.totalBudget / 1000000).toStringAsFixed(1)}M',
            Icons.account_balance_wallet,
          ),
          const SizedBox(height: AppDimensions.spacing12),

          // Savings
          _buildSummaryRow(
            'Savings',
            'Rp${(savings / 1000000).toStringAsFixed(2)}M',
            Icons.savings,
            valueColor: Colors.greenAccent,
          ),

          const SizedBox(height: AppDimensions.spacing16),
          const Divider(color: Colors.white24),
          const SizedBox(height: AppDimensions.spacing12),

          // Top Category
          Row(
            children: [
              Icon(Icons.stars, color: Colors.amberAccent, size: 20),
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

  Widget _buildCategoryBreakdown(monthlyReport) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp${(cat.spent / 1000).toStringAsFixed(0)}K / Rp${(cat.budget / 1000).toStringAsFixed(0)}K',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacing8),
                LinearProgressIndicator(
                  value: percentage / 100 > 1 ? 1 : percentage / 100,
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

  Widget _buildExportButtons({
    required bool isMonthly,
    required ReportProvider provider,
  }) {
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
                onPressed: provider.isExporting
                    ? null
                    : () => _exportReport(isMonthly, 'pdf'),
                icon: Icons.picture_as_pdf,
                variant: AppButtonVariant.secondary,
                isLoading: provider.isExporting,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            Expanded(
              child: AppButton(
                text: 'Export as Excel',
                onPressed: provider.isExporting
                    ? null
                    : () => _exportReport(isMonthly, 'excel'),
                icon: Icons.table_chart,
                variant: AppButtonVariant.secondary,
                isLoading: provider.isExporting,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // MARK: - Yearly Report Tab
  Widget _buildYearlyReportTab() {
    return Consumer<ReportProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),

              // Year Selector
              _buildYearSelector(),
              const SizedBox(height: AppDimensions.spacing24),

              // Loading State
              if (provider.isLoadingYearlyReport)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppDimensions.spacing32),
                    child: CircularProgressIndicator(),
                  ),
                )
              // Error State
              else if (provider.yearlyReportError != null)
                _buildErrorState(
                  message: provider.yearlyReportError!,
                  onRetry: _loadYearlyReport,
                )
              // Empty State
              else if (provider.yearlyReport == null)
                _buildEmptyState('No yearly report data available')
              // Data State
              else ...[
                // Yearly Summary
                _buildYearlySummary(provider.yearlyReport!),
                const SizedBox(height: AppDimensions.spacing24),

                // Monthly Breakdown
                _buildMonthlyBreakdown(provider.yearlyReport!),
                const SizedBox(height: AppDimensions.spacing24),

                // Export Buttons
                _buildExportButtons(isMonthly: false, provider: provider),
                const SizedBox(height: AppDimensions.spacing32),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildYearSelector() {
    return GestureDetector(
      onTap: () async {
        // Show year picker
        final int? picked = await showDialog<int>(
          context: context,
          builder: (context) =>
              _YearPickerDialog(initialYear: _selectedYearForYearly),
        );
        if (picked != null) {
          setState(() {
            _selectedYearForYearly = picked;
          });
          _loadYearlyReport();
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
            Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildYearlySummary(yearlyReport) {
    return Container(
      padding: AppDimensions.paddingLG,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.7)],
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

          // Highest/Lowest months
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
        color: Colors.white.withOpacity(0.1),
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

  Widget _buildMonthlyBreakdown(yearlyReport) {
    final monthlySummaries = yearlyReport.monthlySummaries;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Monthly Breakdown', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...monthlySummaries.map((month) {
          final income = month.income;
          final spent = month.spent;
          final remaining = month.remaining;

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
                          'Rp${(income / 1000000).toStringAsFixed(1)}M',
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
                          'Rp${(spent / 1000000).toStringAsFixed(2)}M',
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
                          'Rp${(remaining / 1000000).toStringAsFixed(2)}M',
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

  Future<void> _exportReport(bool isMonthly, String format) async {
    final provider = context.read<ReportProvider>();

    try {
      String? filePath;

      if (isMonthly) {
        if (format == 'pdf') {
          filePath = await provider.exportMonthlyReportPDF(
            month: _selectedMonthForMonthly.month,
            year: _selectedMonthForMonthly.year,
          );
        } else {
          filePath = await provider.exportMonthlyReportExcel(
            month: _selectedMonthForMonthly.month,
            year: _selectedMonthForMonthly.year,
          );
        }
      } else {
        if (format == 'pdf') {
          filePath = await provider.exportYearlyReportPDF(
            year: _selectedYearForYearly,
          );
        } else {
          filePath = await provider.exportYearlyReportExcel(
            year: _selectedYearForYearly,
          );
        }
      }

      if (!mounted) return;

      // Show success or error message
      if (provider.exportSuccess != null) {
        AppToast.showSuccess(context, provider.exportSuccess!);
      } else if (provider.exportError != null) {
        AppToast.showError(
          context,
          'Failed to export report. Please try again.',
        );
      }
    } catch (e) {
      if (mounted) {
        AppToast.showError(
          context,
          'Failed to export report. Please try again.',
        );
      }
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
            Icon(Icons.error_outline, size: 64, color: AppColors.error),
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
            Icon(
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
