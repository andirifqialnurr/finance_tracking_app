// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$AccountTypeEnumMap, json['type']),
      balance: (json['balance'] as num).toDouble(),
      incomeType: json['income_type'] as String?,
      goalAmount: (json['goal_amount'] as num?)?.toDouble(),
      goalLabel: json['goal_label'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AccountTypeEnumMap[instance.type]!,
      'balance': instance.balance,
      'income_type': instance.incomeType,
      'goal_amount': instance.goalAmount,
      'goal_label': instance.goalLabel,
      'color': instance.color,
      'description': instance.description,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$AccountTypeEnumMap = {
  AccountType.card: 'CARD',
  AccountType.cash: 'CASH',
  AccountType.savings: 'SAVINGS',
};

_$AccountSummaryImpl _$$AccountSummaryImplFromJson(Map<String, dynamic> json) =>
    _$AccountSummaryImpl(
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      totalIncome: (json['total_income'] as num?)?.toDouble() ?? 0,
      totalExpense: (json['total_expense'] as num?)?.toDouble() ?? 0,
      totalTransferIn: (json['total_transfer_in'] as num?)?.toDouble() ?? 0,
      totalTransferOut: (json['total_transfer_out'] as num?)?.toDouble() ?? 0,
      netFlow: (json['net_flow'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$AccountSummaryImplToJson(
        _$AccountSummaryImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'total_income': instance.totalIncome,
      'total_expense': instance.totalExpense,
      'total_transfer_in': instance.totalTransferIn,
      'total_transfer_out': instance.totalTransferOut,
      'net_flow': instance.netFlow,
    };

_$AccountsOverviewImpl _$$AccountsOverviewImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsOverviewImpl(
      totalBalance: (json['total_balance'] as num?)?.toDouble() ?? 0,
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AccountsOverviewImplToJson(
        _$AccountsOverviewImpl instance) =>
    <String, dynamic>{
      'total_balance': instance.totalBalance,
      'accounts': instance.accounts,
    };
