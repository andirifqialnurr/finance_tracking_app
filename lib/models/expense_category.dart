import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_category.freezed.dart';
part 'expense_category.g.dart';

// ─── Enums ────────────────────────────────────────────────────────────────────

enum CategoryType {
  @JsonValue('SUBSCRIPTION')
  subscription,
  @JsonValue('DAILY_CONTINUOUS')
  dailyContinuous,
  @JsonValue('USAGE_BASED')
  usageBased,
  @JsonValue('ONE_TIME')
  oneTime,
}

// ─── ExpenseCategory ──────────────────────────────────────────────────────────

@freezed
class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    required String id,
    required String name,
    required CategoryType type,

    /// Budget bulanan. Untuk DAILY_CONTINUOUS ini auto-computed = dailyAmount * days.
    /// Default 0 agar dapat di-parse dari response /transactions yang tidak menyertakan field ini.
    @JsonKey(name: 'monthly_budget') @Default(0.0) double monthlyBudget,

    /// HANYA untuk DAILY_CONTINUOUS: nominal harian (misal Rp 40.000/hari)
    @JsonKey(name: 'daily_amount') double? dailyAmount,

    @JsonKey(name: 'allocation_priority') @Default(1) int allocationPriority,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    Map<String, dynamic>? metadata,

    /// Nullable agar kompatibel dengan embedded category di response /transactions
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ExpenseCategory;

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryFromJson(json);
}

// ─── CategoryBudget ───────────────────────────────────────────────────────────

@freezed
class CategoryBudget with _$CategoryBudget {
  const factory CategoryBudget({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    required int month,
    required int year,
    @JsonKey(name: 'allocated_amount') @Default(0) double allocatedAmount,
    @JsonKey(name: 'spent_amount') @Default(0) double spentAmount,
    @JsonKey(name: 'remaining_amount') @Default(0) double remainingAmount,

    /// Snapshot daily_amount saat alokasi (DAILY_CONTINUOUS)
    @JsonKey(name: 'effective_daily_amount') double? effectiveDailyAmount,

    /// Snapshot jumlah hari bulan saat alokasi (DAILY_CONTINUOUS)
    @JsonKey(name: 'days_in_month') int? daysInMonth,

    ExpenseCategory? category,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _CategoryBudget;

  factory CategoryBudget.fromJson(Map<String, dynamic> json) =>
      _$CategoryBudgetFromJson(json);
}
