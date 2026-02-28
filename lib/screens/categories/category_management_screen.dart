import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/expense_category.dart';
import '../../providers/category_provider.dart';
import '../../utils/app_toast.dart';
import '../../widgets/categories/category_list_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';

class CategoryManagementScreen extends ConsumerStatefulWidget {
  const CategoryManagementScreen({super.key});

  @override
  ConsumerState<CategoryManagementScreen> createState() =>
      _CategoryManagementScreenState();
}

class _CategoryManagementScreenState
    extends ConsumerState<CategoryManagementScreen> {
  bool _showInactive = true;

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final categories = categoriesAsync.valueOrNull ?? [];
    final filteredCategories = _showInactive
        ? categories
        : categories.where((c) => c.isActive).toList();
    final activeCount = categories.where((c) => c.isActive).length;
    final totalBudget = categories
        .where((c) => c.isActive)
        .fold<double>(0, (sum, c) => sum + c.monthlyBudget);

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
      body: categoriesAsync.isLoading
          ? const LoadingIndicator(message: 'Loading categories...')
          : categoriesAsync.hasError
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categoriesAsync.error.toString(),
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(categoriesProvider),
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
              onRefresh: () async => ref.invalidate(categoriesProvider),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: AppDimensions.screenPadding,
                      child: _buildSummaryCard(activeCount, totalBudget),
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
  }

  Widget _buildSummaryCard(int activeCount, double totalBudget) {
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
          Container(width: 1, height: 40, color: Colors.white.withValues(alpha: 0.3)),
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
    final typeGroups = <CategoryType, List<ExpenseCategory>>{};

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

  String _getTypeLabel(CategoryType type) {
    switch (type) {
      case CategoryType.subscription:
        return 'Subscriptions';
      case CategoryType.dailyContinuous:
        return 'Daily Continuous';
      case CategoryType.usageBased:
        return 'Usage Based';
      case CategoryType.oneTime:
        return 'One Time';
    }
  }

  void _toggleCategory(ExpenseCategory category, bool value) async {
    try {
      await ref.read(categoryNotifierProvider.notifier).updateCategory(
        category.id,
        {'is_active': value},
      );
      if (!mounted) return;
      AppToast.showSuccess(
        context,
        'Category ${value ? 'activated' : 'deactivated'} successfully.',
      );
    } catch (e) {
      if (!mounted) return;
      AppToast.showError(context, 'Failed to update category status.');
    }
  }

  void _navigateToAddCategory() {
    context.push('/categories/add').then((_) {
      if (mounted) ref.invalidate(categoriesProvider);
    });
  }

  void _navigateToEditCategory(ExpenseCategory category) {
    context.push('/categories/edit', extra: category).then((_) {
      if (mounted) ref.invalidate(categoriesProvider);
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
          color: Colors.white.withValues(alpha: 0.9),
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
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}
