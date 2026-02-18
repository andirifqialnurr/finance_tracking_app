import 'expense_category.dart';

/// Category Budget Model
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
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      month: json['month'] as int,
      year: json['year'] as int,
      allocatedAmount: (json['allocated_amount'] as num).toDouble(),
      spentAmount: (json['spent_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
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

/// Budget with Category Details
class BudgetWithCategory {
  final CategoryBudget budget;
  final ExpenseCategory category;

  BudgetWithCategory({required this.budget, required this.category});

  factory BudgetWithCategory.fromJson(Map<String, dynamic> json) {
    return BudgetWithCategory(
      budget: CategoryBudget.fromJson(json),
      category: ExpenseCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
    );
  }

  double get percentageUsed => budget.percentageUsed;
  double get allocatedAmount => budget.allocatedAmount;
  double get spentAmount => budget.spentAmount;
  double get remainingAmount => budget.remainingAmount;
}

/// Budget Summary Model
class BudgetSummary {
  final double totalIncome;
  final double totalAllocated;
  final double totalSpent;
  final double totalRemaining;
  final double unallocated;

  BudgetSummary({
    required this.totalIncome,
    required this.totalAllocated,
    required this.totalSpent,
    required this.totalRemaining,
    required this.unallocated,
  });

  factory BudgetSummary.fromJson(Map<String, dynamic> json) {
    return BudgetSummary(
      totalIncome: (json['total_income'] as num).toDouble(),
      totalAllocated: (json['total_allocated'] as num).toDouble(),
      totalSpent: (json['total_spent'] as num).toDouble(),
      totalRemaining: (json['total_remaining'] as num).toDouble(),
      unallocated: (json['unallocated'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_income': totalIncome,
      'total_allocated': totalAllocated,
      'total_spent': totalSpent,
      'total_remaining': totalRemaining,
      'unallocated': unallocated,
    };
  }

  double get spentPercentage {
    if (totalAllocated == 0) return 0;
    return (totalSpent / totalAllocated) * 100;
  }
}
