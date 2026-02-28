import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/income.dart';
import '../../providers/income_provider.dart';
import '../../widgets/incomes/income_list_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';
import '../../utils/formatters.dart';

class IncomeHistoryScreen extends ConsumerStatefulWidget {
  const IncomeHistoryScreen({super.key});

  @override
  ConsumerState<IncomeHistoryScreen> createState() =>
      _IncomeHistoryScreenState();
}

class _IncomeHistoryScreenState extends ConsumerState<IncomeHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final incomesAsync = ref.watch(incomesProvider());
    final incomes = incomesAsync.valueOrNull ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Income History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchSheet,
          ),
        ],
      ),
      body: incomesAsync.isLoading
          ? const LoadingIndicator(message: 'Loading incomes...')
          : incomesAsync.hasError
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    incomesAsync.error.toString(),
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(incomesProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: AppDimensions.screenPadding,
                  child: _buildSummaryCard(incomes),
                ),
                const SizedBox(height: AppDimensions.spacing16),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async => ref.invalidate(incomesProvider),
                    child: incomes.isEmpty
                        ? EmptyState(
                            icon: Icons.attach_money,
                            title: 'No Income Yet',
                            message: 'Start by adding your first income',
                            actionLabel: 'Add Income',
                            onAction: _navigateToAddIncome,
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
                                    final income = incomes[index];
                                    return IncomeListItem(
                                      source: income.source,
                                      amount: income.amount,
                                      date: income.date,
                                      description: income.description,
                                      onTap: () => _showIncomeDetails(income),
                                    );
                                  }, childCount: incomes.length),
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
        onPressed: _navigateToAddIncome,
        backgroundColor: AppColors.success,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Income', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSummaryCard(List<Income> incomes) {
    final total = incomes.fold<double>(
      0.0,
      (sum, income) => sum + income.amount,
    );
    final now = DateTime.now();
    final monthLabel = Formatters.formatMonthYear(now.month, now.year);

    return Container(
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        gradient: AppColors.successGradient,
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
            'Total Income',
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
                    hintText: 'Search incomes...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: AppDimensions.borderRadiusMD,
                    ),
                  ),
                  onSubmitted: (_) {
                    Navigator.pop(ctx);
                    ref.invalidate(incomesProvider);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showIncomeDetails(Income income) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(income.source),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DetailRow(
                label: 'Amount',
                value: Formatters.formatCurrency(income.amount),
              ),
              _DetailRow(
                label: 'Date',
                value: Formatters.formatDate(income.date),
              ),
              if (income.description != null && income.description!.isNotEmpty)
                _DetailRow(label: 'Description', value: income.description!),
            ],
          ),
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

  void _navigateToAddIncome() {
    context.push('/incomes/add').then((_) {
      if (mounted) ref.invalidate(incomesProvider);
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
