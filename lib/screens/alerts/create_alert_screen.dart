import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../../models/alert.dart';
import '../../providers/alert_provider.dart';
import '../../utils/app_toast.dart';
import '../../widgets/common/app_button.dart';

class CreateAlertScreen extends StatefulWidget {
  final Map<String, dynamic>? existingAlert;

  const CreateAlertScreen({super.key, this.existingAlert});

  @override
  State<CreateAlertScreen> createState() => _CreateAlertScreenState();
}

class _CreateAlertScreenState extends State<CreateAlertScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _percentageController = TextEditingController();

  String? _selectedCategoryId;
  String? _selectedCategoryName;

  // Mock categories
  final List<Map<String, dynamic>> _categories = [
    {'id': '1', 'name': 'Food & Dining', 'budget': 500000},
    {'id': '2', 'name': 'Transportation', 'budget': 400000},
    {'id': '3', 'name': 'Entertainment', 'budget': 300000},
    {'id': '4', 'name': 'Utilities', 'budget': 250000},
    {'id': '5', 'name': 'Healthcare', 'budget': 200000},
    {'id': '6', 'name': 'Shopping', 'budget': 350000},
    {'id': '7', 'name': 'Education', 'budget': 450000},
  ];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.existingAlert != null) {
      _loadExistingAlert();
    } else {
      // Default values
      _percentageController.text = '80';
    }
  }

  void _loadExistingAlert() {
    final alert = widget.existingAlert!;
    _selectedCategoryId = alert['category_id'];
    _selectedCategoryName = alert['category'];
    _amountController.text = alert['threshold_amount'].toString();
    _percentageController.text = alert['threshold_percentage'].toString();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.existingAlert == null ? 'Create Alert' : 'Edit Alert',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppDimensions.screenPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info Card
                _buildInfoCard(),
                const SizedBox(height: AppDimensions.spacing24),

                // Category Selection
                _buildCategorySection(),
                const SizedBox(height: AppDimensions.spacing24),

                // Threshold Amount
                _buildThresholdAmountSection(),
                const SizedBox(height: AppDimensions.spacing24),

                // Threshold Percentage
                _buildThresholdPercentageSection(),
                const SizedBox(height: AppDimensions.spacing24),

                // Preview Card
                if (_selectedCategoryId != null &&
                    _amountController.text.isNotEmpty)
                  _buildPreviewCard(),

                const SizedBox(height: AppDimensions.spacing32),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'Cancel',
                        onPressed: () => Navigator.pop(context),
                        variant: AppButtonVariant.secondary,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spacing12),
                    Expanded(
                      child: AppButton(
                        text: widget.existingAlert == null
                            ? 'Create Alert'
                            : 'Update Alert',
                        onPressed: _isLoading ? null : _handleSubmit,
                        variant: AppButtonVariant.primary,
                        isLoading: _isLoading,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacing24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: AppDimensions.borderRadiusLG,
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AppColors.primary, size: 20),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Text(
              'Budget alerts notify you when spending reaches a certain threshold. '
              'Set both amount and percentage to get timely notifications.',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.spacing8),
        Text(
          'Select the budget category to monitor',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing12),

        GestureDetector(
          onTap: _showCategoryPicker,
          child: Container(
            padding: AppDimensions.paddingMD,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: AppDimensions.borderRadiusMD,
              border: Border.all(
                color: _selectedCategoryId == null
                    ? AppColors.cardBorder
                    : AppColors.primary,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedCategoryName ?? 'Select category',
                  style: AppTypography.bodyMedium.copyWith(
                    color: _selectedCategoryName == null
                        ? AppColors.textSecondary
                        : AppColors.textPrimary,
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThresholdAmountSection() {
    final selectedCategory = _categories.firstWhere(
      (c) => c['id'] == _selectedCategoryId,
      orElse: () => {},
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Threshold Amount',
          style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.spacing8),
        Text(
          'Alert will trigger when spending reaches this amount',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        if (selectedCategory.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.spacing4),
          Text(
            'Current budget: Rp${(selectedCategory['budget'] / 1000).toStringAsFixed(0)}K',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        const SizedBox(height: AppDimensions.spacing12),

        TextFormField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: '500000',
            prefixText: 'Rp ',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calculate),
              onPressed: _showQuickAmountPicker,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter threshold amount';
            }
            final amount = double.tryParse(value);
            if (amount == null || amount <= 0) {
              return 'Please enter valid amount';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {}); // Rebuild for preview
          },
        ),
      ],
    );
  }

  Widget _buildThresholdPercentageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trigger Percentage',
          style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.spacing8),
        Text(
          'Alert triggers at this percentage of threshold amount',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimensions.spacing12),

        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _percentageController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: '80',
                  suffixText: '%',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter percentage';
                  }
                  final percentage = int.tryParse(value);
                  if (percentage == null ||
                      percentage < 1 ||
                      percentage > 100) {
                    return 'Enter value between 1-100';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {}); // Rebuild for preview
                },
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),

            // Quick percentage buttons
            _QuickPercentageButton(
              percentage: 50,
              isSelected: _percentageController.text == '50',
              onTap: () => setState(() => _percentageController.text = '50'),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            _QuickPercentageButton(
              percentage: 75,
              isSelected: _percentageController.text == '75',
              onTap: () => setState(() => _percentageController.text = '75'),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            _QuickPercentageButton(
              percentage: 90,
              isSelected: _percentageController.text == '90',
              onTap: () => setState(() => _percentageController.text = '90'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPreviewCard() {
    final thresholdAmount = double.tryParse(_amountController.text) ?? 0;
    final percentage = int.tryParse(_percentageController.text) ?? 80;
    final triggerAmount = thresholdAmount * (percentage / 100);

    return Container(
      padding: AppDimensions.paddingMD,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppDimensions.borderRadiusLG,
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.preview, color: AppColors.primary, size: 20),
              const SizedBox(width: AppDimensions.spacing8),
              Text(
                'Alert Preview',
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing16),

          _PreviewRow(label: 'Category', value: _selectedCategoryName ?? '-'),
          const SizedBox(height: AppDimensions.spacing12),

          _PreviewRow(
            label: 'Threshold Amount',
            value: 'Rp${(thresholdAmount / 1000).toStringAsFixed(0)}K',
          ),
          const SizedBox(height: AppDimensions.spacing12),

          _PreviewRow(
            label: 'Trigger At',
            value:
                'Rp${(triggerAmount / 1000).toStringAsFixed(0)}K ($percentage%)',
            valueColor: AppColors.warning,
          ),
          const SizedBox(height: AppDimensions.spacing16),

          Container(
            padding: AppDimensions.paddingSM,
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.1),
              borderRadius: AppDimensions.borderRadiusSM,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_active,
                  color: AppColors.warning,
                  size: 16,
                ),
                const SizedBox(width: AppDimensions.spacing8),
                Expanded(
                  child: Text(
                    'You\'ll be notified when spending reaches Rp${(triggerAmount / 1000).toStringAsFixed(0)}K',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCategoryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: AppDimensions.paddingLG,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Category',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing16),

            ..._categories.map((category) {
              final isSelected = category['id'] == _selectedCategoryId;
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.background,
                        borderRadius: AppDimensions.borderRadiusMD,
                      ),
                      child: Icon(
                        Icons.category,
                        color: isSelected
                            ? Colors.white
                            : AppColors.textSecondary,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      category['name'],
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      'Budget: Rp${(category['budget'] / 1000).toStringAsFixed(0)}K',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: AppColors.primary)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedCategoryId = category['id'];
                        _selectedCategoryName = category['name'];
                        // Auto-fill threshold amount with budget
                        _amountController.text = category['budget'].toString();
                      });
                      Navigator.pop(context);
                    },
                  ),
                  if (category != _categories.last) const Divider(height: 1),
                ],
              );
            }),

            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  void _showQuickAmountPicker() {
    final selectedCategory = _categories.firstWhere(
      (c) => c['id'] == _selectedCategoryId,
      orElse: () => {},
    );

    if (selectedCategory.isEmpty) {
      AppToast.showInfo(context, 'Please select a category first.');
      return;
    }

    final budget = selectedCategory['budget'] as int;
    final amounts = [
      {'label': '50%', 'value': budget * 0.5},
      {'label': '75%', 'value': budget * 0.75},
      {'label': '90%', 'value': budget * 0.9},
      {'label': '100%', 'value': budget.toDouble()},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: AppDimensions.paddingLG,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Amount',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing8),
            Text(
              'Based on ${selectedCategory['name']} budget',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing16),

            ...amounts.map((amount) {
              final value = amount['value']! as double;
              final label = amount['label']! as String;
              return Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spacing8),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Rp${(value / 1000).toStringAsFixed(0)}K',
                    style: AppTypography.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    label,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _amountController.text = value.round().toString();
                    });
                    Navigator.pop(context);
                  },
                ),
              );
            }),

            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedCategoryId == null) {
      AppToast.showError(
        context,
        'Please select a category before continuing.',
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final request = CreateAlertRequest(
        categoryId: _selectedCategoryId!,
        thresholdPercentage: int.parse(_percentageController.text),
      );

      final provider = context.read<AlertProvider>();
      final success = await provider.createAlert(request);

      if (mounted) {
        if (success) {
          AppToast.showSuccess(
            context,
            provider.createSuccess ?? 'Alert created successfully!',
          );
          Navigator.pop(context, true); // Return true to indicate success
        } else {
          AppToast.showError(
            context,
            'Failed to create alert. Please try again.',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        AppToast.showError(
          context,
          'Failed to create alert. Please try again.',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}

// MARK: - Quick Percentage Button Widget
class _QuickPercentageButton extends StatelessWidget {
  final int percentage;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuickPercentageButton({
    required this.percentage,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.card,
          borderRadius: AppDimensions.borderRadiusMD,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.cardBorder,
          ),
        ),
        child: Center(
          child: Text(
            '$percentage%',
            style: AppTypography.bodySmall.copyWith(
              color: isSelected ? Colors.white : AppColors.textPrimary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// MARK: - Preview Row Widget
class _PreviewRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _PreviewRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
