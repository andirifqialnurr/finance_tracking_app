import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/expense_category.dart';
import '../../widgets/categories/category_list_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';

class CategoryManagementScreen extends StatefulWidget {
  const CategoryManagementScreen({super.key});

  @override
  State<CategoryManagementScreen> createState() =>
      _CategoryManagementScreenState();
}

class _CategoryManagementScreenState extends State<CategoryManagementScreen> {
  bool _isLoading = false;
  bool _showInactive = false;

  // Sample categories
  final List<ExpenseCategory> _categories = [
    ExpenseCategory(
      id: '1',
      name: 'Makan',
      type: ExpenseCategoryType.dailyContinuous,
      monthlyBudget: 1240000,
      allocationPriority: 1,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ExpenseCategory(
      id: '2',
      name: 'Bensin',
      type: ExpenseCategoryType.usageBased,
      monthlyBudget: 176000,
      allocationPriority: 2,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ExpenseCategory(
      id: '3',
      name: 'Netflix',
      type: ExpenseCategoryType.subscription,
      monthlyBudget: 120000,
      allocationPriority: 3,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ExpenseCategory(
      id: '4',
      name: 'Internet',
      type: ExpenseCategoryType.subscription,
      monthlyBudget: 100000,
      allocationPriority: 4,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ExpenseCategory(
      id: '5',
      name: 'Entertainment',
      type: ExpenseCategoryType.oneTime,
      monthlyBudget: 500000,
      allocationPriority: 5,
      isActive: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCategories = _showInactive
        ? _categories
        : _categories.where((c) => c.isActive).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Manage Categories'),
        actions: [
          IconButton(
            icon: Icon(
              _showInactive
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
            onPressed: () {
              setState(() {
                _showInactive = !_showInactive;
              });
            },
            tooltip: _showInactive ? 'Hide Inactive' : 'Show Inactive',
          ),
        ],
      ),
      body: _isLoading
          ? const LoadingIndicator(message: 'Loading categories...')
          : filteredCategories.isEmpty
          ? EmptyState(
              icon: Icons.category_outlined,
              title: 'No Categories',
              message: 'Start by creating your first expense category',
              actionLabel: 'Add Category',
              onAction: _navigateToAddCategory,
            )
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: CustomScrollView(
                slivers: [
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

                  // Categories by Type
                  ..._buildCategoriesByType(filteredCategories),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppDimensions.spacing80),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddCategory,
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add Category',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    final activeCount = _categories.where((c) => c.isActive).length;
    final totalBudget = _categories
        .where((c) => c.isActive)
        .fold(0.0, (sum, c) => sum + c.monthlyBudget);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(
            label: 'Active',
            value: activeCount.toString(),
            icon: Icons.check_circle_outline,
          ),
          Container(width: 1, height: 40, color: Colors.white.withOpacity(0.3)),
          _SummaryItem(
            label: 'Total Budget',
            value: 'Rp ${(totalBudget / 1000000).toStringAsFixed(1)}Jt',
            icon: Icons.account_balance_wallet_outlined,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategoriesByType(List<ExpenseCategory> categories) {
    final typeGroups = <ExpenseCategoryType, List<ExpenseCategory>>{};

    for (var category in categories) {
      typeGroups.putIfAbsent(category.type, () => []).add(category);
    }

    final widgets = <Widget>[];

    for (var entry in typeGroups.entries) {
      widgets.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.spacing16,
              AppDimensions.spacing16,
              AppDimensions.spacing16,
              AppDimensions.spacing8,
            ),
            child: Text(
              _getTypeLabel(entry.key),
              style: AppTypography.titleMedium,
            ),
          ),
        ),
      );

      widgets.add(
        SliverPadding(
          padding: AppDimensions.screenPaddingHorizontal,
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final category = entry.value[index];
              return CategoryListItem(
                category: category,
                onTap: () => _navigateToEditCategory(category),
                onToggle: (value) => _toggleCategory(category, value),
              );
            }, childCount: entry.value.length),
          ),
        ),
      );
    }

    return widgets;
  }

  String _getTypeLabel(ExpenseCategoryType type) {
    switch (type) {
      case ExpenseCategoryType.subscription:
        return 'Subscriptions';
      case ExpenseCategoryType.dailyContinuous:
        return 'Daily Continuous';
      case ExpenseCategoryType.usageBased:
        return 'Usage Based';
      case ExpenseCategoryType.oneTime:
        return 'One Time';
    }
  }

  void _toggleCategory(ExpenseCategory category, bool value) {
    setState(() {
      // TODO: API call to toggle category
      final index = _categories.indexWhere((c) => c.id == category.id);
      if (index != -1) {
        _categories[index] = category.copyWith(isActive: value);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Category ${value ? 'activated' : 'deactivated'}'),
        backgroundColor: value ? AppColors.success : AppColors.warning,
      ),
    );
  }

  void _navigateToAddCategory() {
    // TODO: Navigate to add category screen
    Navigator.pushNamed(context, '/categories/add');
  }

  void _navigateToEditCategory(ExpenseCategory category) {
    // TODO: Navigate to edit category screen
    Navigator.pushNamed(context, '/categories/edit', arguments: category);
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    // TODO: Fetch categories from API
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _SummaryItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.9),
          size: AppDimensions.iconLG,
        ),
        const SizedBox(height: AppDimensions.spacing8),
        Text(
          value,
          style: AppTypography.titleLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing4),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
