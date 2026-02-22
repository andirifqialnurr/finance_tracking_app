import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/expense.dart';
import '../../providers/expense_provider.dart';
import '../../providers/category_provider.dart';
import '../../widgets/expenses/expense_list_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';
import '../../utils/formatters.dart';

class ExpenseHistoryScreen extends StatefulWidget {
  const ExpenseHistoryScreen({super.key});

  @override
  State<ExpenseHistoryScreen> createState() => _ExpenseHistoryScreenState();
}

class _ExpenseHistoryScreenState extends State<ExpenseHistoryScreen> {
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExpenseProvider>().fetchExpenses();
      context.read<CategoryProvider>().fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Expense History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterSheet,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchSheet,
          ),
        ],
      ),
      body: Consumer<ExpenseProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const LoadingIndicator(message: 'Loading expenses...');
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    provider.error!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  ElevatedButton(
                    onPressed: provider.refresh,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Fixed header — does not scroll
              if (_selectedCategoryId != null)
                Padding(
                  padding: AppDimensions.screenPadding,
                  child: _buildFilterChip(context),
                ),
              Padding(
                padding: AppDimensions.screenPadding,
                child: _buildSummaryCard(provider),
              ),
              const SizedBox(height: AppDimensions.spacing16),
              // Scrollable list
              Expanded(
                child: RefreshIndicator(
                  onRefresh: provider.refresh,
                  child: provider.expenses.isEmpty
                      ? EmptyState(
                          icon: Icons.receipt_long_outlined,
                          title: 'No Expenses Yet',
                          message:
                              'Start tracking your expenses to see them here',
                          actionLabel: 'Add Expense',
                          onAction: _navigateToAddExpense,
                        )
                      : CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding: AppDimensions.screenPaddingHorizontal,
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  final expense = provider.expenses[index];
                                  final categoryName = _getCategoryName(
                                    context,
                                    expense.categoryId,
                                  );
                                  return ExpenseListItem(
                                    categoryName: categoryName,
                                    amount: expense.amount,
                                    date: expense.date,
                                    description: expense.description,
                                    onTap: () =>
                                        _showExpenseDetails(context, expense),
                                  );
                                }, childCount: provider.expenses.length),
                              ),
                            ),
                            if (provider.isLoadingMore)
                              const SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    AppDimensions.spacing16,
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            if (provider.hasNextPage && !provider.isLoadingMore)
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppDimensions.spacing8,
                                    horizontal: AppDimensions.spacing16,
                                  ),
                                  child: TextButton(
                                    onPressed: provider.fetchNextPage,
                                    child: const Text('Load more'),
                                  ),
                                ),
                              ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: AppDimensions.spacing80),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddExpense,
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Expense', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  String _getCategoryName(BuildContext context, String categoryId) {
    final categories = context.read<CategoryProvider>().categories;
    final match = categories.where((c) => c.id == categoryId).firstOrNull;
    return match?.name ?? categoryId;
  }

  Widget _buildFilterChip(BuildContext context) {
    final categories = context.read<CategoryProvider>().categories;
    final match = categories
        .where((c) => c.id == _selectedCategoryId)
        .firstOrNull;
    return Chip(
      label: Text(match?.name ?? _selectedCategoryId ?? ''),
      onDeleted: () {
        setState(() => _selectedCategoryId = null);
        context.read<ExpenseProvider>().fetchExpenses();
      },
      deleteIcon: const Icon(Icons.close, size: 18),
      backgroundColor: AppColors.primary.withOpacity(0.1),
      labelStyle: AppTypography.labelMedium.copyWith(color: AppColors.primary),
    );
  }

  Widget _buildSummaryCard(ExpenseProvider provider) {
    final total =
        provider.summary?.totalAmount ??
        provider.expenses.fold<double>(0.0, (s, e) => s + e.amount);
    final now = DateTime.now();
    final monthLabel = Formatters.formatMonthYear(
      provider.month ?? now.month,
      provider.year ?? now.year,
    );

    return Container(
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: AppDimensions.borderRadiusLG,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimensions.elevationMD,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Expenses',
            style: AppTypography.labelMedium.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing8),
          Text(
            Formatters.formatCurrencyCompact(total),
            style: AppTypography.amountLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppDimensions.spacing4),
          Text(
            monthLabel,
            style: AppTypography.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    final categories = context.read<CategoryProvider>().categories;
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
              Text('Filter by Category', style: AppTypography.titleMedium),
              const SizedBox(height: AppDimensions.spacing16),
              ListTile(
                title: const Text('All Categories'),
                trailing: _selectedCategoryId == null
                    ? const Icon(Icons.check, color: AppColors.primary)
                    : null,
                onTap: () {
                  setState(() => _selectedCategoryId = null);
                  context.read<ExpenseProvider>().fetchExpenses();
                  Navigator.pop(ctx);
                },
              ),
              ...categories.map(
                (cat) => ListTile(
                  title: Text(cat.name),
                  trailing: _selectedCategoryId == cat.id
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () {
                    setState(() => _selectedCategoryId = cat.id);
                    context.read<ExpenseProvider>().fetchExpenses(
                      categoryId: cat.id,
                    );
                    Navigator.pop(ctx);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusXL),
        ),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Container(
          padding: AppDimensions.paddingLG,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search expenses...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: AppDimensions.borderRadiusMD,
                    ),
                  ),
                  onSubmitted: (_) {
                    Navigator.pop(ctx);
                    context.read<ExpenseProvider>().fetchExpenses();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showExpenseDetails(BuildContext context, Expense expense) {
    final categoryName = _getCategoryName(context, expense.categoryId);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(categoryName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailRow(
              label: 'Amount',
              value: Formatters.formatCurrency(expense.amount),
            ),
            _DetailRow(
              label: 'Date',
              value: Formatters.formatDate(expense.date),
            ),
            if (expense.description != null && expense.description!.isNotEmpty)
              _DetailRow(label: 'Description', value: expense.description!),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _navigateToAddExpense() {
    Navigator.pushNamed(context, '/expenses/add').then((_) {
      if (mounted) context.read<ExpenseProvider>().refresh();
    });
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(child: Text(value, style: AppTypography.bodyMedium)),
        ],
      ),
    );
  }
}
