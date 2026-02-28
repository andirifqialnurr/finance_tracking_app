import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import 'package:go_router/go_router.dart';
import '../../models/account.dart';
import '../../models/scheduled_fund.dart';
import '../../providers/account_provider.dart';
import '../../providers/scheduled_fund_provider.dart';
import '../../utils/app_toast.dart';
import '../../utils/formatters.dart';
import '../../widgets/common/shimmer_loading.dart';

class ScheduledFundsScreen extends ConsumerWidget {
  const ScheduledFundsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundsAsync = ref.watch(scheduledFundsProvider);
    final accountsAsync = ref.watch(accountsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Scheduled Funds'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: fundsAsync.when(
        loading: () => const ShimmerList(),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 8),
              Text(e.toString(), textAlign: TextAlign.center),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.invalidate(scheduledFundsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (funds) {
          final accountMap = accountsAsync.valueOrNull != null
              ? {for (var a in accountsAsync.valueOrNull!) a.id: a}
              : <String, Account>{};

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(scheduledFundsProvider),
            child: funds.isEmpty
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 64,
                              color: AppColors.textMuted,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'No scheduled funds',
                              style: AppTypography.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Automate your regular top-ups or transfers',
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: AppDimensions.screenPadding,
                    itemCount: funds.length,
                    itemBuilder: (_, i) => _ScheduledFundCard(
                      fund: funds[i],
                      accountMap: accountMap,
                      onToggle: (enabled) async {
                        try {
                          await ref
                              .read(scheduledFundNotifierProvider.notifier)
                              .updateScheduledFund(funds[i].id, {
                                'is_active': enabled,
                              });
                        } catch (e) {
                          if (context.mounted) {
                            AppToast.showError(context, e.toString());
                          }
                        }
                      },
                      onEdit: () async {
                        await context.push(
                          '/scheduled-funds/edit',
                          extra: funds[i],
                        );
                        ref.invalidate(scheduledFundsProvider);
                      },
                      onDelete: () async {
                        final confirmed = await _confirmDelete(context);
                        if (!confirmed) return;
                        try {
                          await ref
                              .read(scheduledFundNotifierProvider.notifier)
                              .deleteScheduledFund(funds[i].id);
                          if (context.mounted) {
                            AppToast.showSuccess(context, 'Deleted');
                          }
                        } catch (e) {
                          if (context.mounted) {
                            AppToast.showError(context, e.toString());
                          }
                        }
                      },
                    ),
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await context.push('/scheduled-funds/add');
          ref.invalidate(scheduledFundsProvider);
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add Schedule',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Schedule'),
            content: const Text(
              'Are you sure you want to delete this scheduled fund?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                ),
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}

class _ScheduledFundCard extends StatelessWidget {
  final ScheduledFund fund;
  final Map<String, Account> accountMap;
  final ValueChanged<bool> onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ScheduledFundCard({
    required this.fund,
    required this.accountMap,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final targetAccount = accountMap[fund.accountId];
    final fromAccount = fund.fromAccountId != null
        ? accountMap[fund.fromAccountId]
        : null;
    final isTransfer = fund.scheduleType == 'TRANSFER';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: fund.isActive ? AppColors.card : AppColors.cardDisabled,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: fund.isActive
              ? AppColors.cardBorder
              : AppColors.cardBorderDisabled,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        (isTransfer ? AppColors.secondary : AppColors.success)
                            .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    isTransfer ? Icons.swap_horiz : Icons.add_card,
                    color: isTransfer ? AppColors.secondary : AppColors.success,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isTransfer && fromAccount != null)
                        Text(
                          '${fromAccount.name} → ${targetAccount?.name ?? fund.accountId}',
                          style: AppTypography.titleSmall,
                        )
                      else
                        Text(
                          'Top Up ${targetAccount?.name ?? fund.accountId}',
                          style: AppTypography.titleSmall,
                        ),
                      Text(
                        '${Formatters.formatCurrency(fund.amount)} on day ${fund.dayOfMonth}',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: fund.isActive,
                  onChanged: onToggle,
                  activeThumbColor: AppColors.success,
                ),
              ],
            ),
            if (fund.description != null && fund.description!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                fund.description!,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
            if (fund.nextExecuteAt != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.schedule, size: 12, color: AppColors.textMuted),
                  const SizedBox(width: 4),
                  Text(
                    'Next: ${Formatters.formatDate(fund.nextExecuteAt!)}',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  label: Text(
                    'Edit',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 16,
                    color: AppColors.error,
                  ),
                  label: Text(
                    'Delete',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
