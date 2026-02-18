import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../widgets/incomes/income_list_item.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/empty_state.dart';

class IncomeHistoryScreen extends StatefulWidget {
  const IncomeHistoryScreen({super.key});

  @override
  State<IncomeHistoryScreen> createState() => _IncomeHistoryScreenState();
}

class _IncomeHistoryScreenState extends State<IncomeHistoryScreen> {
  bool _isLoading = false;

  // Sample income data
  final List<Map<String, dynamic>> _incomes = [
    {
      'source': 'Gaji Februari',
      'amount': 8000000.0,
      'date': DateTime(2026, 2, 1, 10, 0),
      'description': 'Gaji bulanan',
    },
    {
      'source': 'Gaji Januari',
      'amount': 8000000.0,
      'date': DateTime(2026, 1, 1, 10, 0),
      'description': 'Gaji bulanan',
    },
  ];

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
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: _isLoading
            ? const LoadingIndicator(message: 'Loading incomes...')
            : _incomes.isEmpty
            ? EmptyState(
                icon: Icons.attach_money,
                title: 'No Income Yet',
                message: 'Start by adding your first income',
                actionLabel: 'Add Income',
                onAction: _navigateToAddIncome,
              )
            : CustomScrollView(
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

                  // Income List
                  SliverPadding(
                    padding: AppDimensions.screenPaddingHorizontal,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final income = _incomes[index];
                        return IncomeListItem(
                          source: income['source'],
                          amount: income['amount'],
                          date: income['date'],
                          description: income['description'],
                          onTap: () {
                            _showIncomeDetails(income);
                          },
                        );
                      }, childCount: _incomes.length),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppDimensions.spacing24),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddIncome,
        backgroundColor: AppColors.success,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Income', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSummaryCard() {
    // Calculate total for current filter
    double total = _incomes.fold(
      0,
      (sum, income) => sum + (income['amount'] as double),
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
            'Rp ${(total / 1000000).toStringAsFixed(1)}Jt',
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
                    hintText: 'Search incomes...',
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

  void _showIncomeDetails(Map<String, dynamic> income) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(income['source']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailRow(label: 'Amount', value: 'Rp ${income['amount']}'),
            _DetailRow(label: 'Date', value: income['date'].toString()),
            if (income['description'] != null)
              _DetailRow(label: 'Description', value: income['description']),
            const SizedBox(height: AppDimensions.spacing16),
            Text('Budget Allocations', style: AppTypography.titleSmall),
            const SizedBox(height: AppDimensions.spacing8),
            // TODO: Show allocation breakdown
            Text(
              'Allocation details will be shown here',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
              ),
            ),
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

  void _navigateToAddIncome() {
    // TODO: Navigate to add income screen
    Navigator.pushNamed(context, '/incomes/add');
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    // TODO: Fetch income data from API
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
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
