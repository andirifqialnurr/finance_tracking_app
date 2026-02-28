import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import 'package:go_router/go_router.dart';
import '../../models/account.dart';
import '../../models/transfer.dart';
import '../../providers/account_provider.dart';
import '../../providers/transfer_provider.dart';
import '../../utils/app_toast.dart';
import '../../utils/formatters.dart';
import '../../widgets/common/shimmer_loading.dart';

class TransfersScreen extends ConsumerWidget {
  const TransfersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transfersAsync = ref.watch(transfersProvider());
    final accountsAsync = ref.watch(accountsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Transfers'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: transfersAsync.when(
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
                onPressed: () => ref.invalidate(transfersProvider()),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (transfers) {
          final accountMap = accountsAsync.valueOrNull != null
              ? {for (var a in accountsAsync.valueOrNull!) a.id: a}
              : <String, Account>{};

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(transfersProvider()),
            child: transfers.isEmpty
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.swap_horiz,
                              size: 64,
                              color: AppColors.textMuted,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'No transfers yet',
                              style: AppTypography.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: AppDimensions.screenPadding,
                    itemCount: transfers.length,
                    itemBuilder: (_, i) => _TransferCard(
                      transfer: transfers[i],
                      accountMap: accountMap,
                      onCancel: () async {
                        final confirmed = await _confirmCancel(context);
                        if (!confirmed) return;
                        try {
                          await ref
                              .read(transferNotifierProvider.notifier)
                              .cancelTransfer(transfers[i].id);
                          if (context.mounted) {
                            AppToast.showSuccess(context, 'Transfer cancelled');
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
          await context.push('/transfers/add');
          ref.invalidate(transfersProvider());
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.swap_horiz, color: Colors.white),
        label: const Text(
          'New Transfer',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<bool> _confirmCancel(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Cancel Transfer'),
            content: const Text(
              'Are you sure you want to cancel this transfer?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                ),
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text(
                  'Yes, Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}

class _TransferCard extends StatelessWidget {
  final Transfer transfer;
  final Map<String, Account> accountMap;
  final VoidCallback onCancel;

  const _TransferCard({
    required this.transfer,
    required this.accountMap,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final fromAccount = accountMap[transfer.fromAccountId];
    final toAccount = accountMap[transfer.toAccountId];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.secondary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.swap_horiz, color: AppColors.secondary, size: 22),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                '${fromAccount?.name ?? transfer.fromAccountId} → ${toAccount?.name ?? transfer.toAccountId}',
                style: AppTypography.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              Formatters.formatCurrency(transfer.amount),
              style: AppTypography.titleSmall.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              Formatters.formatDate(transfer.transferDate),
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
              ),
            ),
            if (transfer.note != null && transfer.note!.isNotEmpty)
              Text(
                transfer.note!,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.cancel_outlined, color: AppColors.error, size: 20),
          tooltip: 'Cancel',
          onPressed: onCancel,
        ),
      ),
    );
  }
}
