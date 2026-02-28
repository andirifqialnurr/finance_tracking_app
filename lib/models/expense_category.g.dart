// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseCategoryImpl _$$ExpenseCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$CategoryTypeEnumMap, json['type']),
      monthlyBudget: (json['monthly_budget'] as num?)?.toDouble() ?? 0.0,
      dailyAmount: (json['daily_amount'] as num?)?.toDouble(),
      allocationPriority: (json['allocation_priority'] as num?)?.toInt() ?? 1,
      isActive: json['is_active'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ExpenseCategoryImplToJson(
        _$ExpenseCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CategoryTypeEnumMap[instance.type]!,
      'monthly_budget': instance.monthlyBudget,
      'daily_amount': instance.dailyAmount,
      'allocation_priority': instance.allocationPriority,
      'is_active': instance.isActive,
      'metadata': instance.metadata,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$CategoryTypeEnumMap = {
  CategoryType.subscription: 'SUBSCRIPTION',
  CategoryType.dailyContinuous: 'DAILY_CONTINUOUS',
  CategoryType.usageBased: 'USAGE_BASED',
  CategoryType.oneTime: 'ONE_TIME',
};

_$CategoryBudgetImpl _$$CategoryBudgetImplFromJson(Map<String, dynamic> json) =>
    _$CategoryBudgetImpl(
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
      category: json['category'] == null
          ? null
          : ExpenseCategory.fromJson(json['category'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CategoryBudgetImplToJson(
        _$CategoryBudgetImpl instance) =>
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
      'category': instance.category,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
