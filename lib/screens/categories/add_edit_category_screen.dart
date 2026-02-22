import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_constants.dart';
import '../../models/expense_category.dart';
import '../../providers/category_provider.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_card.dart';
import '../../utils/validators.dart';
import '../../utils/app_toast.dart';

class AddEditCategoryScreen extends StatefulWidget {
  final ExpenseCategory? category; // If null, create new category

  const AddEditCategoryScreen({super.key, this.category});

  @override
  State<AddEditCategoryScreen> createState() => _AddEditCategoryScreenState();
}

class _AddEditCategoryScreenState extends State<AddEditCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _budgetController = TextEditingController();

  ExpenseCategoryType _selectedType = ExpenseCategoryType.dailyContinuous;
  bool _isActive = true;
  int _selectedPriority = 1;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      _nameController.text = widget.category!.name;
      _budgetController.text = widget.category!.monthlyBudget.toStringAsFixed(
        0,
      );
      _selectedPriority = _priorityToTier(widget.category!.priority);
      _selectedType = widget.category!.type;
      _isActive = widget.category!.isActive;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  bool get isEditing => widget.category != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Category' : 'Add Category'),
        actions: isEditing
            ? [
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: _confirmDelete,
                  color: AppColors.error,
                ),
              ]
            : null,
      ),
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
                      'Categories help organize your expenses and budget allocation',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.infoDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spacing24),

            // Name Input
            _buildSectionTitle('Category Name'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildNameInput(),
            const SizedBox(height: AppDimensions.spacing24),

            // Type Selection
            _buildSectionTitle('Category Type'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildTypeSelection(),
            const SizedBox(height: AppDimensions.spacing24),

            // Monthly Budget
            _buildSectionTitle('Monthly Budget'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildBudgetInput(),
            const SizedBox(height: AppDimensions.spacing24),

            // Priority
            _buildSectionTitle('Priority'),
            const SizedBox(height: AppDimensions.spacing12),
            _buildPriorityDropdown(),
            const SizedBox(height: AppDimensions.spacing24),

            // Active Toggle
            if (isEditing) ...[
              _buildActiveToggle(),
              const SizedBox(height: AppDimensions.spacing32),
            ],

            // Submit Button
            Consumer<CategoryProvider>(
              builder: (context, provider, _) => AppButton(
                text: isEditing ? 'Save Changes' : 'Create Category',
                isFullWidth: true,
                isLoading: provider.isSubmitting,
                onPressed: _submitForm,
                variant: AppButtonVariant.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppTypography.titleMedium);
  }

  Widget _buildNameInput() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        hintText: 'e.g., Groceries, Netflix, Transportation',
      ),
      validator: (value) => Validators.required(value, fieldName: 'Name'),
    );
  }

  Widget _buildTypeSelection() {
    return Wrap(
      spacing: AppDimensions.spacing8,
      runSpacing: AppDimensions.spacing8,
      children: ExpenseCategoryType.values.map((type) {
        final isSelected = _selectedType == type;
        return ChoiceChip(
          label: Text(_getTypeLabel(type)),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _selectedType = type;
              });
            }
          },
          selectedColor: AppColors.primary.withOpacity(0.2),
          labelStyle: AppTypography.labelMedium.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBudgetInput() {
    return TextFormField(
      controller: _budgetController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        prefixText: AppConstants.currencySymbol,
        hintText: '0',
      ),
      validator: (value) => Validators.amount(value, fieldName: 'Budget'),
    );
  }

  int _priorityToTier(int p) {
    if (p <= 2) return 1;
    if (p <= 4) return 3;
    if (p <= 6) return 5;
    return 7;
  }

  Widget _buildPriorityDropdown() {
    const items = [
      {'label': 'Important', 'value': 1},
      {'label': 'High', 'value': 3},
      {'label': 'Medium', 'value': 5},
      {'label': 'Low', 'value': 7},
    ];
    return DropdownButtonFormField<int>(
      value: _selectedPriority,
      decoration: const InputDecoration(hintText: 'Select priority level'),
      items: items
          .map(
            (item) => DropdownMenuItem<int>(
              value: item['value'] as int,
              child: Text(item['label'] as String),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) setState(() => _selectedPriority = value);
      },
    );
  }

  Widget _buildActiveToggle() {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Active Category', style: AppTypography.titleSmall),
                const SizedBox(height: AppDimensions.spacing4),
                Text(
                  'Inactive categories won\'t receive budget allocation',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _isActive,
            onChanged: (value) {
              setState(() {
                _isActive = value;
              });
            },
            activeColor: AppColors.success,
          ),
        ],
      ),
    );
  }

  String _getTypeLabel(ExpenseCategoryType type) {
    switch (type) {
      case ExpenseCategoryType.subscription:
        return 'Subscription';
      case ExpenseCategoryType.dailyContinuous:
        return 'Daily Continuous';
      case ExpenseCategoryType.usageBased:
        return 'Usage Based';
      case ExpenseCategoryType.oneTime:
        return 'One Time';
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final budget = double.tryParse(_budgetController.text) ?? 0;
      final priority = _selectedPriority;

      bool success;
      if (isEditing) {
        success = await context.read<CategoryProvider>().updateCategory(
          id: widget.category!.id,
          name: name,
          type: _selectedType,
          monthlyBudget: budget,
          allocationPriority: priority,
          isActive: _isActive,
        );
      } else {
        success = await context.read<CategoryProvider>().createCategory(
          name: name,
          type: _selectedType,
          monthlyBudget: budget,
          allocationPriority: priority,
          isActive: _isActive,
        );
      }

      if (!mounted) return;

      if (success) {
        AppToast.showSuccess(
          context,
          isEditing
              ? AppConstants.successCategoryUpdated
              : AppConstants.successCategorySaved,
        );
        Navigator.pop(context);
      } else {
        final error = context.read<CategoryProvider>().submitError;
        AppToast.showError(
          context,
          error ?? 'Failed to save category. Please try again.',
        );
      }
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Category'),
        content: const Text(
          'Are you sure you want to delete this category? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteCategory();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _deleteCategory() async {
    final success = await context.read<CategoryProvider>().deleteCategory(
      widget.category!.id,
    );

    if (!mounted) return;

    if (success) {
      AppToast.showSuccess(context, 'Category deleted successfully.');
      Navigator.pop(context);
    } else {
      final error = context.read<CategoryProvider>().submitError;
      AppToast.showError(
        context,
        error ?? 'Failed to delete category. Please try again.',
      );
    }
  }
}
