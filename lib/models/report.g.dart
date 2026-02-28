// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategorySummaryImpl _$$CategorySummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorySummaryImpl(
      name: json['name'] as String,
      spent: (json['spent'] as num).toDouble(),
      budget: (json['budget'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$CategorySummaryImplToJson(
        _$CategorySummaryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'spent': instance.spent,
      'budget': instance.budget,
      'percentage': instance.percentage,
    };

_$MonthlyReportImpl _$$MonthlyReportImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyReportImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      totalIncome: (json['total_income'] as num?)?.toDouble() ?? 0,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0,
      totalBudget: (json['total_budget'] as num?)?.toDouble() ?? 0,
      remainingBudget: (json['remaining_budget'] as num?)?.toDouble() ?? 0,
      totalAllocated: (json['total_allocated'] as num?)?.toDouble() ?? 0,
      totalRemaining: (json['total_remaining'] as num?)?.toDouble() ?? 0,
      unallocated: (json['unallocated'] as num?)?.toDouble() ?? 0,
      savings: (json['savings'] as num?)?.toDouble() ?? 0,
      topCategory: json['top_category'] as String? ?? '',
      topCategoryAmount: (json['top_category_amount'] as num?)?.toDouble() ?? 0,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategorySummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      generatedAt: json['generated_at'] == null
          ? null
          : DateTime.parse(json['generated_at'] as String),
    );

Map<String, dynamic> _$$MonthlyReportImplToJson(_$MonthlyReportImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'total_income': instance.totalIncome,
      'total_spent': instance.totalSpent,
      'total_budget': instance.totalBudget,
      'remaining_budget': instance.remainingBudget,
      'total_allocated': instance.totalAllocated,
      'total_remaining': instance.totalRemaining,
      'unallocated': instance.unallocated,
      'savings': instance.savings,
      'top_category': instance.topCategory,
      'top_category_amount': instance.topCategoryAmount,
      'categories': instance.categories,
      'generated_at': instance.generatedAt?.toIso8601String(),
    };

_$MonthlySummaryImpl _$$MonthlySummaryImplFromJson(Map<String, dynamic> json) =>
    _$MonthlySummaryImpl(
      month: json['month'] as String,
      income: (json['income'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      remaining: (json['remaining'] as num).toDouble(),
    );

Map<String, dynamic> _$$MonthlySummaryImplToJson(
        _$MonthlySummaryImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'income': instance.income,
      'spent': instance.spent,
      'remaining': instance.remaining,
    };

_$YearlyReportImpl _$$YearlyReportImplFromJson(Map<String, dynamic> json) =>
    _$YearlyReportImpl(
      year: (json['year'] as num).toInt(),
      totalIncome: (json['total_income'] as num?)?.toDouble() ?? 0,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0,
      totalBudget: (json['total_budget'] as num?)?.toDouble() ?? 0,
      averageMonthlyIncome:
          (json['average_monthly_income'] as num?)?.toDouble() ?? 0,
      averageMonthlySpending:
          (json['average_monthly_spending'] as num?)?.toDouble() ?? 0,
      highestSpendingMonth: json['highest_spending_month'] as String? ?? '',
      lowestSpendingMonth: json['lowest_spending_month'] as String? ?? '',
      monthlySummaries: (json['monthly_summaries'] as List<dynamic>?)
              ?.map((e) => MonthlySummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$YearlyReportImplToJson(_$YearlyReportImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'total_income': instance.totalIncome,
      'total_spent': instance.totalSpent,
      'total_budget': instance.totalBudget,
      'average_monthly_income': instance.averageMonthlyIncome,
      'average_monthly_spending': instance.averageMonthlySpending,
      'highest_spending_month': instance.highestSpendingMonth,
      'lowest_spending_month': instance.lowestSpendingMonth,
      'monthly_summaries': instance.monthlySummaries,
    };
