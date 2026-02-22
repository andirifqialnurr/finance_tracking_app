import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../widgets/common/app_button.dart';
import '../../providers/analytics_provider.dart';
import '../../models/analytics.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Analytics'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          tabs: const [
            Tab(text: 'Spending Pattern'),
            Tab(text: 'Category Comparison'),
            Tab(text: 'Top Spending'),
            Tab(text: 'Budget Performance'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _SpendingPatternTab(),
          _CategoryComparisonTab(),
          _TopSpendingTab(),
          _BudgetPerformanceTab(),
        ],
      ),
    );
  }
}

// MARK: - Spending Pattern Tab
class _SpendingPatternTab extends StatefulWidget {
  const _SpendingPatternTab();

  @override
  State<_SpendingPatternTab> createState() => _SpendingPatternTabState();
}

class _SpendingPatternTabState extends State<_SpendingPatternTab> {
  int _selectedMonths = 6;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSpendingPattern();
    });
  }

  void _loadSpendingPattern() {
    final now = DateTime.now();
    context.read<AnalyticsProvider>().fetchSpendingPattern(
      month: now.month,
      year: now.year,
      period: _selectedMonths,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnalyticsProvider>(
      builder: (context, provider, child) {
        // Loading State
        if (provider.isLoadingSpendingPattern) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error State
        if (provider.spendingPatternError != null) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: AppColors.error),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'Failed to load spending pattern',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    provider.spendingPatternError!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing24),
                  AppButton(text: 'Retry', onPressed: _loadSpendingPattern),
                ],
              ),
            ),
          );
        }

        // Empty State
        if (provider.spendingPatterns == null ||
            provider.spendingPatterns!.isEmpty) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.show_chart,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'No spending data available',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    'Add some expenses to see your spending pattern',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        // Data State
        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),

              // Month Selector
              _buildMonthSelector(),
              const SizedBox(height: AppDimensions.spacing24),

              // Summary Cards
              _buildSummarySection(provider.spendingPatterns!),
              const SizedBox(height: AppDimensions.spacing24),

              // Chart Placeholder
              _buildChartSection(),
              const SizedBox(height: AppDimensions.spacing24),

              // Pattern List
              _buildPatternList(provider.spendingPatterns!),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMonthSelector() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'View last:',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        SegmentedButton<int>(
          segments: const [
            ButtonSegment(value: 3, label: Text('3M')),
            ButtonSegment(value: 6, label: Text('6M')),
            ButtonSegment(value: 12, label: Text('12M')),
          ],
          selected: {_selectedMonths},
          onSelectionChanged: (Set<int> newSelection) {
            setState(() {
              _selectedMonths = newSelection.first;
            });
            _loadSpendingPattern();
          },
        ),
      ],
    );
  }

  Widget _buildSummarySection(List<SpendingPattern> spendingPatterns) {
    // Calculate average spending from the patterns
    final avgSpending = spendingPatterns.isEmpty
        ? 0.0
        : spendingPatterns.map((p) => p.totalSpent).reduce((a, b) => a + b) /
              spendingPatterns.length;

    // Determine trend (compare first half vs second half)
    String trend = 'stable';
    if (spendingPatterns.length >= 2) {
      final midPoint = spendingPatterns.length ~/ 2;
      final firstHalfAvg =
          spendingPatterns
              .take(midPoint)
              .map((p) => p.totalSpent)
              .reduce((a, b) => a + b) /
          midPoint;
      final secondHalfAvg =
          spendingPatterns
              .skip(midPoint)
              .map((p) => p.totalSpent)
              .reduce((a, b) => a + b) /
          (spendingPatterns.length - midPoint);

      if (secondHalfAvg > firstHalfAvg * 1.05) {
        trend = 'increasing';
      } else if (secondHalfAvg < firstHalfAvg * 0.95) {
        trend = 'decreasing';
      }
    }

    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            title: 'Avg Spending',
            value: 'Rp${(avgSpending / 1000000).toStringAsFixed(1)}M',
            icon: Icons.trending_up,
            iconColor: AppColors.warning,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing16),
        Expanded(
          child: _SummaryCard(
            title: 'Trend',
            value: trend[0].toUpperCase() + trend.substring(1),
            icon: trend == 'increasing'
                ? Icons.arrow_upward
                : trend == 'decreasing'
                ? Icons.arrow_downward
                : Icons.trending_flat,
            iconColor: trend == 'increasing'
                ? AppColors.error
                : trend == 'decreasing'
                ? AppColors.success
                : AppColors.warning,
          ),
        ),
      ],
    );
  }

  Widget _buildChartSection() {
    return Container(
      padding: AppDimensions.paddingLG,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: AppDimensions.borderRadiusLG,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Spending vs Budget', style: AppTypography.titleMedium),
          const SizedBox(height: AppDimensions.spacing16),
          // TODO: Replace with actual chart (fl_chart or charts_flutter)
          Container(
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: AppDimensions.borderRadiusMD,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, size: 64, color: AppColors.textSecondary),
                const SizedBox(height: AppDimensions.spacing8),
                Text(
                  'Chart will be displayed here',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatternList(List<SpendingPattern> spendingPatterns) {
    // Helper to format month name
    String getMonthName(int month, int year) {
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${months[month - 1]} $year';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Monthly Breakdown', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...spendingPatterns.map((pattern) {
          final percentage = pattern.budgetAllocated > 0
              ? (pattern.totalSpent / pattern.budgetAllocated * 100).round()
              : 0;
          return _PatternListItem(
            month: getMonthName(pattern.month, pattern.year),
            spent: pattern.totalSpent,
            budget: pattern.budgetAllocated,
            percentage: percentage,
          );
        }),
      ],
    );
  }
}

// MARK: - Category Comparison Tab
class _CategoryComparisonTab extends StatefulWidget {
  const _CategoryComparisonTab();

  @override
  State<_CategoryComparisonTab> createState() => _CategoryComparisonTabState();
}

class _CategoryComparisonTabState extends State<_CategoryComparisonTab> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCategoryComparison();
    });
  }

  void _loadCategoryComparison() {
    context.read<AnalyticsProvider>().fetchCategoryComparison(
      month: _selectedDate.month,
      year: _selectedDate.year,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnalyticsProvider>(
      builder: (context, provider, child) {
        // Loading State
        if (provider.isLoadingCategoryComparison) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error State
        if (provider.categoryComparisonError != null) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: AppColors.error),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'Failed to load category comparison',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    provider.categoryComparisonError!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing24),
                  AppButton(text: 'Retry', onPressed: _loadCategoryComparison),
                ],
              ),
            ),
          );
        }

        // Empty State
        if (provider.categoryComparisons == null ||
            provider.categoryComparisons!.isEmpty) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.compare_arrows,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'No comparison data available',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    'Add expenses to see category comparisons',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        // Data State
        final comparisons = provider.categoryComparisons!;
        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),

              // Month Selector
              _buildMonthPicker(),
              const SizedBox(height: AppDimensions.spacing24),

              // Comparison Summary
              _buildComparisonSummary(comparisons),
              const SizedBox(height: AppDimensions.spacing24),

              // Current Month
              _buildMonthSection('Current Month', comparisons, true),
              const SizedBox(height: AppDimensions.spacing24),

              // Previous Month
              _buildMonthSection('Previous Month', comparisons, false),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMonthPicker() {
    final monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final monthName = monthNames[_selectedDate.month - 1];

    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          initialDatePickerMode: DatePickerMode.year,
        );
        if (date != null) {
          setState(() {
            _selectedDate = date;
          });
          _loadCategoryComparison();
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
              '$monthName ${_selectedDate.year}',
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

  Widget _buildComparisonSummary(List<CategoryComparison> comparisons) {
    final currentTotal = comparisons.fold<double>(
      0.0,
      (sum, c) => sum + c.currentMonthSpending,
    );
    final previousTotal = comparisons.fold<double>(
      0.0,
      (sum, c) => sum + c.previousMonthSpending,
    );
    final change = currentTotal - previousTotal;
    final changePercentage = previousTotal > 0
        ? (change / previousTotal * 100).toStringAsFixed(1)
        : '0.0';

    return Container(
      padding: AppDimensions.paddingLG,
      decoration: BoxDecoration(
        color: change > 0
            ? AppColors.error.withOpacity(0.1)
            : AppColors.success.withOpacity(0.1),
        borderRadius: AppDimensions.borderRadiusLG,
        border: Border.all(
          color: change > 0
              ? AppColors.error.withOpacity(0.3)
              : AppColors.success.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            change > 0 ? Icons.trending_up : Icons.trending_down,
            color: change > 0 ? AppColors.error : AppColors.success,
            size: 32,
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  change > 0 ? 'Spending Increased' : 'Spending Decreased',
                  style: AppTypography.titleSmall,
                ),
                const SizedBox(height: AppDimensions.spacing4),
                Text(
                  'Rp${(change.abs() / 1000).toStringAsFixed(0)}K ($changePercentage%)',
                  style: AppTypography.bodyMedium.copyWith(
                    color: change > 0 ? AppColors.error : AppColors.success,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSection(
    String title,
    List<CategoryComparison> comparisons,
    bool isCurrentMonth,
  ) {
    final monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    // Get month name
    final month = isCurrentMonth
        ? _selectedDate.month
        : (_selectedDate.month == 1 ? 12 : _selectedDate.month - 1);
    final year = isCurrentMonth
        ? _selectedDate.year
        : (_selectedDate.month == 1
              ? _selectedDate.year - 1
              : _selectedDate.year);
    final monthName = '${monthNames[month - 1]} $year';

    // Calculate total for this month
    final totalSpent = comparisons.fold<double>(
      0.0,
      (sum, c) =>
          sum +
          (isCurrentMonth ? c.currentMonthSpending : c.previousMonthSpending),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTypography.titleMedium),
            Text(
              monthName,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacing8),
        Text(
          'Total: Rp${(totalSpent / 1000).toStringAsFixed(0)}K',
          style: AppTypography.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing16),
        ...comparisons.map((comparison) {
          final spent = isCurrentMonth
              ? comparison.currentMonthSpending
              : comparison.previousMonthSpending;
          final percentage = totalSpent > 0 ? (spent / totalSpent * 100) : 0.0;
          return _CategoryComparisonItem(
            name: comparison.categoryName,
            spent: spent,
            percentage: percentage,
          );
        }),
      ],
    );
  }
}

// MARK: - Top Spending Tab
class _TopSpendingTab extends StatefulWidget {
  const _TopSpendingTab();

  @override
  State<_TopSpendingTab> createState() => _TopSpendingTabState();
}

class _TopSpendingTabState extends State<_TopSpendingTab> {
  DateTime _selectedDate = DateTime(DateTime.now().year, DateTime.now().month);
  int _limit = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadTopSpending();
    });
  }

  void _loadTopSpending() {
    final startDate = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final endDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 0);
    context.read<AnalyticsProvider>().fetchTopSpending(
      startDate: startDate,
      endDate: endDate,
      limit: _limit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnalyticsProvider>(
      builder: (context, provider, child) {
        // Loading State
        if (provider.isLoadingTopSpending) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error State
        if (provider.topSpendingError != null) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: AppColors.error),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'Failed to load top spending',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    provider.topSpendingError!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing24),
                  AppButton(text: 'Retry', onPressed: _loadTopSpending),
                ],
              ),
            ),
          );
        }

        // Empty State
        if (provider.topSpending == null ||
            provider.topSpending!.categories.isEmpty) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.leaderboard,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'No spending data available',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    'Add expenses to see top spending categories',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        // Data State
        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),

              // Date and Limit Selector
              _buildFilters(),
              const SizedBox(height: AppDimensions.spacing24),

              // Top Spending List
              _buildTopSpendingList(provider.topSpending!.categories),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilters() {
    final monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final monthName = monthNames[_selectedDate.month - 1];

    return Column(
      children: [
        // Month Picker
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
              initialDatePickerMode: DatePickerMode.year,
            );
            if (date != null) {
              setState(() {
                _selectedDate = DateTime(date.year, date.month);
              });
              _loadTopSpending();
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
                  '$monthName ${_selectedDate.year}',
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacing16),

        // Limit Selector
        Row(
          children: [
            Expanded(
              child: Text(
                'Show top:',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 5, label: Text('5')),
                ButtonSegment(value: 10, label: Text('10')),
                ButtonSegment(value: 15, label: Text('15')),
              ],
              selected: {_limit},
              onSelectionChanged: (Set<int> newSelection) {
                setState(() {
                  _limit = newSelection.first;
                });
                _loadTopSpending();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTopSpendingList(List<TopSpendingCategory> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rankings', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...List.generate(categories.length, (index) {
          final item = categories[index];
          final avgPerTransaction = item.transactionCount > 0
              ? item.totalSpent / item.transactionCount
              : 0.0;
          return _TopSpendingItem(
            rank: index + 1,
            category: item.categoryName,
            amount: item.totalSpent,
            count: item.transactionCount,
            avgPerTransaction: avgPerTransaction,
          );
        }),
      ],
    );
  }
}

