import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/account.dart';
import '../../providers/account_provider.dart';
import '../../utils/app_toast.dart';

class AccountFormScreen extends ConsumerStatefulWidget {
  final Account? account;
  const AccountFormScreen({super.key, this.account});

  @override
  ConsumerState<AccountFormScreen> createState() => _AccountFormScreenState();
}

class _AccountFormScreenState extends ConsumerState<AccountFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _balanceCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _goalAmountCtrl = TextEditingController();
  final _goalLabelCtrl = TextEditingController();

  AccountType _selectedType = AccountType.card;
  String? _selectedIncomeType;
  String? _selectedColor;
  bool _isSaving = false;

  bool get _isEditing => widget.account != null;

  static const _incomeTypes = [
    'SALARY',
    'PROJECT',
    'FREELANCE',
    'BUSINESS',
    'OTHER',
  ];

  static const _colorOptions = [
    '#6366F1', // Indigo
    '#10B981', // Green
    '#F59E0B', // Amber
    '#EF4444', // Red
    '#3B82F6', // Blue
    '#8B5CF6', // Violet
    '#EC4899', // Pink
    '#0F172A', // Slate
  ];

  @override
  void initState() {
    super.initState();
    final a = widget.account;
    if (a != null) {
      _nameCtrl.text = a.name;
      _balanceCtrl.text = a.balance.toString();
      _descriptionCtrl.text = a.description ?? '';
      _goalAmountCtrl.text = a.goalAmount?.toString() ?? '';
      _goalLabelCtrl.text = a.goalLabel ?? '';
      _selectedType = a.type;
      _selectedIncomeType = a.incomeType;
      _selectedColor = a.color;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _balanceCtrl.dispose();
    _descriptionCtrl.dispose();
    _goalAmountCtrl.dispose();
    _goalLabelCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      final data = <String, dynamic>{
        'name': _nameCtrl.text.trim(),
        'type': _selectedType.name.toUpperCase(),
        if (!_isEditing)
          'balance':
              double.tryParse(_balanceCtrl.text.replaceAll(',', '.').trim()) ??
              0.0,
        if (_selectedType == AccountType.card && _selectedIncomeType != null)
          'income_type': _selectedIncomeType,
        if (_selectedType == AccountType.savings) ...{
          if (_goalAmountCtrl.text.trim().isNotEmpty)
            'goal_amount': double.tryParse(
              _goalAmountCtrl.text.replaceAll(',', '.').trim(),
            ),
          if (_goalLabelCtrl.text.trim().isNotEmpty)
            'goal_label': _goalLabelCtrl.text.trim(),
        },
        if (_selectedColor != null) 'color': _selectedColor,
        if (_descriptionCtrl.text.trim().isNotEmpty)
          'description': _descriptionCtrl.text.trim(),
      };

      if (_isEditing) {
        await ref
            .read(accountNotifierProvider.notifier)
            .updateAccount(widget.account!.id, data);
        if (mounted) {
          AppToast.showSuccess(context, 'Account updated');
          Navigator.pop(context);
        }
      } else {
        await ref.read(accountNotifierProvider.notifier).createAccount(data);
        if (mounted) {
          AppToast.showSuccess(context, 'Account created');
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Account' : 'New Account'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: AppDimensions.screenPadding,
          children: [
            // ── Account Name ──
            Text('Account Name', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                hintText: 'e.g. BCA Main, Dompet Cash',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Name is required' : null,
            ),
            const SizedBox(height: 20),

            // ── Account Type ──
            Text('Account Type', style: AppTypography.labelMedium),
            const SizedBox(height: 8),
            SegmentedButton<AccountType>(
              segments: const [
                ButtonSegment(
                  value: AccountType.card,
                  label: Text('Card'),
                  icon: Icon(Icons.credit_card, size: 18),
                ),
                ButtonSegment(
                  value: AccountType.cash,
                  label: Text('Cash'),
                  icon: Icon(Icons.wallet, size: 18),
                ),
                ButtonSegment(
                  value: AccountType.savings,
                  label: Text('Savings'),
                  icon: Icon(Icons.savings, size: 18),
                ),
              ],
              selected: {_selectedType},
              onSelectionChanged: (s) =>
                  setState(() => _selectedType = s.first),
            ),
            const SizedBox(height: 20),

            // ── Initial Balance (create only) ──
            if (!_isEditing) ...[
              Text('Initial Balance', style: AppTypography.labelMedium),
              const SizedBox(height: 6),
              TextFormField(
                controller: _balanceCtrl,
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
              ),
              const SizedBox(height: 20),
            ],

            // ── Income Type (Card only) ──
            if (_selectedType == AccountType.card) ...[
              Text('Income Type (optional)', style: AppTypography.labelMedium),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: _selectedIncomeType,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                hint: const Text('Select income type'),
                items: _incomeTypes
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedIncomeType = v),
              ),
              const SizedBox(height: 20),
            ],

            // ── Savings Goal (Savings only) ──
            if (_selectedType == AccountType.savings) ...[
              Text('Savings Goal (optional)', style: AppTypography.labelMedium),
              const SizedBox(height: 6),
              TextFormField(
                controller: _goalAmountCtrl,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                ],
                decoration: const InputDecoration(
                  prefixText: 'Rp ',
                  border: OutlineInputBorder(),
                  labelText: 'Target Amount',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _goalLabelCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Goal Label (e.g. Emergency Fund)',
                ),
              ),
              const SizedBox(height: 20),
            ],

            // ── Color ──
            Text('Color Tag (optional)', style: AppTypography.labelMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _colorOptions.map((hex) {
                final color = Color(int.parse(hex.replaceFirst('#', '0xFF')));
                final selected = _selectedColor == hex;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedColor = selected ? null : hex),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: selected
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // ── Description ──
            Text('Description (optional)', style: AppTypography.labelMedium),
            const SizedBox(height: 6),
            TextFormField(
              controller: _descriptionCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a note...',
              ),
              maxLines: 3,
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
                        _isEditing ? 'Save Changes' : 'Create Account',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
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
