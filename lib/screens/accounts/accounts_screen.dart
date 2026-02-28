import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import 'package:go_router/go_router.dart';
import '../../models/account.dart';
import '../../providers/account_provider.dart';
import '../../utils/formatters.dart';
import '../../widgets/common/shimmer_loading.dart';

class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Accounts'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: accountsAsync.when(
        loading: () => const ShimmerList(itemHeight: 90),
        error: (e, _) => Center(
          child: Padding(
            padding: AppDimensions.screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 56, color: AppColors.error),
                const SizedBox(height: 12),
                Text(e.toString(), textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(accountsProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (accounts) {
          final active = accounts.where((a) => a.isActive).toList();
          final archived = accounts.where((a) => !a.isActive).toList();

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(accountsProvider),
            child: ListView(
              padding: AppDimensions.screenPadding,
              children: [
                _TotalBalanceCard(accounts: active),
                const SizedBox(height: 20),
                if (active.isNotEmpty) ...[
                  Text('Active Accounts', style: AppTypography.titleMedium),
                  const SizedBox(height: 12),
                  ...active.map((a) => _AccountCard(account: a)),
                ],
                if (archived.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Text(
                    'Archived',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...archived.map((a) => _AccountCard(account: a)),
                ],
                if (accounts.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 64,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'No accounts yet',
                            style: AppTypography.bodyLarge.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add your first account below',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 80),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await context.push('/accounts/add');
          ref.invalidate(accountsProvider);
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Account', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ─── Total Balance Card ───────────────────────────────────────────────────────
class _TotalBalanceCard extends StatelessWidget {
  final List<Account> accounts;
  const _TotalBalanceCard({required this.accounts});

  @override
  Widget build(BuildContext context) {
    final total = accounts.fold<double>(0, (sum, a) => sum + a.balance);
    return Container(
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
            'Total Balance',
            style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 4),
          Text(
            Formatters.formatCurrency(total),
            style: AppTypography.headlineLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            '${accounts.length} active account${accounts.length != 1 ? 's' : ''}',
            style: AppTypography.bodySmall.copyWith(color: Colors.white60),
          ),
        ],
      ),
    );
  }
}

// ─── Account Card ─────────────────────────────────────────────────────────────
class _AccountCard extends StatelessWidget {
  final Account account;
  const _AccountCard({required this.account});

  Color get _accentColor {
    if (account.color != null && account.color!.startsWith('#')) {
      try {
        return Color(int.parse(account.color!.replaceFirst('#', '0xFF')));
      } catch (_) {}
    }
    switch (account.type) {
      case AccountType.card:
        return AppColors.secondary;
      case AccountType.cash:
        return AppColors.success;
      case AccountType.savings:
        return const Color(0xFFF59E0B); // amber
    }
  }

  IconData get _icon {
    switch (account.type) {
      case AccountType.card:
        return Icons.credit_card;
      case AccountType.cash:
        return Icons.wallet;
      case AccountType.savings:
        return Icons.savings;
    }
  }

  String get _typeLabel {
    switch (account.type) {
      case AccountType.card:
        return 'CARD';
      case AccountType.cash:
        return 'CASH';
      case AccountType.savings:
        return 'SAVINGS';
    }
  }

  @override
  Widget build(BuildContext context) {
    final disabled = !account.isActive;
    return Opacity(
      opacity: disabled ? 0.6 : 1.0,
      child: GestureDetector(
        onTap: () => context.push('/accounts/detail', extra: account),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: disabled ? AppColors.cardDisabled : AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: disabled
                  ? AppColors.cardBorderDisabled
                  : AppColors.cardBorder,
            ),
            boxShadow: disabled
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_icon, color: _accentColor, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(account.name, style: AppTypography.titleMedium),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _accentColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            _typeLabel,
                            style: AppTypography.labelSmall.copyWith(
                              color: _accentColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (!account.isActive) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.textMuted.withValues(
                                alpha: 0.15,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'ARCHIVED',
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      Formatters.formatCurrency(account.balance),
                      style: AppTypography.titleLarge.copyWith(
                        color: account.balance >= 0
                            ? AppColors.textPrimary
                            : AppColors.error,
                      ),
                    ),
                    if (account.type == AccountType.savings &&
                        account.goalAmount != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LinearProgressIndicator(
                              value: (account.balance / account.goalAmount!)
                                  .clamp(0.0, 1.0),
                              backgroundColor: _accentColor.withValues(
                                alpha: 0.15,
                              ),
                              color: _accentColor,
                              minHeight: 4,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Goal: ${Formatters.formatCurrency(account.goalAmount!)}${account.goalLabel != null ? ' · ${account.goalLabel}' : ''}',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
