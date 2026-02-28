import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/account.dart';
import '../../models/scheduled_fund.dart';
import '../../providers/account_provider.dart';
import '../../providers/scheduled_fund_provider.dart';
import '../../utils/app_toast.dart';

class AddEditScheduledFundScreen extends ConsumerStatefulWidget {
  final ScheduledFund? fund;
  const AddEditScheduledFundScreen({super.key, this.fund});

  @override
  ConsumerState<AddEditScheduledFundScreen> createState() =>
      _AddEditScheduledFundScreenState();
}

class _AddEditScheduledFundScreenState
    extends ConsumerState<AddEditScheduledFundScreen> {
  final _amountCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _dayCtrl = TextEditingController();

  String _scheduleType = 'TOP_UP';
  String? _accountId;
  String? _fromAccountId;
  bool _isSaving = false;

  bool get _isEditing => widget.fund != null;
  bool get _isTransfer => _scheduleType == 'TRANSFER';

  @override
  void initState() {
    super.initState();
    final f = widget.fund;
    if (f != null) {
      _scheduleType = f.scheduleType;
      _accountId = f.accountId;
      _fromAccountId = f.fromAccountId;
      _amountCtrl.text = f.amount.toString();
      _dayCtrl.text = f.dayOfMonth.toString();
      _descriptionCtrl.text = f.description ?? '';
    }
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _descriptionCtrl.dispose();
    _dayCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_accountId == null) {
      AppToast.showError(context, 'Select target account');
      return;
    }
    if (_isTransfer && _fromAccountId == null) {
      AppToast.showError(context, 'Select source account for transfer');
      return;
    }
    if (_isTransfer && _fromAccountId == _accountId) {
      AppToast.showError(context, 'Source and target cannot be the same');
      return;
    }
    final amount = double.tryParse(
      _amountCtrl.text.replaceAll(',', '.').trim(),
    );
    if (amount == null || amount <= 0) {
      AppToast.showError(context, 'Enter a valid amount');
      return;
    }
    final day = int.tryParse(_dayCtrl.text.trim());
    if (day == null || day < 1 || day > 28) {
      AppToast.showError(context, 'Day must be between 1 and 28');
      return;
    }

    setState(() => _isSaving = true);
    try {
      final data = <String, dynamic>{
        'schedule_type': _scheduleType,
        'account_id': _accountId,
        if (_isTransfer) 'from_account_id': _fromAccountId,
        'amount': amount,
        'day_of_month': day,
        if (_descriptionCtrl.text.trim().isNotEmpty)
          'description': _descriptionCtrl.text.trim(),
      };

      if (_isEditing) {
        await ref
            .read(scheduledFundNotifierProvider.notifier)
            .updateScheduledFund(widget.fund!.id, data);
        if (mounted) {
          AppToast.showSuccess(context, 'Schedule updated');
          Navigator.pop(context);
        }
      } else {
        await ref
            .read(scheduledFundNotifierProvider.notifier)
            .createScheduledFund(data);
        if (mounted) {
          AppToast.showSuccess(context, 'Schedule created');
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
    final accountsAsync = ref.watch(accountsProvider);
    final accounts =
        accountsAsync.valueOrNull?.where((a) => a.isActive).toList() ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Schedule' : 'New Schedule'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: AppDimensions.screenPadding,
        children: [
          // ── Schedule Type ──
          Text('Schedule Type', style: AppTypography.labelMedium),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(
                value: 'TOP_UP',
                label: Text('Top Up'),
                icon: Icon(Icons.add_card, size: 18),
              ),
              ButtonSegment(
                value: 'TRANSFER',
                label: Text('Transfer'),
                icon: Icon(Icons.swap_horiz, size: 18),
              ),
            ],
            selected: {_scheduleType},
            onSelectionChanged: (s) => setState(() => _scheduleType = s.first),
          ),
          const SizedBox(height: 20),

          // ── From Account (only for Transfer) ──
          if (_isTransfer) ...[
            Text('From Account', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            _buildAccountDropdown(
              accounts: accounts,
              value: _fromAccountId,
              hint: 'Select source account',
              onChanged: (v) => setState(() => _fromAccountId = v),
            ),
            const SizedBox(height: 16),
            Center(
              child: Icon(Icons.arrow_downward, color: AppColors.textMuted),
            ),
            const SizedBox(height: 16),
          ],

          // ── Target Account ──
          Text(
            _isTransfer ? 'To Account' : 'Account',
            style: AppTypography.labelMedium,
          ),
          const SizedBox(height: 6),
          _buildAccountDropdown(
            accounts: accounts,
            value: _accountId,
            hint: _isTransfer
                ? 'Select destination account'
                : 'Select account to top up',
            onChanged: (v) => setState(() => _accountId = v),
          ),
          const SizedBox(height: 20),

          // ── Amount ──
          Text('Amount', style: AppTypography.labelMedium),
          const SizedBox(height: 6),
          TextFormField(
            controller: _amountCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
            ],
            decoration: const InputDecoration(
              prefixText: 'Rp ',
              border: OutlineInputBorder(),
              hintText: '0',
            ),
          ),
          const SizedBox(height: 20),

          // ── Day of Month ──
          Text('Day of Month (1–28)', style: AppTypography.labelMedium),
          const SizedBox(height: 6),
          TextFormField(
            controller: _dayCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'e.g. 1, 15, 25',
              suffixText: 'of every month',
            ),
          ),
          const SizedBox(height: 20),

          // ── Description ──
          Text('Description (optional)', style: AppTypography.labelMedium),
          const SizedBox(height: 6),
          TextFormField(
            controller: _descriptionCtrl,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'e.g. Monthly salary saving',
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 28),

          // ── Save Button ──
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _isSaving ? null : _save,
              child: _isSaving
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      _isEditing ? 'Save Changes' : 'Create Schedule',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildAccountDropdown({
    required List<Account> accounts,
    required String? value,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      hint: Text(hint),
      items: accounts
          .map(
            (a) => DropdownMenuItem(
              value: a.id,
              child: Row(
                children: [
                  Icon(
                    _typeIcon(a.type),
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(a.name),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }

  IconData _typeIcon(AccountType type) {
    switch (type) {
      case AccountType.card:
        return Icons.credit_card;
      case AccountType.cash:
        return Icons.wallet;
      case AccountType.savings:
        return Icons.savings;
    }
  }
}
