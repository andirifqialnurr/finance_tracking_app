import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../core/navigation/routes.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/dashboard/summary_card.dart';
import '../../widgets/dashboard/income_expense_chart.dart';
import '../../utils/formatters.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final double totalIncome = 8000000;
  final double totalAllocated = 2099000;
  final double totalSpent = 1850000;
  final double totalRemaining = 249000;

  // Sample chart data
  final List<MonthlyData> chartData = [
    MonthlyData(month: 1, year: 2026, income: 8000000, expense: 1800000),
    MonthlyData(month: 2, year: 2026, income: 8000000, expense: 1850000),
  ];

  // Sample recent transactions (5 most recent)
  final List<Map<String, dynamic>> recentTransactions = [
    {
      'type': 'expense',
      'title': 'Makan',
      'amount': 40000.0,
      'date': DateTime(2026, 2, 18, 12, 30),
      'description': 'Makan siang Warteg',
    },
    {
      'type': 'expense',
      'title': 'Bensin',
      'amount': 35000.0,
      'date': DateTime(2026, 2, 17, 8, 15),
      'description': 'Isi bensin Shell',
    },
    {
      'type': 'expense',
      'title': 'Makan',
      'amount': 45000.0,
      'date': DateTime(2026, 2, 16, 19, 0),
      'description': 'Makan malam',
    },
    {
      'type': 'expense',
      'title': 'Netflix',
      'amount': 120000.0,
      'date': DateTime(2026, 2, 15, 10, 0),
      'description': 'Netflix Premium',
    },
    {
      'type': 'income',
      'title': 'Freelance Project',
      'amount': 2000000.0,
      'date': DateTime(2026, 2, 5, 15, 0),
      'description': 'Web development',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          AppIconButton(
            icon: Icons.notifications_outlined,
            onPressed: _openNotifications,
          ),
          AppIconButton(
            icon: Icons.settings_outlined,
            onPressed: _openSettings,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Date
              _buildHeader(),
              const SizedBox(height: AppDimensions.spacing24),

              // Summary Cards Grid
              _buildSummaryCards(),
              const SizedBox(height: AppDimensions.spacing24),

              // Chart Section
              _buildChartSection(),
              const SizedBox(height: AppDimensions.spacing24),

              // Recent Activity (placeholder)
              _buildRecentActivity(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddOptions,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader() {
    final monthYear = 'February 2026'; // TODO: Get from current period

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hi, Welcome Back! 👋', style: AppTypography.headlineSmall),
        const SizedBox(height: AppDimensions.spacing4),
        Text(
          monthYear,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCards() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppDimensions.spacing16,
      mainAxisSpacing: AppDimensions.spacing16,
      childAspectRatio: 1.4,
      children: [
        SummaryCard(
          title: 'Total Income',
          amount: totalIncome,
          icon: Icons.arrow_downward,
          iconColor: AppColors.success,
          onTap: () {
            Navigator.pushNamed(context, Routes.incomeHistory);
          },
        ),
        SummaryCard(
          title: 'Allocated',
          amount: totalAllocated,
          icon: Icons.account_balance_wallet_outlined,
          iconColor: AppColors.info,
          onTap: () {
            Navigator.pushNamed(context, Routes.budgetOverview);
          },
        ),
        SummaryCard(
          title: 'Spent',
          amount: totalSpent,
          icon: Icons.arrow_upward,
          iconColor: AppColors.error,
          onTap: () {
            Navigator.pushNamed(context, Routes.expenseHistory);
          },
        ),
        SummaryCard(
          title: 'Remaining',
          amount: totalRemaining,
          icon: Icons.savings_outlined,
          iconColor: AppColors.warning,
        ),
      ],
    );
  }

  Widget _buildChartSection() {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Income vs Expense', style: AppTypography.titleMedium),
              TextButton(
                onPressed: () {
                  // Navigate to transaction history to see all transactions
                  Navigator.pushNamed(context, Routes.transactionHistory);
                },
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing16),
          const ChartLegend(),
          const SizedBox(height: AppDimensions.spacing16),
          IncomeExpenseChart(data: chartData),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Activity', style: AppTypography.titleMedium),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.transactionHistory);
                },
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing16),
          // Recent transactions list
          ...recentTransactions.asMap().entries.map((entry) {
            final index = entry.key;
            final transaction = entry.value;
            final isLast = index == recentTransactions.length - 1;
            return _buildTransactionItem(transaction, isLast);
          }),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction, bool isLast) {
    final isIncome = transaction['type'] == 'income';
    final title = transaction['title'] as String;
    final amount = transaction['amount'] as double;
    final date = transaction['date'] as DateTime;
    final description = transaction['description'] as String?;

    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.transactionHistory);
          },
          borderRadius: AppDimensions.borderRadiusMD,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.spacing8,
            ),
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
                    size: 20,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacing12),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTypography.titleSmall),
                      const SizedBox(height: AppDimensions.spacing4),
                      Text(
                        description ?? '',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textMuted,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppDimensions.spacing8),
                // Amount and Date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${isIncome ? '+' : '-'}${Formatters.formatCurrencyCompact(amount)}',
                      style: AppTypography.amountSmall.copyWith(
                        color: isIncome ? AppColors.success : AppColors.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing4),
                    Text(
                      Formatters.formatDate(date),
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (!isLast) Divider(height: 1, color: AppColors.borderLight),
      ],
    );
  }

  void _showAddOptions() {
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
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: AppDimensions.borderRadiusFull,
                ),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing8),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: const Icon(
                    Icons.arrow_downward,
                    color: AppColors.success,
                  ),
                ),
                title: const Text('Add Income'),
                subtitle: const Text('Record new income'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.addIncome);
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing8),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: const Icon(Icons.arrow_upward, color: AppColors.error),
                ),
                title: const Text('Add Expense'),
                subtitle: const Text('Record new expense'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.addExpense);
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing8),
                  decoration: BoxDecoration(
                    color: AppColors.info.withOpacity(0.1),
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: const Icon(
                    Icons.category_outlined,
                    color: AppColors.info,
                  ),
                ),
                title: const Text('Manage Categories'),
                subtitle: const Text('Add or edit categories'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.categoryManagement);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    // TODO: Implement data refresh
    await Future.delayed(const Duration(seconds: 1));
  }

  void _openNotifications() {
    // TODO: Navigate to notifications screen when implemented
    // Navigator.pushNamed(context, Routes.notifications);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notifications'),
        content: const Text('Notification feature will be available soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _openSettings() {
    // TODO: Navigate to settings screen when implemented
    // Navigator.pushNamed(context, Routes.settings);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Settings'),
        content: const Text('Settings feature will be available soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
