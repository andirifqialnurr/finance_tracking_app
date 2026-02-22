import 'expense_category.dart';

/// Category Budget Model — represents `category_budgets` DB table row
class CategoryBudget {
  final String id;
  final String categoryId;
  final int month;
  final int year;
  final double allocatedAmount;
  final double spentAmount;
  final double remainingAmount;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryBudget({
    required this.id,
    required this.categoryId,
    required this.month,
    required this.year,
    required this.allocatedAmount,
    required this.spentAmount,
    required this.remainingAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  // From JSON
  factory CategoryBudget.fromJson(Map<String, dynamic> json) {
    return CategoryBudget(
      id: json['id'] as String? ?? '',
      categoryId: json['category_id'] as String? ?? '',
      month: json['month'] as int? ?? 0,
      year: json['year'] as int? ?? 0,
      allocatedAmount: (json['allocated_amount'] as num? ?? 0).toDouble(),
      spentAmount: (json['spent_amount'] as num? ?? 0).toDouble(),
      remainingAmount: (json['remaining_amount'] as num? ?? 0).toDouble(),
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
      'category_id': categoryId,
      'month': month,
      'year': year,
      'allocated_amount': allocatedAmount,
      'spent_amount': spentAmount,
      'remaining_amount': remainingAmount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // Calculate percentage used
  double get percentageUsed {
    if (allocatedAmount == 0) return 0;
    return (spentAmount / allocatedAmount) * 100;
  }

  // Check if budget is low (< 50% used)
  bool get isLow => percentageUsed < 50;

  // Check if budget is medium (50-80% used)
  bool get isMedium => percentageUsed >= 50 && percentageUsed < 80;

  // Check if budget is high (>= 80% used)
  bool get isHigh => percentageUsed >= 80;

  // Check if budget is exceeded
  bool get isExceeded => spentAmount > allocatedAmount;

  // Copy with
  CategoryBudget copyWith({
    String? id,
    String? categoryId,
    int? month,
    int? year,
    double? allocatedAmount,
    double? spentAmount,
    double? remainingAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryBudget(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      month: month ?? this.month,
      year: year ?? this.year,
      allocatedAmount: allocatedAmount ?? this.allocatedAmount,
      spentAmount: spentAmount ?? this.spentAmount,
      remainingAmount: remainingAmount ?? this.remainingAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'CategoryBudget(categoryId: $categoryId, month: $month, year: $year, allocated: $allocatedAmount, spent: $spentAmount, remaining: $remainingAmount)';
  }
}

/// Budget with Category Details — response from GET /budgets
/// Includes computed fields: percentage_used, alert_status, alert_threshold
class BudgetWithCategory {
  final CategoryBudget budget;
  final ExpenseCategory category;
  final double percentageUsedComputed; // from backend calculation
  final String alertStatus; // "safe" / "warning" / "critical"
  final int alertThreshold;

  BudgetWithCategory({
    required this.budget,
    required this.category,
    required this.percentageUsedComputed,
    required this.alertStatus,
    required this.alertThreshold,
  });

  factory BudgetWithCategory.fromJson(Map<String, dynamic> json) {
    return BudgetWithCategory(
      budget: CategoryBudget.fromJson(json),
      category: ExpenseCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      percentageUsedComputed: (json['percentage_used'] as num? ?? 0).toDouble(),
      alertStatus: json['alert_status'] as String? ?? 'safe',
      alertThreshold: json['alert_threshold'] as int? ?? 80,
    );
  }

  double get allocatedAmount => budget.allocatedAmount;
  double get spentAmount => budget.spentAmount;
  double get remainingAmount => budget.remainingAmount;
  double get percentageUsed => percentageUsedComputed;

  bool get isSafe => alertStatus == 'safe';
  bool get isWarning => alertStatus == 'warning';
  bool get isCritical => alertStatus == 'critical';
}

/// Budget Summary Model — response from GET /budgets/summary
class BudgetSummary {
  final double totalIncome;
  final double totalAllocated;
  final double totalSpent;
  final double totalRemaining;
  final double unallocated;
  final double savings; // income - total_spent
  final int categoriesOverBudget;
  final int categoriesWarning;

  BudgetSummary({
    required this.totalIncome,
    required this.totalAllocated,
    required this.totalSpent,
    required this.totalRemaining,
    required this.unallocated,
    required this.savings,
    required this.categoriesOverBudget,
    required this.categoriesWarning,
  });

  factory BudgetSummary.fromJson(Map<String, dynamic> json) {
    return BudgetSummary(
      totalIncome:
          (json['total_income'] as num? ?? json['totalIncome'] as num? ?? 0)
              .toDouble(),
      totalAllocated:
          (json['total_allocated'] as num? ??
                  json['totalAllocated'] as num? ??
                  0)
              .toDouble(),
      totalSpent:
          (json['total_spent'] as num? ?? json['totalSpent'] as num? ?? 0)
              .toDouble(),
      totalRemaining:
          (json['total_remaining'] as num? ??
                  json['totalRemaining'] as num? ??
                  0)
              .toDouble(),
      unallocated:
          (json['unallocated'] as num? ??
                  json['unallocated_funds'] as num? ??
                  0)
              .toDouble(),
      savings: (json['savings'] as num? ?? 0).toDouble(),
      categoriesOverBudget: json['categories_over_budget'] as int? ?? 0,
      categoriesWarning: json['categories_warning'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_income': totalIncome,
      'total_allocated': totalAllocated,
      'total_spent': totalSpent,
      'total_remaining': totalRemaining,
      'unallocated': unallocated,
      'savings': savings,
      'categories_over_budget': categoriesOverBudget,
      'categories_warning': categoriesWarning,
    };
  }

  double get spentPercentage {
    if (totalAllocated == 0) return 0;
    return (totalSpent / totalAllocated) * 100;
  }

  double get savingsPercentage {
    if (totalIncome == 0) return 0;
    return (savings / totalIncome) * 100;
  }
}

/// Budget Reallocation Model — response from GET /budgets/reallocations
class BudgetReallocation {
  final String id;
  final ExpenseCategory fromCategory;
  final ExpenseCategory toCategory;
  final double amount;
  final String? reason;
  final int month;
  final int year;
  final DateTime createdAt;

  BudgetReallocation({
    required this.id,
    required this.fromCategory,
    required this.toCategory,
    required this.amount,
    this.reason,
    required this.month,
    required this.year,
    required this.createdAt,
  });

  factory BudgetReallocation.fromJson(Map<String, dynamic> json) {
    return BudgetReallocation(
      id: json['id'] as String,
      fromCategory: ExpenseCategory.fromJson(
        json['from_category'] as Map<String, dynamic>,
      ),
      toCategory: ExpenseCategory.fromJson(
        json['to_category'] as Map<String, dynamic>,
      ),
      amount: (json['amount'] as num).toDouble(),
      reason: json['reason'] as String?,
      month: json['month'] as int,
      year: json['year'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'from_category': fromCategory.toJson(),
      'to_category': toCategory.toJson(),
      'amount': amount,
      'reason': reason,
      'month': month,
      'year': year,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
