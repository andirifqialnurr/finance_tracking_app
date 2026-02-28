import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import 'package:go_router/go_router.dart';
import '../../models/account.dart';
import '../../providers/account_provider.dart';
import '../../utils/app_toast.dart';
import '../../utils/formatters.dart';
import '../../widgets/common/shimmer_loading.dart';

class AccountDetailScreen extends ConsumerStatefulWidget {
  final Account account;
  const AccountDetailScreen({super.key, required this.account});

  @override
  ConsumerState<AccountDetailScreen> createState() =>
      _AccountDetailScreenState();
}

class _AccountDetailScreenState extends ConsumerState<AccountDetailScreen> {
  final _topUpAmountCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();

  @override
  void dispose() {
    _topUpAmountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  void _showTopUpDialog() {
    _topUpAmountCtrl.clear();
    _noteCtrl.clear();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Top Up'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _topUpAmountCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: 'Rp ',
              ),
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _noteCtrl,
              decoration: const InputDecoration(labelText: 'Note (optional)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () => _confirmTopUp(ctx),
            child: const Text('Top Up', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmTopUp(BuildContext dlgCtx) async {
    final amount = double.tryParse(
      _topUpAmountCtrl.text.replaceAll(',', '.').trim(),
    );
    if (amount == null || amount <= 0) {
      AppToast.showError(context, 'Enter a valid amount');
      return;
    }
    Navigator.pop(dlgCtx);
    try {
      await ref
          .read(accountNotifierProvider.notifier)
          .topUp(
            widget.account.id,
            amount,
            note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
          );
      if (mounted) {
        AppToast.showSuccess(context, 'Top up successful');
        ref.invalidate(accountSummaryProvider(widget.account.id));
      }
    } catch (e) {
      if (mounted) AppToast.showError(context, e.toString());
    }
  }

  Future<void> _archiveAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Archive Account'),
        content: Text(
          'Archive "${widget.account.name}"? It will no longer be shown in active accounts.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Archive', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await ref
          .read(accountNotifierProvider.notifier)
          .archiveAccount(widget.account.id);
      if (mounted) {
        AppToast.showSuccess(context, 'Account archived');
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) AppToast.showError(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final summaryAsync = ref.watch(accountSummaryProvider(widget.account.id));
    final account = widget.account;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(account.name),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit',
            onPressed: () async {
              await context.push('/accounts/edit', extra: account);
              ref.invalidate(accountSummaryProvider(account.id));
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'archive') _archiveAccount();
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'archive',
                child: Text('Archive Account'),
              ),
            ],
          ),
        ],
      ),
      body: summaryAsync.when(
        loading: () => const ShimmerGrid(rows: 3, columns: 2, cellHeight: 90),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 8),
              Text(e.toString()),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () =>
                    ref.invalidate(accountSummaryProvider(account.id)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (summary) => _buildBody(summary),
      ),
      floatingActionButton: account.isActive
          ? FloatingActionButton.extended(
              onPressed: _showTopUpDialog,
              backgroundColor: AppColors.success,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'Top Up',
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
    );
  }

  Widget _buildBody(AccountSummary summary) {
    final account = summary.account;
    final isPositive = summary.netFlow >= 0;

    return ListView(
      padding: AppDimensions.screenPadding,
      children: [
        // ── Balance card ──
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primaryLight],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Balance',
                style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 4),
              Text(
                Formatters.formatCurrency(account.balance),
                style: AppTypography.headlineLarge.copyWith(
                  color: Colors.white,
                ),
              ),
              if (account.type == AccountType.savings &&
                  account.goalAmount != null) ...[
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: (account.balance / account.goalAmount!).clamp(
                    0.0,
                    1.0,
                  ),
                  backgroundColor: Colors.white24,
                  color: Colors.white,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(3),
                ),
                const SizedBox(height: 4),
                Text(
                  'Goal: ${Formatters.formatCurrency(account.goalAmount!)}${account.goalLabel != null ? ' — ${account.goalLabel}' : ''}',
                  style: AppTypography.bodySmall.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),

        // ── Net flow ──
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isPositive
                    ? Icons.trending_up_rounded
                    : Icons.trending_down_rounded,
                color: isPositive ? AppColors.success : AppColors.error,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                'Net Flow: ${isPositive ? '+' : ''}${Formatters.formatCurrency(summary.netFlow)}',
                style: AppTypography.titleMedium.copyWith(
                  color: isPositive ? AppColors.success : AppColors.error,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // ── Stats grid ──
        Text('This Period', style: AppTypography.titleMedium),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _StatTile(
              label: 'Income',
              amount: summary.totalIncome,
              color: AppColors.success,
              icon: Icons.arrow_downward,
            ),
            _StatTile(
              label: 'Expense',
              amount: summary.totalExpense,
              color: AppColors.error,
              icon: Icons.arrow_upward,
            ),
            _StatTile(
              label: 'Transfer In',
              amount: summary.totalTransferIn,
              color: AppColors.secondary,
              icon: Icons.login,
            ),
            _StatTile(
              label: 'Transfer Out',
              amount: summary.totalTransferOut,
              color: AppColors.warning,
              icon: Icons.logout,
            ),
          ],
        ),
        const SizedBox(height: 20),

        // ── Account info ──
        if (account.description != null && account.description!.isNotEmpty) ...[
          Text('Description', style: AppTypography.titleMedium),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Text(
              account.description!,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;
  final IconData icon;

  const _StatTile({
    required this.label,
    required this.amount,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  Formatters.formatCurrency(amount),
                  style: AppTypography.titleSmall.copyWith(color: color),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
