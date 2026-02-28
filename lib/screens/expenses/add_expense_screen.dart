import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_constants.dart';
import '../../providers/expense_provider.dart';
import '../../providers/category_provider.dart';
import '../../providers/budget_provider.dart';
import '../../providers/account_provider.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_card.dart';
import '../../utils/validators.dart';
import '../../utils/formatters.dart';
import '../../utils/app_toast.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedCategoryId;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitting = ref.watch(expenseNotifierProvider).isLoading;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Add Expense')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: AppDimensions.screenPadding,
          children: [
            // Category Selection
            _buildSectionTitle('Category'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildCategorySelection(),
            const SizedBox(height: AppDimensions.spacing24),

            // Amount Input
            _buildSectionTitle('Amount'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildAmountInput(),
            const SizedBox(height: AppDimensions.spacing24),

            // Date Selection
            _buildSectionTitle('Date'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildDatePicker(),
            const SizedBox(height: AppDimensions.spacing24),

            // Description Input
            _buildSectionTitle('Description (Optional)'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildDescriptionInput(),
            const SizedBox(height: AppDimensions.spacing32),

            // Submit Button
            AppButton(
              text: 'Add Expense',
              isFullWidth: true,
              isLoading: isSubmitting,
              onPressed: isSubmitting ? null : _submitForm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppTypography.titleMedium);
  }

  Widget _buildCategorySelection() {
    final categoriesAsync = ref.watch(categoriesProvider);
    final budgetsAsync = ref.watch(budgetsProvider());

    if (categoriesAsync.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.spacing16),
          child: CircularProgressIndicator(),
        ),
      );
    }

    final categories = (categoriesAsync.valueOrNull ?? [])
        .where((c) => c.isActive)
        .toList();
    final budgets = budgetsAsync.valueOrNull ?? [];

    if (categories.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing12),
        child: Text(
          'No active categories found. Please create a category first.',
          style: AppTypography.bodySmall.copyWith(color: AppColors.textMuted),
        ),
      );
    }

    return DropdownButtonFormField<String>(
      value: _selectedCategoryId,
      isExpanded: true,
      decoration: const InputDecoration(hintText: 'Select a category'),
      // Show only the name in the closed button (prevents overflow)
      selectedItemBuilder: (context) => categories.map((category) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            category.name,
            style: AppTypography.titleSmall,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      items: categories.map((category) {
        final budgetItem = budgets
            .where((b) => b.categoryId == category.id)
            .firstOrNull;
        final remaining = budgetItem?.remainingAmount ?? category.monthlyBudget;
        final isDisabled = remaining <= 0;

        return DropdownMenuItem<String>(
          value: category.id,
          enabled: !isDisabled,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      category.name,
                      style: AppTypography.titleSmall.copyWith(
                        color: isDisabled
                            ? AppColors.textMuted
                            : AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Remaining: ${Formatters.formatCurrencyCompact(remaining)}',
                      style: AppTypography.labelSmall.copyWith(
                        color: isDisabled
                            ? AppColors.error
                            : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              if (isDisabled)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing8,
                    vertical: AppDimensions.spacing4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.errorBackground,
                    borderRadius: AppDimensions.borderRadiusSM,
                  ),
                  child: Text(
                    'No Budget',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => _selectedCategoryId = value);
      },
      validator: (value) => value == null ? 'Please select a category' : null,
    );
  }

  Widget _buildAmountInput() {
    final budgets = ref.watch(budgetsProvider()).valueOrNull ?? [];
    final budgetItem = _selectedCategoryId != null
        ? budgets.where((b) => b.categoryId == _selectedCategoryId).firstOrNull
        : null;
    final remaining = budgetItem?.remainingAmount ?? double.infinity;

    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixText: AppConstants.currencySymbol,
        hintText: '0',
        helperText: _selectedCategoryId != null && budgetItem != null
            ? 'Available: ${Formatters.formatCurrency(remaining)}'
            : null,
      ),
      validator: (value) =>
          Validators.expenseAmount(value, remaining, fieldName: 'Amount'),
    );
  }

  Widget _buildDatePicker() {
    return AppCard(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          setState(() {
            _selectedDate = date;
          });
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: AppColors.primary,
            size: AppDimensions.iconMD,
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Text(
              Formatters.formatDate(_selectedDate),
              style: AppTypography.bodyLarge,
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }

  Widget _buildDescriptionInput() {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 3,
      maxLength: AppConstants.maxDescriptionLength,
      decoration: const InputDecoration(
        hintText: 'Enter description (optional)',
        alignLabelWithHint: true,
      ),
      validator: Validators.description,
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final amount = double.tryParse(_amountController.text) ?? 0;
      final description = _descriptionController.text.trim();
      final accountId =
          ref.read(accountsProvider).valueOrNull?.firstOrNull?.id ?? '';

      try {
        final result = await ref
            .read(expenseNotifierProvider.notifier)
            .createExpense(
              categoryId: _selectedCategoryId!,
              amount: amount,
              description: description,
              accountId: accountId,
              date: _selectedDate,
            );

        if (!mounted) return;

        AppToast.showSuccess(context, AppConstants.successExpenseSaved);
        if (result.budgetWarning != null) {
          AppToast.showInfo(context, result.budgetWarning!);
        }
        Navigator.pop(context);
      } catch (e) {
        if (!mounted) return;
        AppToast.showError(
          context,
          'Failed to save expense. Please try again.',
        );
      }
    }
  }
}
