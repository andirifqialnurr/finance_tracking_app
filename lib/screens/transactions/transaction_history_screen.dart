import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../core/navigation/routes.dart';
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
  bool _isLoading = false;
  late TabController _tabController;

  // Sample transaction data
  final List<Map<String, dynamic>> _allTransactions = [
    {
      'type': 'income',
      'source': 'Gaji Februari',
      'amount': 8000000.0,
      'date': DateTime(2026, 2, 1, 9, 0),
      'description': 'Gaji bulanan',
    },
    {
      'type': 'expense',
      'category': 'Makan',
      'amount': 40000.0,
      'date': DateTime(2026, 2, 18, 12, 30),
      'description': 'Makan siang Warteg',
    },
    {
      'type': 'expense',
      'category': 'Bensin',
      'amount': 35000.0,
      'date': DateTime(2026, 2, 17, 8, 15),
      'description': 'Isi bensin Shell',
    },
    {
      'type': 'expense',
      'category': 'Makan',
      'amount': 45000.0,
      'date': DateTime(2026, 2, 16, 19, 0),
      'description': 'Makan malam',
    },
    {
      'type': 'expense',
      'category': 'Netflix',
      'amount': 120000.0,
      'date': DateTime(2026, 2, 15, 10, 0),
      'description': 'Netflix Premium subscription',
    },
    {
      'type': 'expense',
      'category': 'Spotify',
      'amount': 60000.0,
      'date': DateTime(2026, 2, 10, 14, 30),
      'description': 'Spotify Premium',
    },
    {
      'type': 'income',
      'source': 'Freelance Project X',
      'amount': 2000000.0,
      'date': DateTime(2026, 2, 5, 15, 0),
      'description': 'Project web development',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredTransactions {
    if (_tabController.index == 0) {
      return _allTransactions;
    } else if (_tabController.index == 1) {
      return _allTransactions.where((t) => t['type'] == 'income').toList();
    } else {
      return _allTransactions.where((t) => t['type'] == 'expense').toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Transaction History'),
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) => setState(() {}),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Income'),
            Tab(text: 'Expenses'),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: _isLoading
            ? const LoadingIndicator(message: 'Loading transactions...')
            : _buildTransactionList(),
      ),
    );
  }

  Widget _buildTransactionList() {
    final transactions = _filteredTransactions;

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

        const SliverToBoxAdapter(
          child: SizedBox(height: AppDimensions.spacing24),
        ),
      ],
    );
  }

  Widget _buildSummaryCard() {
    final transactions = _filteredTransactions;
    final totalIncome = transactions
        .where((t) => t['type'] == 'income')
        .fold(0.0, (sum, t) => sum + (t['amount'] as double));
    final totalExpense = transactions
        .where((t) => t['type'] == 'expense')
        .fold(0.0, (sum, t) => sum + (t['amount'] as double));
    final balance = totalIncome - totalExpense;

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
                  amount: totalIncome,
                  color: AppColors.success,
                ),
              if (_tabController.index == 0)
                Container(width: 1, height: 40, color: AppColors.border),
              if (_tabController.index == 0 || _tabController.index == 2)
                _SummaryItem(
                  label: 'Expenses',
                  amount: totalExpense,
                  color: AppColors.error,
                ),
              if (_tabController.index == 0)
                Container(width: 1, height: 40, color: AppColors.border),
              if (_tabController.index == 0)
                _SummaryItem(
                  label: 'Balance',
                  amount: balance,
                  color: balance >= 0 ? AppColors.success : AppColors.error,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    final isIncome = transaction['type'] == 'income';
    final title = isIncome ? transaction['source'] : transaction['category'];
    final amount = transaction['amount'] as double;
    final date = transaction['date'] as DateTime;
    final description = transaction['description'] as String?;

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
                  if (description != null && description.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimensions.spacing4,
                      ),
                      child: Text(
                        description,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textMuted,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(
                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            // Amount
            Text(
              '${isIncome ? '+' : '-'}${Formatters.formatCurrency(amount)}',
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

  Map<String, List<Map<String, dynamic>>> _groupTransactionsByDate(
    List<Map<String, dynamic>> transactions,
  ) {
    final Map<String, List<Map<String, dynamic>>> grouped = {};

    // Sort transactions by date (newest first)
    final sortedTransactions = List<Map<String, dynamic>>.from(
      transactions,
    )..sort((a, b) => (b['date'] as DateTime).compareTo(a['date'] as DateTime));

    for (var transaction in sortedTransactions) {
      final date = transaction['date'] as DateTime;
      final dateKey = Formatters.formatDate(date);

      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(transaction);
    }

    return grouped;
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    // TODO: Fetch transaction data from API
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
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