// MARK: - Budget Performance Tab
class _BudgetPerformanceTab extends StatefulWidget {
  const _BudgetPerformanceTab();

  @override
  State<_BudgetPerformanceTab> createState() => _BudgetPerformanceTabState();
}

class _BudgetPerformanceTabState extends State<_BudgetPerformanceTab> {
  int _selectedYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadBudgetPerformance();
    });
  }

  void _loadBudgetPerformance() {
    context.read<AnalyticsProvider>().fetchBudgetPerformance(
      year: _selectedYear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnalyticsProvider>(
      builder: (context, provider, child) {
        // Loading State
        if (provider.isLoadingBudgetPerformance) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error State
        if (provider.budgetPerformanceError != null) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: AppColors.error),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'Failed to load budget performance',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    provider.budgetPerformanceError!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing24),
                  AppButton(text: 'Retry', onPressed: _loadBudgetPerformance),
                ],
              ),
            ),
          );
        }

        // Empty State
        if (provider.budgetPerformance == null) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assessment,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  Text(
                    'No budget performance data',
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing8),
                  Text(
                    'Set up budgets to track performance',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        // Data State
        final performance = provider.budgetPerformance!;
        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),

              // Year Selector
              _buildYearSelector(),
              const SizedBox(height: AppDimensions.spacing24),

              // Overall Summary
              _buildOverallSummary(performance),
              const SizedBox(height: AppDimensions.spacing24),

              // Category Performance
              _buildCategoryPerformance(performance.categoryPerformances),
              const SizedBox(height: AppDimensions.spacing24),

              // Monthly Performance
              _buildMonthlyPerformance(performance.monthlyPerformances),
            ],
          ),
        );
      },
    );
  }

  Widget _buildYearSelector() {
    return GestureDetector(
      onTap: () async {
        final year = await showDialog<int>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Select Year'),
            content: SizedBox(
              width: 300,
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final year = DateTime.now().year - index;
                  return ListTile(
                    title: Text('$year'),
                    selected: year == _selectedYear,
                    onTap: () => Navigator.of(context).pop(year),
                  );
                },
              ),
            ),
          ),
        );
        if (year != null) {
          setState(() {
            _selectedYear = year;
          });
          _loadBudgetPerformance();
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
              '$_selectedYear',
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

  Widget _buildOverallSummary(BudgetPerformance performance) {
    // Count over budget categories from categoryPerformances
    final overBudget = performance.categoryPerformances
        .where((cp) => cp.status == 'over')
        .length;
    final underBudget = performance.categoryPerformances
        .where((cp) => cp.status == 'under')
        .length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Overall Performance', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        Row(
          children: [
            Expanded(
              child: _PerformanceCard(
                title: 'Over Budget',
                value: '$overBudget',
                subtitle: 'categories',
                color: AppColors.error,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            Expanded(
              child: _PerformanceCard(
                title: 'Under Budget',
                value: '$underBudget',
                subtitle: 'categories',
                color: AppColors.success,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryPerformance(
    List<CategoryPerformance> categoryPerformances,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('By Category', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...categoryPerformances.map((cat) {
          // For simplicity, we'll just show current status
          // In real app, you might track historical over/under counts
          final timesOver = cat.status == 'over' ? 1 : 0;
          final timesUnder = cat.status == 'under' ? 1 : 0;
          return _CategoryPerformanceItem(
            category: cat.categoryName,
            timesOver: timesOver,
            timesUnder: timesUnder,
            avgUsage: cat.percentageUsed,
          );
        }),
      ],
    );
  }

  Widget _buildMonthlyPerformance(
    List<MonthlyPerformance> monthlyPerformances,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Monthly Trend', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...monthlyPerformances.map((monthPerf) {
          // For simplicity, show month with performance
          // In a real app, you might aggregate category statuses per month
          final categoriesOver = monthPerf.percentageUsed > 100 ? 1 : 0;
          final categoriesUnder = monthPerf.percentageUsed <= 100 ? 1 : 0;
          return _MonthlyPerformanceItem(
            month: monthPerf.monthName,
            categoriesOver: categoriesOver,
            categoriesUnder: categoriesUnder,
            avgUsage: monthPerf.percentageUsed,
          );
        }),
      ],
    );
  }
}

// MARK: - Reusable Widgets

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: AppDimensions.borderRadiusMD,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: AppDimensions.spacing8),
          Text(
            title,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimensions.spacing4),
          Text(value, style: AppTypography.titleMedium),
        ],
      ),
    );
  }
}

