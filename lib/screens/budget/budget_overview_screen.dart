import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/budget/budget_category_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';

class BudgetOverviewScreen extends StatefulWidget {
  const BudgetOverviewScreen({super.key});

  @override
  State<BudgetOverviewScreen> createState() => _BudgetOverviewScreenState();
}

class _BudgetOverviewScreenState extends State<BudgetOverviewScreen> {
  // TODO: Replace with actual data from API
  bool _isLoading = false;
  String _selectedFilter = 'All Categories';

  // Sample budget data
  final List<Map<String, dynamic>> _budgetData = [
    {
      'name': 'Makan',
      'type': 'Daily Continuous',
      'allocated': 1240000.0,
      'spent': 480000.0,
      'remaining': 760000.0,
    },
    {
      'name': 'Bensin',
      'type': 'Usage Based',
      'allocated': 175000.0,
      'spent': 140000.0,
      'remaining': 35000.0,
    },
    {
      'name': 'Netflix',
      'type': 'Subscription',
      'allocated': 120000.0,
      'spent': 120000.0,
      'remaining': 0.0,
    },
    {
      'name': 'Spotify',
      'type': 'Subscription',
      'allocated': 60000.0,
      'spent': 60000.0,
      'remaining': 0.0,
    },
    {
      'name': 'Internet',
      'type': 'Subscription',
      'allocated': 100000.0,
      'spent': 100000.0,
      'remaining': 0.0,
    },
  ];

  final double _totalAllocated = 2099000;
  final double _totalSpent = 1850000;
  final double _totalRemaining = 249000;

  // Get filtered budget data based on selected filter
  List<Map<String, dynamic>> get _filteredBudgetData {
    if (_selectedFilter == 'All Categories') {
      return _budgetData;
    }
    return _budgetData
        .where((budget) => budget['type'] == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Budget Overview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterOptions,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: _isLoading
            ? const LoadingIndicator(message: 'Loading budgets...')
            : CustomScrollView(
                slivers: [
                  // Summary Header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: AppDimensions.screenPadding,
                      child: _buildSummaryHeader(),
                    ),
                  ),

                  // Month Selector
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: AppDimensions.screenPaddingHorizontal,
                      child: _buildMonthSelector(),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppDimensions.spacing24),
                  ),

                  // Budget Categories List
                  _filteredBudgetData.isEmpty
                      ? SliverFillRemaining(
                          child: EmptyState(
                            icon: Icons.account_balance_wallet_outlined,
                            title: 'No Budget Data',
                            message: _selectedFilter == 'All Categories'
                                ? 'Start by adding income to allocate budgets'
                                : 'No budgets found for $_selectedFilter',
                            actionLabel: _selectedFilter == 'All Categories'
                                ? 'Add Income'
                                : 'Clear Filter',
                            onAction: () {
                              if (_selectedFilter == 'All Categories') {
                                // TODO: Navigate to add income
                              } else {
                                setState(
                                  () => _selectedFilter = 'All Categories',
                                );
                              }
                            },
                          ),
                        )
                      : SliverPadding(
                          padding: AppDimensions.screenPaddingHorizontal,
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final budget = _filteredBudgetData[index];
                              return BudgetCategoryItem(
                                categoryName: budget['name'],
                                categoryType: budget['type'],
                                allocatedAmount: budget['allocated'],
                                spentAmount: budget['spent'],
                                remainingAmount: budget['remaining'],
                                onTap: () {
                                  _showBudgetDetails(budget);
                                },
                              );
                            }, childCount: _filteredBudgetData.length),
                          ),
                        ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppDimensions.spacing24),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildSummaryHeader() {
    final percentageUsed = (_totalSpent / _totalAllocated) * 100;

    return AppCard(
      child: Column(
        children: [
          // Total Budget Progress
          Text('Total Budget Usage', style: AppTypography.titleMedium),
          const SizedBox(height: AppDimensions.spacing16),

          // Circular Progress (could use a circular chart here)
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: percentageUsed / 100,
                  strokeWidth: 12,
                  backgroundColor: AppColors.borderLight,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.getBudgetColor(percentageUsed),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    '${percentageUsed.toStringAsFixed(1)}%',
                    style: AppTypography.headlineSmall,
                  ),
                  Text('Used', style: AppTypography.bodySmall),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing24),

          // Summary Numbers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _SummaryItem(
                label: 'Allocated',
                amount: _totalAllocated,
                color: AppColors.info,
              ),
              Container(width: 1, height: 40, color: AppColors.border),
              _SummaryItem(
                label: 'Spent',
                amount: _totalSpent,
                color: AppColors.error,
              ),
              Container(width: 1, height: 40, color: AppColors.border),
              _SummaryItem(
                label: 'Remaining',
                amount: _totalRemaining,
                color: AppColors.success,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return AppCard(
      padding: AppDimensions.paddingMD,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              // TODO: Go to previous month
            },
          ),
          Expanded(
            child: Text(
              'February 2026',
              style: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              // TODO: Go to next month
            },
          ),
        ],
      ),
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusXL),
        ),
      ),
      builder: (context) => Container(
        padding: AppDimensions.paddingLG,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter by Category Type',
                    style: AppTypography.titleMedium,
                  ),
                  if (_selectedFilter != 'All Categories')
                    TextButton(
                      onPressed: () {
                        setState(() => _selectedFilter = 'All Categories');
                        Navigator.pop(context);
                      },
                      child: const Text('Clear'),
                    ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing16),
              _FilterOption(
                title: 'All Categories',
                isSelected: _selectedFilter == 'All Categories',
                onTap: () => _applyFilter('All Categories'),
              ),
              _FilterOption(
                title: 'Subscription',
                isSelected: _selectedFilter == 'Subscription',
                onTap: () => _applyFilter('Subscription'),
              ),
              _FilterOption(
                title: 'Daily Continuous',
                isSelected: _selectedFilter == 'Daily Continuous',
                onTap: () => _applyFilter('Daily Continuous'),
              ),
              _FilterOption(
                title: 'Usage Based',
                isSelected: _selectedFilter == 'Usage Based',
                onTap: () => _applyFilter('Usage Based'),
              ),
              _FilterOption(
                title: 'One Time',
                isSelected: _selectedFilter == 'One Time',
                onTap: () => _applyFilter('One Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _applyFilter(String filter) {
    setState(() => _selectedFilter = filter);
    Navigator.pop(context);
  }

  void _showBudgetDetails(Map<String, dynamic> budget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusXL),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: AppDimensions.paddingLG,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: AppDimensions.borderRadiusFull,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              Text(budget['name'], style: AppTypography.headlineSmall),
              const SizedBox(height: AppDimensions.spacing8),
              Text(
                budget['type'],
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              // TODO: Add expense history for this category
              Expanded(
                child: Center(
                  child: Text(
                    'Expense history will be shown here',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    // TODO: Fetch budget data from API
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _SummaryItem({
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(height: AppDimensions.spacing4),
        Text(
          'Rp${(amount / 1000000).toStringAsFixed(1)}Jt',
          style: AppTypography.amountSmall.copyWith(color: color),
        ),
      ],
    );
  }
}

class _FilterOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOption({
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: isSelected
            ? AppTypography.titleSmall.copyWith(color: AppColors.primary)
            : AppTypography.bodyMedium,
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : null,
      onTap: onTap,
    );
  }
}
