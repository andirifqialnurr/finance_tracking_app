import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/income.dart';
import '../../providers/income_provider.dart';
import '../../services/income_service.dart';
import '../../widgets/incomes/income_list_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';
import '../../utils/formatters.dart';

class IncomeHistoryScreen extends StatefulWidget {
  const IncomeHistoryScreen({super.key});

  @override
  State<IncomeHistoryScreen> createState() => _IncomeHistoryScreenState();
}

class _IncomeHistoryScreenState extends State<IncomeHistoryScreen> {
  final IncomeService _incomeService = IncomeService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IncomeProvider>().fetchIncomes();
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<IncomeProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const LoadingIndicator(message: 'Loading incomes...');
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
              // Fixed summary card — does not scroll
              Padding(
                padding: AppDimensions.screenPadding,
                child: _buildSummaryCard(provider),
              ),
              const SizedBox(height: AppDimensions.spacing16),
              // Scrollable list
              Expanded(
                child: RefreshIndicator(
                  onRefresh: provider.refresh,
                  child: provider.incomes.isEmpty
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
                                  final income = provider.incomes[index];
                                  return IncomeListItem(
                                    source: income.source,
                                    amount: income.amount,
                                    date: income.date,
                                    description: income.description,
                                    onTap: () => _showIncomeDetails(income),
                                  );
                                }, childCount: provider.incomes.length),
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
        onPressed: _navigateToAddIncome,
        backgroundColor: AppColors.success,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Income', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSummaryCard(IncomeProvider provider) {
    final total = provider.incomes.fold<double>(
      0.0,
      (sum, income) => sum + income.amount,
    );
    final now = DateTime.now();
    final monthLabel = Formatters.formatMonthYear(
      provider.month ?? now.month,
      provider.year ?? now.year,
    );

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
                    context.read<IncomeProvider>().fetchIncomes();
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
        content: FutureBuilder<IncomeWithAllocations>(
          future: _incomeService.getIncomeWithAllocations(income.id),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 80,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final allocations = snapshot.data?.allocations ?? [];
            return SingleChildScrollView(
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
                  if (income.description != null &&
                      income.description!.isNotEmpty)
                    _DetailRow(
                      label: 'Description',
                      value: income.description!,
                    ),
                  if (allocations.isNotEmpty) ...[
                    const SizedBox(height: AppDimensions.spacing16),
                    Text('Budget Allocations', style: AppTypography.titleSmall),
                    const SizedBox(height: AppDimensions.spacing8),
                    ...allocations.map(
                      (a) => _DetailRow(
                        label: a.categoryName,
                        value: Formatters.formatCurrency(a.allocated),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
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
    Navigator.pushNamed(context, '/incomes/add').then((_) {
      if (mounted) context.read<IncomeProvider>().refresh();
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
