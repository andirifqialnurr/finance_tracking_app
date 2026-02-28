import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

// ─── CategorySummary ───────────────────────────────────────────────────────

@freezed
class CategorySummary with _$CategorySummary {
  const factory CategorySummary({
    required String name,
    required double spent,
    required double budget,
    required double percentage,
  }) = _CategorySummary;

  factory CategorySummary.fromJson(Map<String, dynamic> json) =>
      _$CategorySummaryFromJson(json);
}

// ─── MonthlyReport ──────────────────────────────────────────────────────

@freezed
class MonthlyReport with _$MonthlyReport {
  const factory MonthlyReport({
    required int month,
    required int year,
    @JsonKey(name: 'total_income') @Default(0) double totalIncome,
    @JsonKey(name: 'total_spent') @Default(0) double totalSpent,
    @JsonKey(name: 'total_budget') @Default(0) double totalBudget,
    @JsonKey(name: 'remaining_budget') @Default(0) double remainingBudget,
    @JsonKey(name: 'total_allocated') @Default(0) double totalAllocated,
    @JsonKey(name: 'total_remaining') @Default(0) double totalRemaining,
    @JsonKey(name: 'unallocated') @Default(0) double unallocated,
    @JsonKey(name: 'savings') @Default(0) double savings,
    @JsonKey(name: 'top_category') @Default('') String topCategory,
    @JsonKey(name: 'top_category_amount') @Default(0) double topCategoryAmount,
    @Default([]) List<CategorySummary> categories,
    @JsonKey(name: 'generated_at') DateTime? generatedAt,
  }) = _MonthlyReport;

  factory MonthlyReport.fromJson(Map<String, dynamic> json) =>
      _$MonthlyReportFromJson(json);
}

// ─── MonthlySummary ──────────────────────────────────────────────────────

@freezed
class MonthlySummary with _$MonthlySummary {
  const factory MonthlySummary({
    required String month,
    required double income,
    required double spent,
    required double remaining,
  }) = _MonthlySummary;

  factory MonthlySummary.fromJson(Map<String, dynamic> json) =>
      _$MonthlySummaryFromJson(json);
}

// ─── YearlyReport ───────────────────────────────────────────────────────

@freezed
class YearlyReport with _$YearlyReport {
  const factory YearlyReport({
    required int year,
    @JsonKey(name: 'total_income') @Default(0) double totalIncome,
    @JsonKey(name: 'total_spent') @Default(0) double totalSpent,
    @JsonKey(name: 'total_budget') @Default(0) double totalBudget,
    @JsonKey(name: 'average_monthly_income')
    @Default(0)
    double averageMonthlyIncome,
    @JsonKey(name: 'average_monthly_spending')
    @Default(0)
    double averageMonthlySpending,
    @JsonKey(name: 'highest_spending_month')
    @Default('')
    String highestSpendingMonth,
    @JsonKey(name: 'lowest_spending_month')
    @Default('')
    String lowestSpendingMonth,
    @JsonKey(name: 'monthly_summaries')
    @Default([])
    List<MonthlySummary> monthlySummaries,
  }) = _YearlyReport;

  factory YearlyReport.fromJson(Map<String, dynamic> json) =>
      _$YearlyReportFromJson(json);
}
