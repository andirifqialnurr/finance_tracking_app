import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/budget.dart';
import '../../providers/budget_provider.dart';
import '../../utils/app_toast.dart';
import '../../utils/formatters.dart';

class BudgetReallocationScreen extends ConsumerStatefulWidget {
  const BudgetReallocationScreen({super.key});

  @override
  ConsumerState<BudgetReallocationScreen> createState() =>
      _BudgetReallocationScreenState();
}

class _BudgetReallocationScreenState
    extends ConsumerState<BudgetReallocationScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final budgetsAsync = ref.watch(
      budgetsProvider(month: now.month, year: now.year),
    );
    final historyAsync = ref.watch(
      budgetReallocationsProvider(month: now.month, year: now.year),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Budget Reallocation'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabCtrl,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(text: 'Reallocate'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabCtrl,
        children: [
          // ── Reallocation form ──
          budgetsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
            data: (budgets) => _ReallocationForm(budgets: budgets),
          ),
          // ── History ──
          historyAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
            data: (history) => _HistoryList(history: history),
          ),
        ],
      ),
    );
  }
}

// ─── Reallocation Form ────────────────────────────────────────────────────────
class _ReallocationForm extends ConsumerStatefulWidget {
  final List<BudgetWithCategory> budgets;
  const _ReallocationForm({required this.budgets});

  @override
  ConsumerState<_ReallocationForm> createState() => _ReallocationFormState();
}

class _ReallocationFormState extends ConsumerState<_ReallocationForm> {
  final _amountCtrl = TextEditingController();
  final _reasonCtrl = TextEditingController();
  String? _fromCategoryId;
  String? _toCategoryId;
  bool _isSaving = false;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _reasonCtrl.dispose();
    super.dispose();
  }

  BudgetWithCategory? get _fromBudget =>
      widget.budgets.where((b) => b.categoryId == _fromCategoryId).firstOrNull;

  Future<void> _reallocate() async {
    if (_fromCategoryId == null || _toCategoryId == null) {
      AppToast.showError(context, 'Select both categories');
      return;
    }
    if (_fromCategoryId == _toCategoryId) {
      AppToast.showError(context, 'Source and destination must differ');
      return;
    }
    final amount = double.tryParse(
      _amountCtrl.text.replaceAll(',', '.').trim(),
    );
    if (amount == null || amount <= 0) {
      AppToast.showError(context, 'Enter a valid amount');
      return;
    }
    final from = _fromBudget;
    if (from != null && amount > from.remainingAmount) {
      AppToast.showError(
        context,
        'Amount exceeds remaining budget for source category',
      );
      return;
    }

    setState(() => _isSaving = true);
    final now = DateTime.now();
    try {
      await ref
          .read(budgetNotifierProvider.notifier)
          .reallocate(
            fromCategoryId: _fromCategoryId!,
            toCategoryId: _toCategoryId!,
            amount: amount,
            month: now.month,
            year: now.year,
          );
      if (mounted) {
        AppToast.showSuccess(context, 'Reallocation successful');
        _amountCtrl.clear();
        _reasonCtrl.clear();
        setState(() {
          _fromCategoryId = null;
          _toCategoryId = null;
        });
      }
    } catch (e) {
      if (mounted) AppToast.showError(context, e.toString());
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppDimensions.screenPadding,
      children: [
        const SizedBox(height: 4),
        // Info card
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.infoBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.info.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.info, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Move unused budget from one category to another for the current month.',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.info,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Text('From Category', style: AppTypography.labelMedium),
        const SizedBox(height: 6),
        _buildBudgetDropdown(
          value: _fromCategoryId,
          onChanged: (v) => setState(() => _fromCategoryId = v),
        ),
        if (_fromBudget != null) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 14,
                color: AppColors.textMuted,
              ),
              const SizedBox(width: 4),
              Text(
                'Remaining: ${Formatters.formatCurrency(_fromBudget!.remainingAmount)}',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 16),

        Center(child: Icon(Icons.arrow_downward, color: AppColors.textMuted)),
        const SizedBox(height: 16),

        Text('To Category', style: AppTypography.labelMedium),
        const SizedBox(height: 6),
        _buildBudgetDropdown(
          value: _toCategoryId,
          onChanged: (v) => setState(() => _toCategoryId = v),
        ),
        const SizedBox(height: 20),

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
        const SizedBox(height: 16),

        Text('Reason (optional)', style: AppTypography.labelMedium),
        const SizedBox(height: 6),
        TextFormField(
          controller: _reasonCtrl,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Why are you reallocating?',
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 28),

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
            onPressed: _isSaving ? null : _reallocate,
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
                    'Reallocate',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildBudgetDropdown({
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      hint: const Text('Select category'),
      items: widget.budgets
          .map(
            (b) => DropdownMenuItem(
              value: b.categoryId,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      b.category?.name ?? b.categoryId,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    Formatters.formatCurrency(b.remainingAmount),
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}

// ─── History List ─────────────────────────────────────────────────────────────
class _HistoryList extends StatelessWidget {
  final List<BudgetReallocation> history;
  const _HistoryList({required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.swap_calls_outlined,
              size: 56,
              color: AppColors.textMuted,
            ),
            const SizedBox(height: 12),
            Text(
              'No reallocations this month',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: AppDimensions.screenPadding,
      itemCount: history.length,
      itemBuilder: (_, i) => _HistoryCard(reallocation: history[i]),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final BudgetReallocation reallocation;
  const _HistoryCard({required this.reallocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.swap_horiz, color: AppColors.secondary, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${reallocation.fromCategory?.name ?? reallocation.fromCategoryId} → '
                  '${reallocation.toCategory?.name ?? reallocation.toCategoryId}',
                  style: AppTypography.titleSmall,
                ),
              ),
              Text(
                Formatters.formatCurrency(reallocation.amount),
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          if (reallocation.reason != null &&
              reallocation.reason!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              reallocation.reason!,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
          const SizedBox(height: 4),
          Text(
            Formatters.formatDate(reallocation.createdAt),
            style: AppTypography.bodySmall.copyWith(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
