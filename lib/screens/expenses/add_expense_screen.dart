import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_card.dart';
import '../../utils/validators.dart';
import '../../utils/formatters.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isSubmitting = false;
  String? _selectedCategoryId;
  DateTime _selectedDate = DateTime.now();

  // Sample categories with budgets
  final List<Map<String, dynamic>> _categories = [
    {
      'id': '1',
      'name': 'Makan',
      'remaining': 760000.0,
      'icon': Icons.restaurant,
      'color': AppColors.warning,
    },
    {
      'id': '2',
      'name': 'Bensin',
      'remaining': 35000.0,
      'icon': Icons.local_gas_station,
      'color': AppColors.info,
    },
    {
      'id': '3',
      'name': 'Internet',
      'remaining': 0.0,
      'icon': Icons.wifi,
      'color': AppColors.secondary,
    },
  ];

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              isLoading: _isSubmitting,
              onPressed: _submitForm,
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
    return Column(
      children: _categories.map((category) {
        final isSelected = _selectedCategoryId == category['id'];
        final isDisabled = category['remaining'] <= 0;

        return GestureDetector(
          onTap: isDisabled
              ? null
              : () {
                  setState(() {
                    _selectedCategoryId = category['id'];
                  });
                },
          child: Container(
            margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
            padding: AppDimensions.paddingMD,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withOpacity(0.1)
                  : AppColors.card,
              borderRadius: AppDimensions.borderRadiusLG,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.cardBorder,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing8),
                  decoration: BoxDecoration(
                    color: (category['color'] as Color).withOpacity(0.1),
                    borderRadius: AppDimensions.borderRadiusMD,
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: category['color'] as Color,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacing12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category['name'], style: AppTypography.titleSmall),
                      const SizedBox(height: AppDimensions.spacing4),
                      Text(
                        'Budget: ${Formatters.formatCurrency(category['remaining'])}',
                        style: AppTypography.bodySmall.copyWith(
                          color: isDisabled
                              ? AppColors.error
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle, color: AppColors.primary),
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
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAmountInput() {
    final selectedCategory = _categories.firstWhere(
      (cat) => cat['id'] == _selectedCategoryId,
      orElse: () => {'remaining': double.infinity},
    );

    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixText: AppConstants.currencySymbol,
        hintText: '0',
        helperText: _selectedCategoryId != null
            ? 'Available: ${Formatters.formatCurrency(selectedCategory['remaining'])}'
            : null,
      ),
      validator: (value) => Validators.expenseAmount(
        value,
        selectedCategory['remaining'] as double,
        fieldName: 'Amount',
      ),
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
    // Validate category selection
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      try {
        // TODO: Submit to API
        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(AppConstants.successExpenseSaved),
              backgroundColor: AppColors.success,
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isSubmitting = false);
        }
      }
    }
  }
}
