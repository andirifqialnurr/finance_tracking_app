import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_constants.dart';
import '../../providers/income_provider.dart';
import '../../providers/account_provider.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_card.dart';
import '../../utils/validators.dart';
import '../../utils/formatters.dart';
import '../../utils/app_toast.dart';

class AddIncomeScreen extends ConsumerStatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  ConsumerState<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends ConsumerState<AddIncomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _sourceController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _sourceController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitting = ref.watch(incomeNotifierProvider).isLoading;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Add Income')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: AppDimensions.screenPadding,
          children: [
            // Info Card
            AppCard(
              color: AppColors.infoBackground,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.info,
                    size: AppDimensions.iconMD,
                  ),
                  const SizedBox(width: AppDimensions.spacing12),
                  Expanded(
                    child: Text(
                      'Your income will be automatically allocated to active budget categories',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.infoDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spacing24),

            // Source Input
            _buildSectionTitle('Source'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildSourceInput(),
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

            // Preview Allocation (if amount entered)
            if (_amountController.text.isNotEmpty) _buildAllocationPreview(),
            if (_amountController.text.isNotEmpty)
              const SizedBox(height: AppDimensions.spacing32),

            // Submit Button
            AppButton(
              text: 'Add Income',
              isFullWidth: true,
              isLoading: isSubmitting,
              onPressed: _submitForm,
              variant: AppButtonVariant.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppTypography.titleMedium);
  }

  Widget _buildSourceInput() {
    return TextFormField(
      controller: _sourceController,
      decoration: const InputDecoration(
        hintText: 'e.g., Gaji Februari, Project X, Freelance',
      ),
      validator: (value) => Validators.required(value, fieldName: 'Source'),
    );
  }

  Widget _buildAmountInput() {
    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixText: AppConstants.currencySymbol,
        hintText: '0',
      ),
      validator: (value) => Validators.amount(value, fieldName: 'Amount'),
      onChanged: (value) {
        // Trigger rebuild to show allocation preview
        setState(() {});
      },
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
            color: AppColors.success,
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
            .read(incomeNotifierProvider.notifier)
            .createIncome(
              amount: amount,
              source: _sourceController.text.trim(),
              accountId: accountId,
              description: description.isEmpty ? null : description,
              date: _selectedDate,
            );

        if (!mounted) return;

        if (result.alreadyAllocatedWarning != null) {
          AppToast.showInfo(context, result.alreadyAllocatedWarning!);
        }
        AppToast.showSuccess(context, AppConstants.successIncomeSaved);
        Navigator.pop(context);
      } catch (e) {
        if (!mounted) return;
        AppToast.showError(
          context,
          e.toString().replaceFirst('Exception: ', ''),
        );
      }
    }
  }

  Widget _buildAllocationPreview() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (amount <= 0) return const SizedBox();

    // Sample allocation breakdown (in real app, calculate based on categories)
    final allocations = [
      {'category': 'Makan', 'amount': amount * 0.155},
      {'category': 'Bensin', 'amount': amount * 0.022},
      {'category': 'Netflix', 'amount': amount * 0.015},
      {'category': 'Internet', 'amount': amount * 0.0125},
    ];

    return AppCard(
      color: AppColors.successBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.success,
                size: AppDimensions.iconMD,
              ),
              const SizedBox(width: AppDimensions.spacing8),
              Text(
                'Budget Allocation Preview',
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.successDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing16),
          ...allocations.map((allocation) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spacing8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    allocation['category'] as String,
                    style: AppTypography.bodyMedium,
                  ),
                  Text(
                    Formatters.formatCurrency(allocation['amount'] as double),
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Allocated', style: AppTypography.titleSmall),
              Text(
                Formatters.formatCurrency(
                  allocations.fold(
                    0.0,
                    (sum, alloc) => sum + (alloc['amount'] as double),
                  ),
                ),
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
