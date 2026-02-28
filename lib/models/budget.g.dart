// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetSummaryImpl _$$BudgetSummaryImplFromJson(Map<String, dynamic> json) =>
    _$BudgetSummaryImpl(
      totalIncome: (json['total_income'] as num?)?.toDouble() ?? 0,
      totalAllocated: (json['total_allocated'] as num?)?.toDouble() ?? 0,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0,
      totalRemaining: (json['total_remaining'] as num?)?.toDouble() ?? 0,
      unallocated: (json['unallocated'] as num?)?.toDouble() ?? 0,
      savings: (json['savings'] as num?)?.toDouble() ?? 0,
      categoriesOverBudget:
          (json['categories_over_budget'] as num?)?.toInt() ?? 0,
      categoriesWarning: (json['categories_warning'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BudgetSummaryImplToJson(_$BudgetSummaryImpl instance) =>
    <String, dynamic>{
      'total_income': instance.totalIncome,
      'total_allocated': instance.totalAllocated,
      'total_spent': instance.totalSpent,
      'total_remaining': instance.totalRemaining,
      'unallocated': instance.unallocated,
      'savings': instance.savings,
      'categories_over_budget': instance.categoriesOverBudget,
      'categories_warning': instance.categoriesWarning,
    };

_$BudgetWithCategoryImpl _$$BudgetWithCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetWithCategoryImpl(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      allocatedAmount: (json['allocated_amount'] as num?)?.toDouble() ?? 0,
      spentAmount: (json['spent_amount'] as num?)?.toDouble() ?? 0,
      remainingAmount: (json['remaining_amount'] as num?)?.toDouble() ?? 0,
      effectiveDailyAmount:
          (json['effective_daily_amount'] as num?)?.toDouble(),
      daysInMonth: (json['days_in_month'] as num?)?.toInt(),
      percentageUsed: (json['percentage_used'] as num?)?.toDouble() ?? 0,
      alertStatus: json['alert_status'] as String? ?? 'safe',
      alertThreshold: (json['alert_threshold'] as num?)?.toInt() ?? 80,
      category: json['category'] == null
          ? null
          : ExpenseCategory.fromJson(json['category'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BudgetWithCategoryImplToJson(
        _$BudgetWithCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'month': instance.month,
      'year': instance.year,
      'allocated_amount': instance.allocatedAmount,
      'spent_amount': instance.spentAmount,
      'remaining_amount': instance.remainingAmount,
      'effective_daily_amount': instance.effectiveDailyAmount,
      'days_in_month': instance.daysInMonth,
      'percentage_used': instance.percentageUsed,
      'alert_status': instance.alertStatus,
      'alert_threshold': instance.alertThreshold,
      'category': instance.category,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$BudgetReallocationImpl _$$BudgetReallocationImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetReallocationImpl(
      id: json['id'] as String,
      fromCategoryId: json['from_category_id'] as String,
      toCategoryId: json['to_category_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      reason: json['reason'] as String?,
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      fromCategory: json['from_category'] == null
          ? null
          : ExpenseCategory.fromJson(
              json['from_category'] as Map<String, dynamic>),
      toCategory: json['to_category'] == null
          ? null
          : ExpenseCategory.fromJson(
              json['to_category'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$BudgetReallocationImplToJson(
        _$BudgetReallocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_category_id': instance.fromCategoryId,
      'to_category_id': instance.toCategoryId,
      'amount': instance.amount,
      'reason': instance.reason,
      'month': instance.month,
      'year': instance.year,
      'from_category': instance.fromCategory,
      'to_category': instance.toCategory,
      'created_at': instance.createdAt.toIso8601String(),
    };
