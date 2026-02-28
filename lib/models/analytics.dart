import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics.freezed.dart';
part 'analytics.g.dart';

// ─── DailySpending ────────────────────────────────────────────────────────────

@freezed
class DailySpending with _$DailySpending {
  const factory DailySpending({
    required String date,
    required double amount,
    @JsonKey(name: 'transaction_count') @Default(0) int transactionCount,
  }) = _DailySpending;

  factory DailySpending.fromJson(Map<String, dynamic> json) =>
      _$DailySpendingFromJson(json);
}

// ─── SpendingPattern ──────────────────────────────────────────────────────────

@freezed
class SpendingPattern with _$SpendingPattern {
  const factory SpendingPattern({
    required int month,
    required int year,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'total_spent') @Default(0) double totalSpent,
    @JsonKey(name: 'budget_allocated') @Default(0) double budgetAllocated,
    @JsonKey(name: 'percentage_used') @Default(0) double percentageUsed,
    @JsonKey(name: 'transaction_count') @Default(0) int transactionCount,
    @JsonKey(name: 'daily_breakdown')
    @Default([])
    List<DailySpending> dailyBreakdown,
  }) = _SpendingPattern;

  factory SpendingPattern.fromJson(Map<String, dynamic> json) =>
      _$SpendingPatternFromJson(json);
}

// ─── CategoryComparison ───────────────────────────────────────────────────────

@freezed
class CategoryComparison with _$CategoryComparison {
  const factory CategoryComparison({
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    required int month,
    required int year,
    @JsonKey(name: 'total_spent') @Default(0) double totalSpent,
    @JsonKey(name: 'budget_amount') @Default(0) double budgetAmount,
    @JsonKey(name: 'percentage_used') @Default(0) double percentageUsed,
    String? color,
  }) = _CategoryComparison;

  factory CategoryComparison.fromJson(Map<String, dynamic> json) =>
      _$CategoryComparisonFromJson(json);
}

// ─── TopSpendingCategory ──────────────────────────────────────────────────────

@freezed
class TopSpendingCategory with _$TopSpendingCategory {
  const factory TopSpendingCategory({
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'total_spent') required double totalSpent,
    @JsonKey(name: 'transaction_count') @Default(0) int transactionCount,
    @JsonKey(name: 'percentage_of_total') @Default(0) double percentageOfTotal,
  }) = _TopSpendingCategory;

  factory TopSpendingCategory.fromJson(Map<String, dynamic> json) =>
      _$TopSpendingCategoryFromJson(json);
}

// ─── CategoryPerformance ──────────────────────────────────────────────────────

@freezed
class CategoryPerformance with _$CategoryPerformance {
  const factory CategoryPerformance({
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'budget_amount') @Default(0) double budgetAmount,
    @JsonKey(name: 'spent_amount') @Default(0) double spentAmount,
    @JsonKey(name: 'percentage_used') @Default(0) double percentageUsed,
    @JsonKey(name: 'is_over_budget') @Default(false) bool isOverBudget,
  }) = _CategoryPerformance;

  factory CategoryPerformance.fromJson(Map<String, dynamic> json) =>
      _$CategoryPerformanceFromJson(json);
}

// ─── BudgetPerformance ────────────────────────────────────────────────────────

@freezed
class BudgetPerformance with _$BudgetPerformance {
  const factory BudgetPerformance({
    required int month,
    required int year,
    @JsonKey(name: 'total_budget') @Default(0) double totalBudget,
    @JsonKey(name: 'total_spent') @Default(0) double totalSpent,
    @JsonKey(name: 'percentage_used') @Default(0) double percentageUsed,
    @Default([]) List<CategoryPerformance> categories,
  }) = _BudgetPerformance;

  factory BudgetPerformance.fromJson(Map<String, dynamic> json) =>
      _$BudgetPerformanceFromJson(json);
}
