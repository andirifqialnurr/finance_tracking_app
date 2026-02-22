import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/expense_category.dart';
import '../../providers/category_provider.dart';
import '../../utils/app_toast.dart';
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
  bool _showInactive = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, _) {
        final filteredCategories = _showInactive
            ? provider.categories
            : provider.categories.where((c) => c.isActive).toList();

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
          body: provider.isLoading
              ? const LoadingIndicator(message: 'Loading categories...')
              : provider.error != null
              ? Center(
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
                )
              : filteredCategories.isEmpty
              ? EmptyState(
                  icon: Icons.category_outlined,
                  title: 'No Categories',
                  message: 'Start by creating your first expense category',
                  actionLabel: 'Add Category',
                  onAction: _navigateToAddCategory,
                )
              : RefreshIndicator(
                  onRefresh: provider.refresh,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: AppDimensions.screenPadding,
                          child: _buildSummaryCard(provider),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppDimensions.spacing16),
                      ),
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
      },
    );
  }

  Widget _buildSummaryCard(CategoryProvider provider) {
    final activeCount = provider.activeCount;
    final totalBudget = provider.totalActiveBudget;

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

  void _toggleCategory(ExpenseCategory category, bool value) async {
    final provider = context.read<CategoryProvider>();
    final success = await provider.toggleStatus(category.id, value);
    if (!mounted) return;
    if (success) {
      AppToast.showSuccess(
        context,
        'Category ${value ? 'activated' : 'deactivated'} successfully.',
      );
    } else {
      final error = provider.submitError;
      AppToast.showError(context, error ?? 'Failed to update category status.');
    }
  }

  void _navigateToAddCategory() {
    Navigator.pushNamed(context, '/categories/add').then((_) {
      if (mounted) context.read<CategoryProvider>().refresh();
    });
  }

  void _navigateToEditCategory(ExpenseCategory category) {
    Navigator.pushNamed(context, '/categories/edit', arguments: category).then((
      _,
    ) {
      if (mounted) context.read<CategoryProvider>().refresh();
    });
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
