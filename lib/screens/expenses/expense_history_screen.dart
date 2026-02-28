import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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

class ExpenseHistoryScreen extends ConsumerStatefulWidget {
  const ExpenseHistoryScreen({super.key});

  @override
  ConsumerState<ExpenseHistoryScreen> createState() =>
      _ExpenseHistoryScreenState();
}

class _ExpenseHistoryScreenState extends ConsumerState<ExpenseHistoryScreen> {
  String? _selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(expensesProvider());
    final expenses = expensesAsync.valueOrNull ?? [];
    final filteredExpenses = _selectedCategoryId != null
        ? expenses.where((e) => e.categoryId == _selectedCategoryId).toList()
        : expenses;

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
      body: expensesAsync.isLoading
          ? const LoadingIndicator(message: 'Loading expenses...')
          : expensesAsync.hasError
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    expensesAsync.error.toString(),
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(expensesProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_selectedCategoryId != null)
                  Padding(
                    padding: AppDimensions.screenPadding,
                    child: _buildFilterChip(),
                  ),
                Padding(
                  padding: AppDimensions.screenPadding,
                  child: _buildSummaryCard(expenses),
                ),
                const SizedBox(height: AppDimensions.spacing16),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async => ref.invalidate(expensesProvider),
                    child: filteredExpenses.isEmpty
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
                                    final expense = filteredExpenses[index];
                                    final categoryName = _getCategoryName(
                                      expense.categoryId,
                                    );
                                    return ExpenseListItem(
                                      categoryName: categoryName,
                                      amount: expense.amount,
                                      date: expense.date,
                                      description: expense.description,
                                      onTap: () => _showExpenseDetails(expense),
                                    );
                                  }, childCount: filteredExpenses.length),
                                ),
                              ),
                              const SliverToBoxAdapter(
                                child: SizedBox(
                                  height: AppDimensions.spacing80,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddExpense,
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Expense', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  String _getCategoryName(String categoryId) {
    final categories = ref.read(categoriesProvider).valueOrNull ?? [];
    final match = categories.where((c) => c.id == categoryId).firstOrNull;
    return match?.name ?? categoryId;
  }

  Widget _buildFilterChip() {
    final categories = ref.read(categoriesProvider).valueOrNull ?? [];
    final match = categories
        .where((c) => c.id == _selectedCategoryId)
        .firstOrNull;
    return Chip(
      label: Text(match?.name ?? _selectedCategoryId ?? ''),
      onDeleted: () => setState(() => _selectedCategoryId = null),
      deleteIcon: const Icon(Icons.close, size: 18),
      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
      labelStyle: AppTypography.labelMedium.copyWith(color: AppColors.primary),
    );
  }

  Widget _buildSummaryCard(List<Expense> expenses) {
    final total = expenses.fold<double>(0.0, (s, e) => s + e.amount);
    final now = DateTime.now();
    final monthLabel = Formatters.formatMonthYear(now.month, now.year);

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
              color: Colors.white.withValues(alpha: 0.9),
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
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    final categories = ref.read(categoriesProvider).valueOrNull ?? [];
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
                    ref.invalidate(expensesProvider);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showExpenseDetails(Expense expense) {
    final categoryName = _getCategoryName(expense.categoryId);
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
            if (expense.description.isNotEmpty)
              _DetailRow(label: 'Description', value: expense.description),
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
    context.push('/expenses/add').then((_) {
      if (mounted) ref.invalidate(expensesProvider);
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
