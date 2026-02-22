import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../core/navigation/routes.dart';
import '../../models/transaction.dart';
import '../../providers/transaction_provider.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';
import '../../utils/formatters.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _tabTypes = [null, 'income', 'expense'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TransactionProvider>().fetchTransactions();
    });
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      context.read<TransactionProvider>().filterByType(
        _tabTypes[_tabController.index],
      );
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Transaction History')),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              // Period Summary Card — always visible, updates per tab
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.spacing16,
                  AppDimensions.spacing16,
                  AppDimensions.spacing16,
                  0,
                ),
                child: _buildSummaryCard(
                  provider.summary ??
                      TransactionSummary(
                        totalIncome: 0,
                        totalExpense: 0,
                        netBalance: 0,
                      ),
                ),
              ),

              // Tab bar wrapped in card
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing16,
                  vertical: AppDimensions.spacing12,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: AppDimensions.borderRadiusLG,
                    border: Border.all(color: AppColors.cardBorder),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: AppDimensions.elevationSM,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: AppDimensions.borderRadiusLG,
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Income'),
                        Tab(text: 'Expenses'),
                      ],
                      indicator: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: AppDimensions.borderRadiusMD,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      labelColor: AppColors.textOnDark,
                      unselectedLabelColor: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),

              // Transaction list / loading / error
              Expanded(child: _buildContent(provider)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(TransactionProvider provider) {
    if (provider.isLoading) {
      return const LoadingIndicator(message: 'Loading transactions...');
    }

    if (provider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.error!,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.error),
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

    return RefreshIndicator(
      onRefresh: provider.refresh,
      child: _buildTransactionList(provider),
    );
  }

  Widget _buildTransactionList(TransactionProvider provider) {
    final transactions = provider.transactions;

    if (transactions.isEmpty) {
      return EmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No Transactions',
        message: _tabController.index == 1
            ? 'No income records found'
            : _tabController.index == 2
            ? 'No expense records found'
            : 'Start by adding your first transaction',
        actionLabel: _tabController.index == 1 ? 'Add Income' : 'Add Expense',
        onAction: () {
          if (_tabController.index == 1) {
            Navigator.pushNamed(context, Routes.addIncome);
          } else {
            Navigator.pushNamed(context, Routes.addExpense);
          }
        },
      );
    }

    // Group transactions by date
    final groupedTransactions = _groupTransactionsByDate(transactions);

    return CustomScrollView(
      slivers: [
        // Transactions grouped by date
        ...groupedTransactions.entries.map((entry) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: AppDimensions.screenPaddingHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.spacing8,
                    ),
                    child: Text(
                      entry.key,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  // Transactions for this date
                  ...entry.value.map((transaction) {
                    return _buildTransactionItem(transaction);
                  }),
                  const SizedBox(height: AppDimensions.spacing12),
                ],
              ),
            ),
          );
        }),

        // Load more
        if (provider.isLoadingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.spacing16),
              child: Center(child: CircularProgressIndicator()),
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
          child: SizedBox(height: AppDimensions.spacing24),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(TransactionSummary summary) {
    return AppCard(
      child: Column(
        children: [
          Text('Period Summary', style: AppTypography.titleMedium),
          const SizedBox(height: AppDimensions.spacing16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (_tabController.index == 0 || _tabController.index == 1)
                _SummaryItem(
                  label: 'Income',
                  amount: summary.totalIncome,
                  color: AppColors.success,
                ),
              if (_tabController.index == 0)
                Container(width: 1, height: 40, color: AppColors.border),
              if (_tabController.index == 0 || _tabController.index == 2)
                _SummaryItem(
                  label: 'Expenses',
                  amount: summary.totalExpense,
                  color: AppColors.error,
                ),
              if (_tabController.index == 0)
                Container(width: 1, height: 40, color: AppColors.border),
              if (_tabController.index == 0)
                _SummaryItem(
                  label: 'Balance',
                  amount: summary.netBalance,
                  color: summary.netBalance >= 0
                      ? AppColors.success
                      : AppColors.error,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    final isIncome = transaction.isIncome;
    final title = isIncome
        ? (transaction.source ?? 'Income')
        : (transaction.category?.name ?? 'Expense');

    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacing8),
      child: AppCard(
        padding: AppDimensions.paddingMD,
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(AppDimensions.spacing8),
              decoration: BoxDecoration(
                color: isIncome
                    ? AppColors.success.withOpacity(0.1)
                    : AppColors.error.withOpacity(0.1),
                borderRadius: AppDimensions.borderRadiusMD,
              ),
              child: Icon(
                isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                color: isIncome ? AppColors.success : AppColors.error,
                size: AppDimensions.iconMD,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.titleSmall),
                  if (transaction.description != null &&
                      transaction.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimensions.spacing4,
                      ),
                      child: Text(
                        transaction.description!,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textMuted,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(
                    '${transaction.date.hour.toString().padLeft(2, '0')}:${transaction.date.minute.toString().padLeft(2, '0')}',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            // Amount
            Text(
              '${isIncome ? '+' : '-'}${Formatters.formatCurrency(transaction.amount)}',
              style: AppTypography.amountSmall.copyWith(
                color: isIncome ? AppColors.success : AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, List<Transaction>> _groupTransactionsByDate(
    List<Transaction> transactions,
  ) {
    final Map<String, List<Transaction>> grouped = {};

    // Sort transactions by date (newest first)
    final sorted = List<Transaction>.from(transactions)
      ..sort((a, b) => b.date.compareTo(a.date));

    for (final tx in sorted) {
      final dateKey = Formatters.formatDate(tx.date);
      grouped.putIfAbsent(dateKey, () => []).add(tx);
    }

    return grouped;
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
          Formatters.formatCurrencyCompact(amount),
          style: AppTypography.amountSmall.copyWith(color: color),
        ),
      ],
    );
  }
}
