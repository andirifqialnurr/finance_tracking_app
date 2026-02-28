// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_fund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduledFundImpl _$$ScheduledFundImplFromJson(Map<String, dynamic> json) =>
    _$ScheduledFundImpl(
      id: json['id'] as String,
      accountId: json['account_id'] as String,
      fromAccountId: json['from_account_id'] as String?,
      scheduleType: json['schedule_type'] as String,
      amount: (json['amount'] as num).toDouble(),
      dayOfMonth: (json['day_of_month'] as num).toInt(),
      description: json['description'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      lastExecutedAt: json['last_executed_at'] == null
          ? null
          : DateTime.parse(json['last_executed_at'] as String),
      nextExecuteAt: json['next_execute_at'] == null
          ? null
          : DateTime.parse(json['next_execute_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ScheduledFundImplToJson(_$ScheduledFundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'from_account_id': instance.fromAccountId,
      'schedule_type': instance.scheduleType,
      'amount': instance.amount,
      'day_of_month': instance.dayOfMonth,
      'description': instance.description,
      'is_active': instance.isActive,
      'last_executed_at': instance.lastExecutedAt?.toIso8601String(),
      'next_execute_at': instance.nextExecuteAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
