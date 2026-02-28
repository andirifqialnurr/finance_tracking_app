// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetAlertImpl _$$BudgetAlertImplFromJson(Map<String, dynamic> json) =>
    _$BudgetAlertImpl(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      thresholdPercentage:
          (json['threshold_percentage'] as num?)?.toInt() ?? 80,
      isEnabled: json['is_enabled'] as bool? ?? true,
      status: json['status'] as String? ?? 'active',
      level: json['level'] as String?,
      message: json['message'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastTriggered: json['last_triggered'] == null
          ? null
          : DateTime.parse(json['last_triggered'] as String),
    );

Map<String, dynamic> _$$BudgetAlertImplToJson(_$BudgetAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'threshold_percentage': instance.thresholdPercentage,
      'is_enabled': instance.isEnabled,
      'status': instance.status,
      'level': instance.level,
      'message': instance.message,
      'created_at': instance.createdAt.toIso8601String(),
      'last_triggered': instance.lastTriggered?.toIso8601String(),
    };
