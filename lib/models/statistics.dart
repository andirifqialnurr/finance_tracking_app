import 'package:freezed_annotation/freezed_annotation.dart';
import 'account.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

// ─── CategorySpending ─────────────────────────────────────────────────────────

@freezed
class CategorySpending with _$CategorySpending {
  const factory CategorySpending({
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    required double amount,
    @Default(0) double percentage,
  }) = _CategorySpending;

  factory CategorySpending.fromJson(Map<String, dynamic> json) =>
      _$CategorySpendingFromJson(json);
}

// ─── MonthlyStats ─────────────────────────────────────────────────────────────

@freezed
class MonthlyStats with _$MonthlyStats {
  const factory MonthlyStats({
    required int year,
    required int month,
    @JsonKey(name: 'total_income') required double totalIncome,
    @JsonKey(name: 'total_expense') required double totalExpense,
    @JsonKey(name: 'net_savings') required double netSavings,
    @JsonKey(name: 'savings_rate') required double savingsRate,
    @JsonKey(name: 'top_categories')
    @Default([])
    List<CategorySpending> topCategories,
  }) = _MonthlyStats;

  factory MonthlyStats.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatsFromJson(json);
}

// ─── OverviewStats ────────────────────────────────────────────────────────────

@freezed
class OverviewStats with _$OverviewStats {
  const factory OverviewStats({
    @JsonKey(name: 'total_balance') required double totalBalance,
    @JsonKey(name: 'month_income') required double monthIncome,
    @JsonKey(name: 'month_expense') required double monthExpense,
    @Default([]) List<Account> accounts,
  }) = _OverviewStats;

  factory OverviewStats.fromJson(Map<String, dynamic> json) =>
      _$OverviewStatsFromJson(json);
}
