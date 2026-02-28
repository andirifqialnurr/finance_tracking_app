// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      categoryId: json['category_id'] as String,
      accountId: json['account_id'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'category_id': instance.categoryId,
      'account_id': instance.accountId,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$ExpenseCreateResultImpl _$$ExpenseCreateResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseCreateResultImpl(
      expense: Expense.fromJson(json['expense'] as Map<String, dynamic>),
      budgetWarning: json['budget_warning'] as String?,
    );

Map<String, dynamic> _$$ExpenseCreateResultImplToJson(
        _$ExpenseCreateResultImpl instance) =>
    <String, dynamic>{
      'expense': instance.expense,
      'budget_warning': instance.budgetWarning,
    };