class _PatternListItem extends StatelessWidget {
  final String month;
  final double spent;
  final double budget;
  final int percentage;

  const _PatternListItem({
    required this.month,
    required this.spent,
    required this.budget,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
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
                month,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$percentage%',
                style: AppTypography.bodyMedium.copyWith(
                  color: percentage > 100 ? AppColors.error : AppColors.success,
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
                'Spent: Rp${(spent / 1000).toStringAsFixed(0)}K',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                'Budget: Rp${(budget / 1000).toStringAsFixed(0)}K',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing8),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: AppColors.background,
            color: percentage > 100 ? AppColors.error : AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _CategoryComparisonItem extends StatelessWidget {
  final String name;
  final double spent;
  final double percentage;

  const _CategoryComparisonItem({
    required this.name,
    required this.spent,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacing8),
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: AppDimensions.borderRadiusMD,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing4),
                Text(
                  'Rp${(spent / 1000).toStringAsFixed(0)}K',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopSpendingItem extends StatelessWidget {
  final int rank;
  final String category;
  final double amount;
  final int count;
  final double avgPerTransaction;

  const _TopSpendingItem({
    required this.rank,
    required this.category,
    required this.amount,
    required this.count,
    required this.avgPerTransaction,
  });

  @override
  Widget build(BuildContext context) {
    Color rankColor = rank <= 3 ? AppColors.warning : AppColors.textSecondary;

    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: AppDimensions.borderRadiusMD,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          // Rank Badge
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: rankColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '#$rank',
              style: AppTypography.bodyMedium.copyWith(
                color: rankColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.spacing12),

          // Category Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing4),
                Text(
                  '$count transactions · Avg Rp${(avgPerTransaction / 1000).toStringAsFixed(0)}K',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Amount
          Text(
            'Rp${(amount / 1000).toStringAsFixed(0)}K',
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _PerformanceCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  const _PerformanceCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppDimensions.borderRadiusMD,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacing8),
          Text(
            value,
            style: AppTypography.headlineMedium.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryPerformanceItem extends StatelessWidget {
  final String category;
  final int timesOver;
  final int timesUnder;
  final double avgUsage;

  const _CategoryPerformanceItem({
    required this.category,
    required this.timesOver,
    required this.timesUnder,
    required this.avgUsage,
  });

  @override
  Widget build(BuildContext context) {
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
                category,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${avgUsage.toStringAsFixed(1)}% avg',
                style: AppTypography.bodyMedium.copyWith(
                  color: avgUsage > 100 ? AppColors.error : AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing8),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.arrow_upward, size: 16, color: AppColors.error),
                    const SizedBox(width: AppDimensions.spacing4),
                    Text(
                      'Over: $timesOver',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      size: 16,
                      color: AppColors.success,
                    ),
                    const SizedBox(width: AppDimensions.spacing4),
                    Text(
                      'Under: $timesUnder',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
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
}

class _MonthlyPerformanceItem extends StatelessWidget {
  final String month;
  final int categoriesOver;
  final int categoriesUnder;
  final double avgUsage;

  const _MonthlyPerformanceItem({
    required this.month,
    required this.categoriesOver,
    required this.categoriesUnder,
    required this.avgUsage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacing8),
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: AppDimensions.borderRadiusMD,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              month,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Row(
              children: [
                Icon(Icons.trending_up, size: 16, color: AppColors.error),
                Text(' $categoriesOver', style: AppTypography.bodySmall),
                const SizedBox(width: AppDimensions.spacing16),
                Icon(Icons.trending_down, size: 16, color: AppColors.success),
                Text(' $categoriesUnder', style: AppTypography.bodySmall),
              ],
            ),
          ),
          Text(
            '${avgUsage.toStringAsFixed(1)}%',
            style: AppTypography.bodyMedium.copyWith(
              color: avgUsage > 100 ? AppColors.error : AppColors.success,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
