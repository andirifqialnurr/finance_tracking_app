import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../providers/analytics_provider.dart';
import '../../widgets/common/shimmer_loading.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen>
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

// ─────────────────────────────────────────────────
// MARK: - Tab 1: Spending Pattern
// ─────────────────────────────────────────────────
class _SpendingPatternTab extends ConsumerStatefulWidget {
  const _SpendingPatternTab();

  @override
  ConsumerState<_SpendingPatternTab> createState() =>
      _SpendingPatternTabState();
}

class _SpendingPatternTabState extends ConsumerState<_SpendingPatternTab> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final patternAsync = ref.watch(
      spendingPatternProvider(_selectedDate.month, _selectedDate.year),
    );

    return patternAsync.when(
      loading: () => const ShimmerList(itemCount: 4, itemHeight: 140),
      error: (e, _) => _buildError(
        'Failed to load spending pattern',
        e.toString(),
        () => ref.invalidate(spendingPatternProvider),
      ),
      data: (pattern) => SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppDimensions.spacing16),
            _buildDatePicker(),
            const SizedBox(height: AppDimensions.spacing24),
            _buildSummarySection(pattern.totalSpent, pattern.budgetAllocated),
            const SizedBox(height: AppDimensions.spacing24),
            _buildChartSection(),
            const SizedBox(height: AppDimensions.spacing24),
            _buildPatternRow(pattern),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return _MonthPickerTile(
      date: _selectedDate,
      onChanged: (date) => setState(() => _selectedDate = date),
    );
  }

  Widget _buildSummarySection(double totalSpent, double budgetAllocated) {
    final percentageUsed = budgetAllocated > 0
        ? (totalSpent / budgetAllocated) * 100
        : 0.0;

    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            title: 'Total Spent',
            value: 'Rp${(totalSpent / 1000000).toStringAsFixed(1)}M',
            icon: Icons.shopping_cart,
            iconColor: AppColors.error,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing16),
        Expanded(
          child: _SummaryCard(
            title: 'Budget Used',
            value: '${percentageUsed.toStringAsFixed(1)}%',
            icon: percentageUsed > 100
                ? Icons.arrow_upward
                : Icons.trending_flat,
            iconColor: percentageUsed > 100
                ? AppColors.error
                : AppColors.success,
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
                const Icon(
                  Icons.bar_chart,
                  size: 64,
                  color: AppColors.textSecondary,
                ),
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

  Widget _buildPatternRow(dynamic pattern) {
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
    final monthName = '${months[pattern.month - 1]} ${pattern.year}';
    final percentage = pattern.budgetAllocated > 0
        ? (pattern.totalSpent / pattern.budgetAllocated * 100).round()
        : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Monthly Breakdown', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        _PatternListItem(
          month: monthName,
          spent: pattern.totalSpent,
          budget: pattern.budgetAllocated,
          percentage: percentage,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────
// MARK: - Tab 2: Category Comparison
// ─────────────────────────────────────────────────
class _CategoryComparisonTab extends ConsumerStatefulWidget {
  const _CategoryComparisonTab();

  @override
  ConsumerState<_CategoryComparisonTab> createState() =>
      _CategoryComparisonTabState();
}

class _CategoryComparisonTabState
    extends ConsumerState<_CategoryComparisonTab> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final comparisonAsync = ref.watch(
      categoryComparisonProvider(_selectedDate.month, _selectedDate.year),
    );

    return comparisonAsync.when(
      loading: () => const ShimmerList(itemCount: 5, itemHeight: 70),
      error: (e, _) => _buildError(
        'Failed to load category comparison',
        e.toString(),
        () => ref.invalidate(categoryComparisonProvider),
      ),
      data: (comparisons) {
        if (comparisons.isEmpty) {
          return _buildEmpty(
            'No comparison data available',
            'Add expenses to see category comparisons',
            Icons.compare_arrows,
          );
        }

        final totalSpent = comparisons.fold<double>(
          0.0,
          (s, c) => s + c.totalSpent,
        );

        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),
              _MonthPickerTile(
                date: _selectedDate,
                onChanged: (d) => setState(() => _selectedDate = d),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              _buildTotalCard(totalSpent),
              const SizedBox(height: AppDimensions.spacing24),
              Text('Category Breakdown', style: AppTypography.titleMedium),
              const SizedBox(height: AppDimensions.spacing12),
              ...comparisons.map((c) {
                final pct = totalSpent > 0
                    ? (c.totalSpent / totalSpent * 100)
                    : 0.0;
                return _CategoryComparisonItem(
                  name: c.categoryName,
                  spent: c.totalSpent,
                  percentage: pct,
                );
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTotalCard(double totalSpent) {
    return Container(
      padding: AppDimensions.paddingLG,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: AppDimensions.borderRadiusLG,
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.account_balance_wallet,
            color: AppColors.primary,
            size: 32,
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Spending', style: AppTypography.bodySmall),
              Text(
                'Rp${(totalSpent / 1000000).toStringAsFixed(2)}M',
                style: AppTypography.titleLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────
// MARK: - Tab 3: Top Spending
// ─────────────────────────────────────────────────
class _TopSpendingTab extends ConsumerStatefulWidget {
  const _TopSpendingTab();

  @override
  ConsumerState<_TopSpendingTab> createState() => _TopSpendingTabState();
}

class _TopSpendingTabState extends ConsumerState<_TopSpendingTab> {
  DateTime _selectedDate = DateTime.now();
  int _limit = 5;

  @override
  Widget build(BuildContext context) {
    final topAsync = ref.watch(
      topSpendingProvider(
        _selectedDate.month,
        _selectedDate.year,
        limit: _limit,
      ),
    );

    return topAsync.when(
      loading: () => const ShimmerList(itemCount: 5, itemHeight: 70),
      error: (e, _) => _buildError(
        'Failed to load top spending',
        e.toString(),
        () => ref.invalidate(topSpendingProvider),
      ),
      data: (categories) {
        if (categories.isEmpty) {
          return _buildEmpty(
            'No spending data available',
            'Add expenses to see top spending categories',
            Icons.leaderboard,
          );
        }
        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),
              _buildFilters(),
              const SizedBox(height: AppDimensions.spacing24),
              _buildTopSpendingList(categories),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilters() {
    return Column(
      children: [
        _MonthPickerTile(
          date: _selectedDate,
          onChanged: (d) => setState(() => _selectedDate = d),
        ),
        const SizedBox(height: AppDimensions.spacing16),
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
              onSelectionChanged: (Set<int> s) =>
                  setState(() => _limit = s.first),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTopSpendingList(List<dynamic> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rankings', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...List.generate(categories.length, (index) {
          final item = categories[index];
          final avg = item.transactionCount > 0
              ? item.totalSpent / item.transactionCount
              : 0.0;
          return _TopSpendingItem(
            rank: index + 1,
            category: item.categoryName,
            amount: item.totalSpent,
            count: item.transactionCount,
            avgPerTransaction: avg,
          );
        }),
      ],
    );
  }
}

// ─────────────────────────────────────────────────
// MARK: - Tab 4: Budget Performance
// ─────────────────────────────────────────────────
class _BudgetPerformanceTab extends ConsumerStatefulWidget {
  const _BudgetPerformanceTab();

  @override
  ConsumerState<_BudgetPerformanceTab> createState() =>
      _BudgetPerformanceTabState();
}

class _BudgetPerformanceTabState extends ConsumerState<_BudgetPerformanceTab> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final perfAsync = ref.watch(
      budgetPerformanceProvider(_selectedDate.month, _selectedDate.year),
    );

    return perfAsync.when(
      loading: () => const ShimmerList(itemCount: 4, itemHeight: 90),
      error: (e, _) => _buildError(
        'Failed to load budget performance',
        e.toString(),
        () => ref.invalidate(budgetPerformanceProvider),
      ),
      data: (performance) {
        final categories = performance.categories;
        final overBudget = categories.where((c) => c.isOverBudget).length;
        final underBudget = categories.where((c) => !c.isOverBudget).length;

        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),
              _MonthPickerTile(
                date: _selectedDate,
                onChanged: (d) => setState(() => _selectedDate = d),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              _buildOverallSummary(overBudget, underBudget),
              const SizedBox(height: AppDimensions.spacing24),
              _buildCategoryPerformance(categories),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOverallSummary(int overBudget, int underBudget) {
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

  Widget _buildCategoryPerformance(List<dynamic> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('By Category', style: AppTypography.titleMedium),
        const SizedBox(height: AppDimensions.spacing12),
        ...categories.map((cat) {
          return _CategoryPerformanceItem(
            category: cat.categoryName,
            isOverBudget: cat.isOverBudget,
            avgUsage: cat.percentageUsed,
          );
        }),
      ],
    );
  }
}

// ─────────────────────────────────────────────────
// MARK: - Shared error / empty helpers (top-level)
// ─────────────────────────────────────────────────

Widget _buildError(String title, String message, VoidCallback onRetry) {
  return Center(
    child: Padding(
      padding: AppDimensions.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppColors.error),
          const SizedBox(height: AppDimensions.spacing16),
          Text(
            title,
            style: AppTypography.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacing8),
          Text(
            message,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacing24),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    ),
  );
}

Widget _buildEmpty(String title, String message, IconData icon) {
  return Center(
    child: Padding(
      padding: AppDimensions.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: AppColors.textSecondary),
          const SizedBox(height: AppDimensions.spacing16),
          Text(
            title,
            style: AppTypography.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacing8),
          Text(
            message,
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

// ─────────────────────────────────────────────────
// MARK: - Shared sub-widgets
// ─────────────────────────────────────────────────

class _MonthPickerTile extends StatelessWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _MonthPickerTile({required this.date, required this.onChanged});

  String _label() {
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
    return '${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          initialDatePickerMode: DatePickerMode.year,
        );
        if (picked != null) onChanged(picked);
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
              _label(),
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
}

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
            value: (percentage / 100).clamp(0.0, 1.0),
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
    final rankColor = rank <= 3 ? AppColors.warning : AppColors.textSecondary;

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
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: rankColor.withValues(alpha: 0.1),
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
        color: color.withValues(alpha: 0.1),
        borderRadius: AppDimensions.borderRadiusMD,
        border: Border.all(color: color.withValues(alpha: 0.3)),
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
  final bool isOverBudget;
  final double avgUsage;

  const _CategoryPerformanceItem({
    required this.category,
    required this.isOverBudget,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              category,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                isOverBudget ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: isOverBudget ? AppColors.error : AppColors.success,
              ),
              const SizedBox(width: AppDimensions.spacing4),
              Text(
                '${avgUsage.toStringAsFixed(1)}%',
                style: AppTypography.bodyMedium.copyWith(
                  color: isOverBudget ? AppColors.error : AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
