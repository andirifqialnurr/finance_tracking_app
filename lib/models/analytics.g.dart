// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailySpendingImpl _$$DailySpendingImplFromJson(Map<String, dynamic> json) =>
    _$DailySpendingImpl(
      date: json['date'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionCount: (json['transaction_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DailySpendingImplToJson(_$DailySpendingImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'amount': instance.amount,
      'transaction_count': instance.transactionCount,
    };

_$SpendingPatternImpl _$$SpendingPatternImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendingPatternImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0,
      budgetAllocated: (json['budget_allocated'] as num?)?.toDouble() ?? 0,
      percentageUsed: (json['percentage_used'] as num?)?.toDouble() ?? 0,
      transactionCount: (json['transaction_count'] as num?)?.toInt() ?? 0,
      dailyBreakdown: (json['daily_breakdown'] as List<dynamic>?)
              ?.map((e) => DailySpending.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SpendingPatternImplToJson(
        _$SpendingPatternImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'total_spent': instance.totalSpent,
      'budget_allocated': instance.budgetAllocated,
      'percentage_used': instance.percentageUsed,
      'transaction_count': instance.transactionCount,
      'daily_breakdown': instance.dailyBreakdown,
    };

_$CategoryComparisonImpl _$$CategoryComparisonImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryComparisonImpl(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0,
      budgetAmount: (json['budget_amount'] as num?)?.toDouble() ?? 0,
      percentageUsed: (json['percentage_used'] as num?)?.toDouble() ?? 0,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$CategoryComparisonImplToJson(
        _$CategoryComparisonImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'month': instance.month,
      'year': instance.year,
      'total_spent': instance.totalSpent,
      'budget_amount': instance.budgetAmount,
      'percentage_used': instance.percentageUsed,
      'color': instance.color,
    };

_$TopSpendingCategoryImpl _$$TopSpendingCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TopSpendingCategoryImpl(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      totalSpent: (json['total_spent'] as num).toDouble(),
      transactionCount: (json['transaction_count'] as num?)?.toInt() ?? 0,
      percentageOfTotal: (json['percentage_of_total'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$TopSpendingCategoryImplToJson(
        _$TopSpendingCategoryImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'total_spent': instance.totalSpent,
      'transaction_count': instance.transactionCount,
      'percentage_of_total': instance.percentageOfTotal,
    };

_$CategoryPerformanceImpl _$$CategoryPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryPerformanceImpl(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      budgetAmount: (json['budget_amount'] as num?)?.toDouble() ?? 0,
      spentAmount: (json['spent_amount'] as num?)?.toDouble() ?? 0,
      percentageUsed: (json['percentage_used'] as num?)?.toDouble() ?? 0,
      isOverBudget: json['is_over_budget'] as bool? ?? false,
    );

Map<String, dynamic> _$$CategoryPerformanceImplToJson(
        _$CategoryPerformanceImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'budget_amount': instance.budgetAmount,
      'spent_amount': instance.spentAmount,
      'percentage_used': instance.percentageUsed,
      'is_over_budget': instance.isOverBudget,
    };

_$BudgetPerformanceImpl _$$BudgetPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetPerformanceImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      totalBudget: (json['total_budget'] as num?)?.toDouble() ?? 0,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0,
      percentageUsed: (json['percentage_used'] as num?)?.toDouble() ?? 0,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) =>
                  CategoryPerformance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BudgetPerformanceImplToJson(
        _$BudgetPerformanceImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'total_budget': instance.totalBudget,
      'total_spent': instance.totalSpent,
      'percentage_used': instance.percentageUsed,
      'categories': instance.categories,
    };
