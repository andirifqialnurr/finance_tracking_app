import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/notification_setting.dart';
import '../../providers/notification_setting_provider.dart';
import '../../utils/app_toast.dart';
import '../../widgets/common/shimmer_loading.dart';

class NotificationSettingsScreen extends ConsumerWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(notificationSettingsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Notification',
            onPressed: () => _showAddEditDialog(context, ref),
          ),
        ],
      ),
      body: settingsAsync.when(
        loading: () => const ShimmerList(itemHeight: 70),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 8),
              Text(e.toString(), textAlign: TextAlign.center),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.invalidate(notificationSettingsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (settings) {
          if (settings.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 64,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No notifications configured',
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () => _showAddEditDialog(context, ref),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Notification',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }

          // Group by type
          final grouped = <String, List<NotificationSetting>>{};
          for (final s in settings) {
            grouped.putIfAbsent(s.type, () => []).add(s);
          }

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(notificationSettingsProvider),
            child: ListView(
              padding: AppDimensions.screenPadding,
              children: [
                for (final entry in grouped.entries) ...[
                  _TypeHeader(type: entry.key),
                  const SizedBox(height: 8),
                  for (final setting in entry.value)
                    _NotificationCard(
                      setting: setting,
                      onToggle: (enabled) async {
                        try {
                          await ref
                              .read(
                                notificationSettingNotifierProvider.notifier,
                              )
                              .updateSetting(setting.id, {
                                'is_enabled': enabled,
                              });
                        } catch (e) {
                          if (context.mounted) {
                            AppToast.showError(context, e.toString());
                          }
                        }
                      },
                      onEdit: () =>
                          _showAddEditDialog(context, ref, existing: setting),
                      onDelete: () async {
                        final confirmed = await _confirmDelete(context);
                        if (!confirmed) return;
                        try {
                          await ref
                              .read(
                                notificationSettingNotifierProvider.notifier,
                              )
                              .deleteSetting(setting.id);
                          if (context.mounted) {
                            AppToast.showSuccess(
                              context,
                              'Notification deleted',
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            AppToast.showError(context, e.toString());
                          }
                        }
                      },
                    ),
                  const SizedBox(height: 12),
                ],
                const SizedBox(height: 60),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEditDialog(context, ref),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_alert, color: Colors.white),
        label: const Text(
          'New Notification',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Notification'),
            content: const Text(
              'Are you sure you want to delete this notification?',
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

  void _showAddEditDialog(
    BuildContext context,
    WidgetRef ref, {
    NotificationSetting? existing,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => _NotificationDialog(existing: existing, ref: ref),
    );
  }
}

// ─── Type Header ──────────────────────────────────────────────────────────────
class _TypeHeader extends StatelessWidget {
  final String type;
  const _TypeHeader({required this.type});

  String get label {
    switch (type) {
      case 'ALLOCATION_REMINDER':
        return 'Allocation Reminder';
      case 'BUDGET_ALERT':
        return 'Budget Alert';
      case 'SAVINGS_GOAL':
        return 'Savings Goal';
      case 'SCHEDULED_FUND':
        return 'Scheduled Fund';
      default:
        return type;
    }
  }

  IconData get icon {
    switch (type) {
      case 'ALLOCATION_REMINDER':
        return Icons.assignment_turned_in_outlined;
      case 'BUDGET_ALERT':
        return Icons.warning_amber_outlined;
      case 'SAVINGS_GOAL':
        return Icons.savings_outlined;
      case 'SCHEDULED_FUND':
        return Icons.schedule;
      default:
        return Icons.notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTypography.titleSmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ─── Notification Card ────────────────────────────────────────────────────────
class _NotificationCard extends StatelessWidget {
  final NotificationSetting setting;
  final ValueChanged<bool> onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _NotificationCard({
    required this.setting,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: setting.isEnabled ? AppColors.card : AppColors.cardDisabled,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: setting.isEnabled
              ? AppColors.cardBorder
              : AppColors.cardBorderDisabled,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(setting.title, style: AppTypography.titleSmall),
                  const SizedBox(height: 2),
                  Text(
                    setting.body,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Day ${setting.dayOfMonth} · ${setting.timeOfDay}',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Switch(
                  value: setting.isEnabled,
                  onChanged: onToggle,
                  activeThumbColor: AppColors.success,
                ),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                  onSelected: (v) {
                    if (v == 'edit') onEdit();
                    if (v == 'delete') onDelete();
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'edit', child: Text('Edit')),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Add/Edit Dialog ──────────────────────────────────────────────────────────
class _NotificationDialog extends ConsumerStatefulWidget {
  final NotificationSetting? existing;
  final WidgetRef ref;
  const _NotificationDialog({this.existing, required this.ref});

  @override
  ConsumerState<_NotificationDialog> createState() =>
      _NotificationDialogState();
}

class _NotificationDialogState extends ConsumerState<_NotificationDialog> {
  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  final _dayCtrl = TextEditingController();
  final _timeCtrl = TextEditingController();

  String _type = 'BUDGET_ALERT';
  bool _isSaving = false;

  static const _types = [
    'ALLOCATION_REMINDER',
    'BUDGET_ALERT',
    'SAVINGS_GOAL',
    'SCHEDULED_FUND',
  ];

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _type = e.type;
      _titleCtrl.text = e.title;
      _bodyCtrl.text = e.body;
      _dayCtrl.text = e.dayOfMonth.toString();
      _timeCtrl.text = e.timeOfDay;
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    _dayCtrl.dispose();
    _timeCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_titleCtrl.text.trim().isEmpty ||
        _bodyCtrl.text.trim().isEmpty ||
        _dayCtrl.text.trim().isEmpty ||
        _timeCtrl.text.trim().isEmpty) {
      AppToast.showError(context, 'Please fill all fields');
      return;
    }
    final day = int.tryParse(_dayCtrl.text.trim());
    if (day == null || day < 1 || day > 28) {
      AppToast.showError(context, 'Day must be between 1 and 28');
      return;
    }

    setState(() => _isSaving = true);
    try {
      final data = {
        'type': _type,
        'title': _titleCtrl.text.trim(),
        'body': _bodyCtrl.text.trim(),
        'day_of_month': day,
        'time_of_day': _timeCtrl.text.trim(),
      };

      if (_isEditing) {
        await widget.ref
            .read(notificationSettingNotifierProvider.notifier)
            .updateSetting(widget.existing!.id, data);
        if (mounted) {
          AppToast.showSuccess(context, 'Notification updated');
          Navigator.pop(context);
        }
      } else {
        await widget.ref
            .read(notificationSettingNotifierProvider.notifier)
            .createSetting(data);
        if (mounted) {
          AppToast.showSuccess(context, 'Notification created');
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) AppToast.showError(context, e.toString());
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEditing ? 'Edit Notification' : 'New Notification'),
      contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _type,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                items: _types
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(
                          t.replaceAll('_', ' '),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _type = v!),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _titleCtrl,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _bodyCtrl,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dayCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: 'Day (1–28)',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _timeCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Time (HH:mm)',
                        border: OutlineInputBorder(),
                        isDense: true,
                        hintText: '08:00',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          onPressed: _isSaving ? null : _save,
          child: _isSaving
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  _isEditing ? 'Save' : 'Create',
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ],
    );
  }
}
