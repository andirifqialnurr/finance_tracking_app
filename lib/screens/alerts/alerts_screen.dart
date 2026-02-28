import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/alert.dart';
import '../../providers/alert_provider.dart';
import '../../utils/app_toast.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/shimmer_loading.dart';

class AlertsScreen extends ConsumerStatefulWidget {
  const AlertsScreen({super.key});

  @override
  ConsumerState<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends ConsumerState<AlertsScreen> {
  String _filterStatus = 'all'; // all, active, triggered, resolved

  void _setFilterStatus(String newStatus) {
    setState(() {
      _filterStatus = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final alertsAsync = ref.watch(alertsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Budget Alerts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showInfoDialog,
          ),
        ],
      ),
      body: alertsAsync.when(
        loading: () => const ShimmerList(itemHeight: 75),
        error: (e, _) => _buildErrorState(e.toString()),
        data: (alerts) {
          final filtered = _filterStatus == 'all'
              ? alerts
              : alerts.where((a) => a.status == _filterStatus).toList();
          return Column(
            children: [
              _buildFilterChips(alerts),
              Expanded(child: _buildContent(filtered)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToCreateAlert,
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_alert, color: Colors.white),
        label: const Text('New Alert', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildContent(List<BudgetAlert> alerts) {
    if (alerts.isEmpty) return _buildEmptyState();
    return _buildAlertsList(alerts);
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: AppColors.error.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppDimensions.spacing16),
            Text(
              'Error Loading Alerts',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing8),
            Text(
              error,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacing24),
            AppButton(
              text: 'Retry',
              onPressed: () => ref.invalidate(alertsProvider),
              variant: AppButtonVariant.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips(List<BudgetAlert> allAlerts) {
    return Container(
      padding: AppDimensions.paddingMD,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _FilterChip(
              label: 'All',
              count: allAlerts.length,
              isSelected: _filterStatus == 'all',
              onTap: () => _setFilterStatus('all'),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            _FilterChip(
              label: 'Active',
              count: allAlerts.where((a) => a.status == 'active').length,
              isSelected: _filterStatus == 'active',
              onTap: () => _setFilterStatus('active'),
              color: AppColors.success,
            ),
            const SizedBox(width: AppDimensions.spacing8),
            _FilterChip(
              label: 'Triggered',
              count: allAlerts.where((a) => a.status == 'triggered').length,
              isSelected: _filterStatus == 'triggered',
              onTap: () => _setFilterStatus('triggered'),
              color: AppColors.error,
            ),
            const SizedBox(width: AppDimensions.spacing8),
            _FilterChip(
              label: 'Resolved',
              count: allAlerts.where((a) => a.status == 'resolved').length,
              isSelected: _filterStatus == 'resolved',
              onTap: () => _setFilterStatus('resolved'),
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertsList(List<BudgetAlert> alerts) {
    return ListView.separated(
      padding: AppDimensions.screenPadding,
      itemCount: alerts.length,
      separatorBuilder: (_, _) =>
          const SizedBox(height: AppDimensions.spacing12),
      itemBuilder: (context, index) {
        final alert = alerts[index];
        return _AlertCard(
          alert: alert,
          onTap: () => _showAlertDetails(alert),
          onDelete: () => _confirmDelete(alert),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 80,
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppDimensions.spacing16),
            Text(
              'No $_filterStatus alerts',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing8),
            Text(
              _filterStatus == 'all'
                  ? 'Create your first budget alert to get notified'
                  : 'Switch filters to see other alerts',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToCreateAlert() async {
    await context.push('/alerts/create');
    if (mounted) ref.invalidate(alertsProvider);
  }

  void _confirmDelete(BudgetAlert alert) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Alert'),
        content: Text(
          'Are you sure you want to delete the alert for ${alert.categoryName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _deleteAlert(alert.id);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteAlert(String alertId) async {
    try {
      await ref.read(alertNotifierProvider.notifier).deleteAlert(alertId);
      if (mounted) AppToast.showSuccess(context, 'Alert deleted successfully.');
    } catch (e) {
      if (mounted)
        AppToast.showError(
          context,
          'Failed to delete alert. Please try again.',
        );
    }
  }

  void _showAlertDetails(BudgetAlert alert) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _AlertDetailsSheet(
        alert: alert,
        onStatusUpdate: (newStatus) => _updateAlertStatus(alert.id, newStatus),
        onDelete: () => _confirmDelete(alert),
      ),
    );
  }

  Future<void> _updateAlertStatus(String alertId, String newStatus) async {
    try {
      final data = newStatus == 'resolved' || newStatus == 'disabled'
          ? {'is_enabled': false, 'status': newStatus}
          : {'is_enabled': true, 'status': newStatus};
      await ref.read(alertNotifierProvider.notifier).updateAlert(alertId, data);
      if (mounted)
        AppToast.showSuccess(context, 'Alert status updated successfully.');
    } catch (e) {
      if (mounted)
        AppToast.showError(
          context,
          'Failed to update alert. Please try again.',
        );
    }
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('About Budget Alerts'),
        content: const Text(
          'Budget alerts notify you when spending in a category reaches a certain threshold. '
          'You can set alerts based on percentage or absolute amount.\n\n'
          'Statuses:\n'
          'â€¢ Active: Alert is monitoring\n'
          'â€¢ Triggered: Threshold reached\n'
          'â€¢ Resolved: Issue acknowledged',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}

// MARK: - Alert Card Widget
class _AlertCard extends StatelessWidget {
  final BudgetAlert alert;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _AlertCard({
    required this.alert,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final status = alert.status;
    final thresholdPct = alert.thresholdPercentage;
    final progressValue = (thresholdPct / 100.0).clamp(0.0, 1.0);

    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case 'triggered':
        statusColor = AppColors.error;
        statusIcon = Icons.warning;
        break;
      case 'active':
        statusColor = AppColors.success;
        statusIcon = Icons.check_circle;
        break;
      case 'resolved':
        statusColor = AppColors.textSecondary;
        statusIcon = Icons.done_all;
        break;
      default:
        statusColor = AppColors.textSecondary;
        statusIcon = Icons.info;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppDimensions.paddingMD,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: AppDimensions.borderRadiusLG,
          border: Border.all(
            color: status == 'triggered'
                ? AppColors.error.withValues(alpha: 0.5)
                : AppColors.cardBorder,
            width: status == 'triggered' ? 2 : 1,
          ),
          boxShadow: status == 'triggered'
              ? [
                  BoxShadow(
                    color: AppColors.error.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(statusIcon, color: statusColor, size: 20),
                const SizedBox(width: AppDimensions.spacing8),
                Expanded(
                  child: Text(
                    alert.categoryName,
                    style: AppTypography.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing8,
                    vertical: AppDimensions.spacing4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: AppDimensions.borderRadiusSM,
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: AppTypography.bodySmall.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacing12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Threshold: $thresholdPct%',
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (alert.level != null)
                  Text(
                    alert.level!,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacing8),

            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: AppColors.background,
              color: status == 'triggered'
                  ? AppColors.error
                  : AppColors.primary,
            ),
            const SizedBox(height: AppDimensions.spacing8),

            if (alert.message != null)
              Text(
                alert.message!,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

            if (alert.lastTriggered != null) ...[
              const SizedBox(height: AppDimensions.spacing8),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  Text(
                    'Triggered ${_formatDate(alert.lastTriggered!)}',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    if (difference == 0) return 'today';
    if (difference == 1) return 'yesterday';
    if (difference < 7) return '$difference days ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}

// MARK: - Filter Chip Widget
class _FilterChip extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;

  const _FilterChip({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing16,
          vertical: AppDimensions.spacing8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : AppColors.card,
          borderRadius: AppDimensions.borderRadiusMD,
          border: Border.all(
            color: isSelected ? chipColor : AppColors.cardBorder,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.2)
                    : AppColors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: AppTypography.bodySmall.copyWith(
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: - Alert Details Bottom Sheet
class _AlertDetailsSheet extends StatelessWidget {
  final BudgetAlert alert;
  final Function(String) onStatusUpdate;
  final VoidCallback onDelete;

  const _AlertDetailsSheet({
    required this.alert,
    required this.onStatusUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: AppDimensions.spacing12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: AppDimensions.paddingLG,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.categoryName,
                  style: AppTypography.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing24),

                _DetailRow(
                  icon: Icons.percent,
                  label: 'Trigger Threshold',
                  value: '${alert.thresholdPercentage}%',
                ),
                const SizedBox(height: AppDimensions.spacing16),

                _DetailRow(
                  icon: Icons.toggle_on,
                  label: 'Status',
                  value: alert.isEnabled ? 'Enabled' : 'Disabled',
                  valueColor: alert.isEnabled
                      ? AppColors.success
                      : AppColors.textSecondary,
                ),
                const SizedBox(height: AppDimensions.spacing16),

                _DetailRow(
                  icon: Icons.calendar_today,
                  label: 'Created',
                  value: _formatFullDate(alert.createdAt),
                ),

                if (alert.lastTriggered != null) ...[
                  const SizedBox(height: AppDimensions.spacing16),
                  _DetailRow(
                    icon: Icons.warning,
                    label: 'Last Triggered',
                    value: _formatFullDate(alert.lastTriggered!),
                    valueColor: AppColors.error,
                  ),
                ],

                if (alert.message != null) ...[
                  const SizedBox(height: AppDimensions.spacing16),
                  _DetailRow(
                    icon: Icons.info_outline,
                    label: 'Message',
                    value: alert.message!,
                  ),
                ],

                const SizedBox(height: AppDimensions.spacing24),

                if (alert.status == 'triggered') ...[
                  AppButton(
                    text: 'Mark as Resolved',
                    onPressed: () {
                      Navigator.pop(context);
                      onStatusUpdate('resolved');
                    },
                    variant: AppButtonVariant.primary,
                  ),
                  const SizedBox(height: AppDimensions.spacing12),
                ],

                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'Delete',
                        onPressed: () {
                          Navigator.pop(context);
                          onDelete();
                        },
                        variant: AppButtonVariant.secondary,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spacing12),
                    Expanded(
                      child: AppButton(
                        text: 'Close',
                        onPressed: () => Navigator.pop(context),
                        variant: AppButtonVariant.primary,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatFullDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: AppDimensions.spacing12),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
