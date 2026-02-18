import '../core/constants/app_constants.dart';

/// Utility class for validating inputs
class Validators {
  Validators._();

  /// Validate required field
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return fieldName != null
          ? '$fieldName ${AppConstants.validationRequired.toLowerCase()}'
          : AppConstants.validationRequired;
    }
    return null;
  }

  /// Validate amount (must be positive number)
  static String? amount(String? value, {String? fieldName}) {
    // Check if required
    final requiredError = required(value, fieldName: fieldName);
    if (requiredError != null) return requiredError;

    // Parse to double
    final amount = double.tryParse(value!.replaceAll(',', '.'));
    if (amount == null) {
      return AppConstants.validationInvalidAmount;
    }

    // Must be positive
    if (amount <= 0) {
      return '${fieldName ?? 'Amount'} must be greater than 0';
    }

    return null;
  }

  /// Validate amount with max limit
  static String? amountWithMax(
    String? value,
    double maxAmount, {
    String? fieldName,
  }) {
    // First validate basic amount
    final amountError = amount(value, fieldName: fieldName);
    if (amountError != null) return amountError;

    // Check max
    final parsedAmount = double.parse(value!.replaceAll(',', '.'));
    if (parsedAmount > maxAmount) {
      return '${fieldName ?? 'Amount'} cannot exceed ${maxAmount.toStringAsFixed(0)}';
    }

    return null;
  }

  /// Validate expense amount against budget
  static String? expenseAmount(
    String? value,
    double availableBudget, {
    String? fieldName,
  }) {
    // First validate basic amount
    final amountError = amount(value, fieldName: fieldName);
    if (amountError != null) return amountError;

    // Check if exceeds budget
    final parsedAmount = double.parse(value!.replaceAll(',', '.'));
    if (parsedAmount > availableBudget) {
      return AppConstants.validationInsufficientBudget;
    }

    return null;
  }

  /// Validate max length
  static String? maxLength(String? value, int maxLen, {String? fieldName}) {
    if (value != null && value.length > maxLen) {
      return '${fieldName ?? 'Field'} must not exceed $maxLen characters';
    }
    return null;
  }

  /// Validate description
  static String? description(String? value) {
    return maxLength(
      value,
      AppConstants.maxDescriptionLength,
      fieldName: 'Description',
    );
  }

  /// Validate category name
  static String? categoryName(String? value) {
    // Check required
    final requiredError = required(value, fieldName: 'Category name');
    if (requiredError != null) return requiredError;

    // Check max length
    return maxLength(
      value,
      AppConstants.maxCategoryNameLength,
      fieldName: 'Category name',
    );
  }

  /// Validate email (for future use)
  static String? email(String? value) {
    final requiredError = required(value, fieldName: 'Email');
    if (requiredError != null) return requiredError;

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  /// Validate phone number (for future use)
  static String? phoneNumber(String? value) {
    final requiredError = required(value, fieldName: 'Phone number');
    if (requiredError != null) return requiredError;

    // Indonesian phone number format
    final phoneRegex = RegExp(r'^(\+62|62|0)[0-9]{9,12}$');
    if (!phoneRegex.hasMatch(value!.replaceAll(RegExp(r'[\s-]'), ''))) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Validate date not in future
  static String? dateNotFuture(DateTime? date, {String? fieldName}) {
    if (date == null) {
      return '${fieldName ?? 'Date'} ${AppConstants.validationRequired.toLowerCase()}';
    }

    final now = DateTime.now();
    if (date.isAfter(now)) {
      return '${fieldName ?? 'Date'} cannot be in the future';
    }

    return null;
  }

  /// Validate month (1-12)
  static String? month(int? value) {
    if (value == null) return 'Month is required';
    if (value < 1 || value > 12) return 'Invalid month';
    return null;
  }

  /// Validate year
  static String? year(int? value) {
    if (value == null) return 'Year is required';
    if (value < 2000 || value > 2100) return 'Invalid year';
    return null;
  }

  /// Validate priority (1-10)
  static String? priority(int? value) {
    if (value == null) return 'Priority is required';
    if (value < 1 || value > 10) return 'Priority must be between 1 and 10';
    return null;
  }

  /// Combine multiple validators
  static String? Function(String?) combine(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }
}
