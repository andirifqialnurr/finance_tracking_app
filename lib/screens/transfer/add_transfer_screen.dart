import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/account.dart';
import '../../providers/account_provider.dart';
import '../../providers/transfer_provider.dart';
import '../../utils/app_toast.dart';
import '../../utils/formatters.dart';

class AddTransferScreen extends ConsumerStatefulWidget {
  const AddTransferScreen({super.key});

  @override
  ConsumerState<AddTransferScreen> createState() => _AddTransferScreenState();
}

class _AddTransferScreenState extends ConsumerState<AddTransferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();

  String? _fromAccountId;
  String? _toAccountId;
  DateTime _transferDate = DateTime.now();
  bool _isSaving = false;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _transferDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _transferDate = picked);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_fromAccountId == null || _toAccountId == null) {
      AppToast.showError(context, 'Please select both accounts');
      return;
    }
    if (_fromAccountId == _toAccountId) {
      AppToast.showError(context, 'Source and destination cannot be the same');
      return;
    }
    final amount = double.tryParse(
      _amountCtrl.text.replaceAll(',', '.').trim(),
    );
    if (amount == null || amount <= 0) {
      AppToast.showError(context, 'Enter a valid amount');
      return;
    }

    setState(() => _isSaving = true);
    try {
      await ref
          .read(transferNotifierProvider.notifier)
          .createTransfer(
            fromAccountId: _fromAccountId!,
            toAccountId: _toAccountId!,
            amount: amount,
            note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
            transferDate: _transferDate,
          );
      if (mounted) {
        AppToast.showSuccess(context, 'Transfer created');
        Navigator.pop(context);
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
        title: const Text('New Transfer'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: AppDimensions.screenPadding,
          children: [
            // ── From Account ──
            Text('From Account', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _fromAccountId,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              hint: const Text('Select source account'),
              items: accounts
                  .map(
                    (a) => DropdownMenuItem(
                      value: a.id,
                      child: _AccountDropdownItem(account: a),
                    ),
                  )
                  .toList(),
              validator: (v) => v == null ? 'Required' : null,
              onChanged: (v) => setState(() => _fromAccountId = v),
            ),
            const SizedBox(height: 16),

            // ── Swap arrow ──
            Center(
              child: Icon(Icons.arrow_downward, color: AppColors.textMuted),
            ),
            const SizedBox(height: 16),

            // ── To Account ──
            Text('To Account', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _toAccountId,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              hint: const Text('Select destination account'),
              items: accounts
                  .map(
                    (a) => DropdownMenuItem(
                      value: a.id,
                      child: _AccountDropdownItem(account: a),
                    ),
                  )
                  .toList(),
              validator: (v) => v == null ? 'Required' : null,
              onChanged: (v) => setState(() => _toAccountId = v),
            ),
            const SizedBox(height: 20),

            // ── Amount ──
            Text('Amount', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            TextFormField(
              controller: _amountCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              decoration: const InputDecoration(
                prefixText: 'Rp ',
                border: OutlineInputBorder(),
                hintText: '0',
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Amount is required';
                final parsed = double.tryParse(v.replaceAll(',', '.').trim());
                if (parsed == null || parsed <= 0)
                  return 'Enter a valid amount';
                return null;
              },
            ),
            const SizedBox(height: 20),

            // ── Date ──
            Text('Transfer Date', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.textSecondary,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      Formatters.formatDate(_transferDate),
                      style: AppTypography.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ── Note ──
            Text('Note (optional)', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            TextFormField(
              controller: _noteCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a note...',
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
                    : const Text(
                        'Create Transfer',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _AccountDropdownItem extends StatelessWidget {
  final Account account;
  const _AccountDropdownItem({required this.account});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(_typeIcon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(account.name),
        const Spacer(),
        Text(
          Formatters.formatCurrency(account.balance),
          style: AppTypography.bodySmall.copyWith(color: AppColors.textMuted),
        ),
      ],
    );
  }

  IconData get _typeIcon {
    switch (account.type) {
      case AccountType.card:
        return Icons.credit_card;
      case AccountType.cash:
        return Icons.wallet;
      case AccountType.savings:
        return Icons.savings;
    }
  }
}
