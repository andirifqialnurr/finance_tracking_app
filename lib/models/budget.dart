import 'package:freezed_annotation/freezed_annotation.dart';
import 'expense_category.dart';

part 'budget.freezed.dart';
part 'budget.g.dart';

// ─── BudgetSummary ────────────────────────────────────────────────────────────

/// GET /budgets/summary → ringkasan budget keseluruhan bulan ini
@freezed
class BudgetSummary with _$BudgetSummary {
  const factory BudgetSummary({
    @JsonKey(name: 'total_income') @Default(0) double totalIncome,
    @JsonKey(name: 'total_allocated') @Default(0) double totalAllocated,
    @JsonKey(name: 'total_spent') @Default(0) double totalSpent,
    @JsonKey(name: 'total_remaining') @Default(0) double totalRemaining,
    @Default(0) double unallocated,
    @Default(0) double savings,
    @JsonKey(name: 'categories_over_budget')
    @Default(0)
    int categoriesOverBudget,
    @JsonKey(name: 'categories_warning') @Default(0) int categoriesWarning,
  }) = _BudgetSummary;

  factory BudgetSummary.fromJson(Map<String, dynamic> json) =>
      _$BudgetSummaryFromJson(json);
}

// ─── BudgetWithCategory ───────────────────────────────────────────────────────

/// Item dalam GET /budgets — budget satu kategori dengan detail kategori
@freezed
class BudgetWithCategory with _$BudgetWithCategory {
  const factory BudgetWithCategory({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    required int month,
    required int year,
    @JsonKey(name: 'allocated_amount') @Default(0) double allocatedAmount,
    @JsonKey(name: 'spent_amount') @Default(0) double spentAmount,
    @JsonKey(name: 'remaining_amount') @Default(0) double remainingAmount,
    @JsonKey(name: 'effective_daily_amount') double? effectiveDailyAmount,
    @JsonKey(name: 'days_in_month') int? daysInMonth,
    @JsonKey(name: 'percentage_used') @Default(0) double percentageUsed,
    @JsonKey(name: 'alert_status') @Default('safe') String alertStatus,
    @JsonKey(name: 'alert_threshold') @Default(80) int alertThreshold,
    ExpenseCategory? category,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _BudgetWithCategory;

  factory BudgetWithCategory.fromJson(Map<String, dynamic> json) =>
      _$BudgetWithCategoryFromJson(json);
}

// ─── BudgetReallocation ───────────────────────────────────────────────────────

/// History realokasi manual — GET /budgets/reallocations
@freezed
class BudgetReallocation with _$BudgetReallocation {
  const factory BudgetReallocation({
    required String id,
    @JsonKey(name: 'from_category_id') required String fromCategoryId,
    @JsonKey(name: 'to_category_id') required String toCategoryId,
    required double amount,
    String? reason,
    required int month,
    required int year,
    @JsonKey(name: 'from_category') ExpenseCategory? fromCategory,
    @JsonKey(name: 'to_category') ExpenseCategory? toCategory,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _BudgetReallocation;

  factory BudgetReallocation.fromJson(Map<String, dynamic> json) =>
      _$BudgetReallocationFromJson(json);
}
