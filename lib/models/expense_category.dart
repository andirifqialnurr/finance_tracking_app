import '../core/constants/app_constants.dart';

/// Expense Category Model
class ExpenseCategory {
  final String id;
  final String name;
  final ExpenseCategoryType type;
  final double monthlyBudget;
  final int allocationPriority;
  final bool isActive;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExpenseCategory({
    required this.id,
    required this.name,
    required this.type,
    required this.monthlyBudget,
    required this.allocationPriority,
    required this.isActive,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  // From JSON
  factory ExpenseCategory.fromJson(Map<String, dynamic> json) {
    return ExpenseCategory(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: ExpenseCategoryType.fromString(
        json['type'] as String? ?? 'expense',
      ),
      monthlyBudget: (json['monthly_budget'] as num? ?? 0).toDouble(),
      allocationPriority: json['allocation_priority'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : DateTime.now(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.value,
      'monthly_budget': monthlyBudget,
      'allocation_priority': allocationPriority,
      'is_active': isActive,
      'metadata': metadata,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // To JSON for API request
  Map<String, dynamic> toJsonRequest() {
    return {
      'name': name,
      'type': type.value,
      'monthly_budget': monthlyBudget,
      'allocation_priority': allocationPriority,
      if (metadata != null) 'metadata': metadata,
    };
  }

  // Copy with
  ExpenseCategory copyWith({
    String? id,
    String? name,
    ExpenseCategoryType? type,
    double? monthlyBudget,
    int? allocationPriority,
    bool? isActive,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExpenseCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      monthlyBudget: monthlyBudget ?? this.monthlyBudget,
      allocationPriority: allocationPriority ?? this.allocationPriority,
      isActive: isActive ?? this.isActive,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get typeLabel => type.label;

  // Alias for UI convenience
  int get priority => allocationPriority;

  String get priorityLabel {
    if (allocationPriority <= 2) return 'Important';
    if (allocationPriority <= 4) return 'High';
    if (allocationPriority <= 6) return 'Medium';
    return 'Low';
  }

  @override
  String toString() {
    return 'ExpenseCategory(id: $id, name: $name, type: ${type.value}, monthlyBudget: $monthlyBudget)';
  }
}

/// Expense Category Type Enum
enum ExpenseCategoryType {
  subscription(AppConstants.categoryTypeSubscription),
  dailyContinuous(AppConstants.categoryTypeDailyContinuous),
  usageBased(AppConstants.categoryTypeUsageBased),
  oneTime(AppConstants.categoryTypeOneTime);

  final String value;
  const ExpenseCategoryType(this.value);

  static ExpenseCategoryType fromString(String value) {
    switch (value.toUpperCase()) {
      case 'SUBSCRIPTION':
        return ExpenseCategoryType.subscription;
      case 'DAILY_CONTINUOUS':
        return ExpenseCategoryType.dailyContinuous;
      case 'USAGE_BASED':
        return ExpenseCategoryType.usageBased;
      case 'ONE_TIME':
        return ExpenseCategoryType.oneTime;
      default:
        return ExpenseCategoryType.oneTime; // safe fallback instead of throwing
    }
  }

  String get label {
    return AppConstants.categoryTypeLabels[value] ?? value;
  }
}
