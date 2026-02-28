// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategorySpendingImpl _$$CategorySpendingImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorySpendingImpl(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CategorySpendingImplToJson(
        _$CategorySpendingImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'amount': instance.amount,
      'percentage': instance.percentage,
    };

_$MonthlyStatsImpl _$$MonthlyStatsImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyStatsImpl(
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      totalIncome: (json['total_income'] as num).toDouble(),
      totalExpense: (json['total_expense'] as num).toDouble(),
      netSavings: (json['net_savings'] as num).toDouble(),
      savingsRate: (json['savings_rate'] as num).toDouble(),
      topCategories: (json['top_categories'] as List<dynamic>?)
              ?.map((e) => CategorySpending.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MonthlyStatsImplToJson(_$MonthlyStatsImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'total_income': instance.totalIncome,
      'total_expense': instance.totalExpense,
      'net_savings': instance.netSavings,
      'savings_rate': instance.savingsRate,
      'top_categories': instance.topCategories,
    };

_$OverviewStatsImpl _$$OverviewStatsImplFromJson(Map<String, dynamic> json) =>
    _$OverviewStatsImpl(
      totalBalance: (json['total_balance'] as num).toDouble(),
      monthIncome: (json['month_income'] as num).toDouble(),
      monthExpense: (json['month_expense'] as num).toDouble(),
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OverviewStatsImplToJson(_$OverviewStatsImpl instance) =>
    <String, dynamic>{
      'total_balance': instance.totalBalance,
      'month_income': instance.monthIncome,
      'month_expense': instance.monthExpense,
      'accounts': instance.accounts,
    };
