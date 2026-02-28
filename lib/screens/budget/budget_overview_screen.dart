import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/budget.dart';
import '../../models/expense_category.dart';
import '../../providers/budget_provider.dart';
import '../../utils/formatters.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/budget/budget_category_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';

class BudgetOverviewScreen extends ConsumerStatefulWidget {
  const BudgetOverviewScreen({super.key});

  @override
  ConsumerState<BudgetOverviewScreen> createState() =>
      _BudgetOverviewScreenState();
}

class _BudgetOverviewScreenState extends ConsumerState<BudgetOverviewScreen> {
  String _selectedFilter = 'All Categories';
  late int _month;
  late int _year;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _month = now.month;
    _year = now.year;
  }

  String _getCategoryTypeLabel(CategoryType? type) {
    switch (type) {
      case CategoryType.subscription:
        return 'Subscription';
      case CategoryType.dailyContinuous:
        return 'Daily Continuous';
      case CategoryType.usageBased:
        return 'Usage Based';
      case CategoryType.oneTime:
        return 'One Time';
      case null:
        return 'Unknown';
    }
  }

  List<BudgetWithCategory> _filteredBudgets(List<BudgetWithCategory> budgets) {
    if (_selectedFilter == 'All Categories') return budgets;
    return budgets
        .where(
          (b) => _getCategoryTypeLabel(b.category?.type) == _selectedFilter,
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final budgetsAsync = ref.watch(budgetsProvider(month: _month, year: _year));
    final summaryAsync = ref.watch(
      budgetSummaryProvider(month: _month, year: _year),
    );
    final allBudgets = budgetsAsync.valueOrNull ?? [];
    final filtered = _filteredBudgets(allBudgets);
    final summary = summaryAsync.valueOrNull;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Fixed header
          Padding(
            padding: AppDimensions.screenPadding,
            child: _buildSummaryHeader(summary),
          ),
          Padding(
            padding: AppDimensions.screenPaddingHorizontal,
            child: _buildMonthSelector(),
          ),
          const SizedBox(height: AppDimensions.spacing24),

          // Scrollable list
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(budgetsProvider);
                ref.invalidate(budgetSummaryProvider);
              },
              child: budgetsAsync.isLoading && allBudgets.isEmpty
                  ? const LoadingIndicator(message: 'Loading budgets...')
                  : CustomScrollView(
                      slivers: [
                        if (budgetsAsync.hasError)
                          SliverFillRemaining(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    budgetsAsync.error.toString(),
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: AppColors.error,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: AppDimensions.spacing16,
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        ref.invalidate(budgetsProvider),
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else if (filtered.isEmpty)
                          SliverFillRemaining(
                            child: EmptyState(
                              icon: Icons.account_balance_wallet_outlined,
                              title: 'No Budget Data',
                              message: _selectedFilter == 'All Categories'
                                  ? 'Start by adding income to allocate budgets'
                                  : 'No budgets found for $_selectedFilter',
                              actionLabel: _selectedFilter != 'All Categories'
                                  ? 'Clear Filter'
                                  : null,
                              onAction: _selectedFilter != 'All Categories'
                                  ? () => setState(
                                      () => _selectedFilter = 'All Categories',
                                    )
                                  : null,
                            ),
                          )
                        else
                          SliverPadding(
                            padding: AppDimensions.screenPaddingHorizontal,
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,
                              ) {
                                final budget = filtered[index];
                                return BudgetCategoryItem(
                                  categoryName:
                                      budget.category?.name ??
                                      budget.categoryId,
                                  categoryType: _getCategoryTypeLabel(
                                    budget.category?.type,
                                  ),
                                  allocatedAmount: budget.allocatedAmount,
                                  spentAmount: budget.spentAmount,
                                  remainingAmount: budget.remainingAmount,
                                  onTap: () => _showBudgetDetails(budget),
                                );
                              }, childCount: filtered.length),
                            ),
                          ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: AppDimensions.spacing24),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryHeader(BudgetSummary? summary) {
    final totalAllocated = summary?.totalAllocated ?? 0.0;
    final totalSpent = summary?.totalSpent ?? 0.0;
    final totalRemaining = summary?.totalRemaining ?? 0.0;
    final percentageUsed = totalAllocated > 0
        ? (totalSpent / totalAllocated) * 100
        : 0.0;

    return AppCard(
      child: Column(
        children: [
          Text('Total Budget Usage', style: AppTypography.titleMedium),
          const SizedBox(height: AppDimensions.spacing16),

          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: (percentageUsed / 100).clamp(0.0, 1.0),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _SummaryItem(
                label: 'Allocated',
                amount: totalAllocated,
                color: AppColors.info,
              ),
              Container(width: 1, height: 40, color: AppColors.border),
              _SummaryItem(
                label: 'Spent',
                amount: totalSpent,
                color: AppColors.error,
              ),
              Container(width: 1, height: 40, color: AppColors.border),
              _SummaryItem(
                label: 'Remaining',
                amount: totalRemaining,
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
              int m = _month - 1;
              int y = _year;
              if (m < 1) {
                m = 12;
                y -= 1;
              }
              setState(() {
                _month = m;
                _year = y;
              });
            },
          ),
          Expanded(
            child: Text(
              Formatters.formatMonthYear(_month, _year),
              style: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              int m = _month + 1;
              int y = _year;
              if (m > 12) {
                m = 1;
                y += 1;
              }
              setState(() {
                _month = m;
                _year = y;
              });
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
      builder: (ctx) => Container(
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
                        Navigator.pop(ctx);
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

  void _showBudgetDetails(BudgetWithCategory budget) {
    final isSafe = budget.alertStatus == 'safe';
    final isCritical = budget.alertStatus == 'critical';
    final categoryName = budget.category?.name ?? budget.categoryId;
    final categoryType = _getCategoryTypeLabel(budget.category?.type);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusXL),
        ),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (ctx2, scrollController) => SingleChildScrollView(
          controller: scrollController,
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
              Text(categoryName, style: AppTypography.headlineSmall),
              const SizedBox(height: AppDimensions.spacing4),
              Text(
                categoryType,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              _buildDetailRow(
                'Allocated',
                Formatters.formatCurrency(budget.allocatedAmount),
                AppColors.info,
              ),
              const Divider(height: AppDimensions.spacing24),
              _buildDetailRow(
                'Spent',
                Formatters.formatCurrency(budget.spentAmount),
                AppColors.error,
              ),
              const Divider(height: AppDimensions.spacing24),
              _buildDetailRow(
                'Remaining',
                Formatters.formatCurrency(budget.remainingAmount),
                isSafe ? AppColors.success : AppColors.warning,
              ),
              const Divider(height: AppDimensions.spacing24),
              _buildDetailRow(
                'Usage',
                '${budget.percentageUsed.toStringAsFixed(1)}%',
                AppColors.getBudgetColor(budget.percentageUsed),
              ),
              if (!isSafe)
                Container(
                  margin: const EdgeInsets.only(top: AppDimensions.spacing16),
                  padding: AppDimensions.paddingMD,
                  decoration: BoxDecoration(
                    color: (isCritical ? AppColors.error : AppColors.warning)
                        .withValues(alpha: 0.1),
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isCritical
                            ? Icons.error_outline
                            : Icons.warning_amber_outlined,
                        color: isCritical ? AppColors.error : AppColors.warning,
                        size: 20,
                      ),
                      const SizedBox(width: AppDimensions.spacing8),
                      Expanded(
                        child: Text(
                          isCritical
                              ? 'Over budget! Spending exceeds allocation.'
                              : 'Warning: spending is above ${budget.alertThreshold}%.',
                          style: AppTypography.bodySmall.copyWith(
                            color: isCritical
                                ? AppColors.error
                                : AppColors.warning,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: AppDimensions.spacing24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(value, style: AppTypography.titleSmall.copyWith(color: color)),
      ],
    );
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
