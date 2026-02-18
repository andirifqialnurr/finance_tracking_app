import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../widgets/expenses/expense_list_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';

class ExpenseHistoryScreen extends StatefulWidget {
  const ExpenseHistoryScreen({super.key});

  @override
  State<ExpenseHistoryScreen> createState() => _ExpenseHistoryScreenState();
}

class _ExpenseHistoryScreenState extends State<ExpenseHistoryScreen> {
  bool _isLoading = false;
  String? _selectedCategoryFilter;

  // Sample expense data
  final List<Map<String, dynamic>> _expenses = [
    {
      'category': 'Makan',
      'amount': 40000.0,
      'date': DateTime(2026, 2, 18, 12, 30),
      'description': 'Makan siang Warteg',
    },
    {
      'category': 'Bensin',
      'amount': 35000.0,
      'date': DateTime(2026, 2, 17, 8, 15),
      'description': 'Isi bensin Shell',
    },
    {
      'category': 'Makan',
      'amount': 45000.0,
      'date': DateTime(2026, 2, 16, 19, 0),
      'description': 'Makan malam',
    },
    {
      'category': 'Netflix',
      'amount': 120000.0,
      'date': DateTime(2026, 2, 15, 10, 0),
      'description': 'Netflix Premium subscription',
    },
  ];

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
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: _isLoading
            ? const LoadingIndicator(message: 'Loading expenses...')
            : _expenses.isEmpty
            ? EmptyState(
                icon: Icons.receipt_long_outlined,
                title: 'No Expenses Yet',
                message: 'Start tracking your expenses to see them here',
                actionLabel: 'Add Expense',
                onAction: _navigateToAddExpense,
              )
            : CustomScrollView(
                slivers: [
                  // Filter Chips
                  if (_selectedCategoryFilter != null)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: AppDimensions.screenPadding,
                        child: _buildFilterChip(),
                      ),
                    ),

                  // Summary Card
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: AppDimensions.screenPadding,
                      child: _buildSummaryCard(),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppDimensions.spacing16),
                  ),

                  // Expense List
                  SliverPadding(
                    padding: AppDimensions.screenPaddingHorizontal,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final expense = _expenses[index];
                        return ExpenseListItem(
                          categoryName: expense['category'],
                          amount: expense['amount'],
                          date: expense['date'],
                          description: expense['description'],
                          onTap: () {
                            _showExpenseDetails(expense);
                          },
                        );
                      }, childCount: _expenses.length),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppDimensions.spacing24),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddExpense,
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Expense', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildFilterChip() {
    return Chip(
      label: Text(_selectedCategoryFilter!),
      onDeleted: () {
        setState(() {
          _selectedCategoryFilter = null;
        });
      },
      deleteIcon: const Icon(Icons.close, size: 18),
      backgroundColor: AppColors.primary.withOpacity(0.1),
      labelStyle: AppTypography.labelMedium.copyWith(color: AppColors.primary),
    );
  }

  Widget _buildSummaryCard() {
    // Calculate total for current filter
    double total = _expenses.fold(
      0,
      (sum, expense) => sum + (expense['amount'] as double),
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
            'Rp ${(total / 1000).toStringAsFixed(0)}K',
            style: AppTypography.amountLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppDimensions.spacing4),
          Text(
            'February 2026',
            style: AppTypography.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
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
              Text('Filter by Category', style: AppTypography.titleMedium),
              const SizedBox(height: AppDimensions.spacing16),
              _CategoryFilterOption(
                title: 'All Categories',
                isSelected: _selectedCategoryFilter == null,
                onTap: () {
                  setState(() {
                    _selectedCategoryFilter = null;
                  });
                  Navigator.pop(context);
                },
              ),
              _CategoryFilterOption(
                title: 'Makan',
                isSelected: _selectedCategoryFilter == 'Makan',
                onTap: () {
                  setState(() {
                    _selectedCategoryFilter = 'Makan';
                  });
                  Navigator.pop(context);
                },
              ),
              _CategoryFilterOption(
                title: 'Bensin',
                isSelected: _selectedCategoryFilter == 'Bensin',
                onTap: () {
                  setState(() {
                    _selectedCategoryFilter = 'Bensin';
                  });
                  Navigator.pop(context);
                },
              ),
              // TODO: Load categories from API
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
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
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
                  onChanged: (value) {
                    // TODO: Implement search
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showExpenseDetails(Map<String, dynamic> expense) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(expense['category']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailRow(label: 'Amount', value: 'Rp ${expense['amount']}'),
            _DetailRow(label: 'Date', value: expense['date'].toString()),
            if (expense['description'] != null)
              _DetailRow(label: 'Description', value: expense['description']),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _navigateToAddExpense() {
    // TODO: Navigate to add expense screen
    Navigator.pushNamed(context, '/expenses/add');
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    // TODO: Fetch expense data from API
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
  }
}

class _CategoryFilterOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryFilterOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primary)
          : null,
      onTap: onTap,
    );
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
