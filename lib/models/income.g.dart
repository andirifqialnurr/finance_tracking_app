// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomeImpl _$$IncomeImplFromJson(Map<String, dynamic> json) => _$IncomeImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      source: json['source'] as String,
      description: json['description'] as String?,
      accountId: json['account_id'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$IncomeImplToJson(_$IncomeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'source': instance.source,
      'description': instance.description,
      'account_id': instance.accountId,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$BudgetAllocationImpl _$$BudgetAllocationImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetAllocationImpl(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      allocatedAmount: (json['allocated_amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetAllocationImplToJson(
        _$BudgetAllocationImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'allocated_amount': instance.allocatedAmount,
      'percentage': instance.percentage,
    };

_$IncomeCreateResultImpl _$$IncomeCreateResultImplFromJson(
        Map<String, dynamic> json) =>
    _$IncomeCreateResultImpl(
      income: Income.fromJson(json['income'] as Map<String, dynamic>),
      allocations: (json['allocations'] as List<dynamic>?)
              ?.map((e) => BudgetAllocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      alreadyAllocatedWarning: json['already_allocated_warning'] as String?,
    );

Map<String, dynamic> _$$IncomeCreateResultImplToJson(
        _$IncomeCreateResultImpl instance) =>
    <String, dynamic>{
      'income': instance.income,
      'allocations': instance.allocations,
      'already_allocated_warning': instance.alreadyAllocatedWarning,
    };
