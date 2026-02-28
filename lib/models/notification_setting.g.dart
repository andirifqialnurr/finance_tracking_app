// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSettingImpl _$$NotificationSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      dayOfMonth: (json['day_of_month'] as num).toInt(),
      timeOfDay: json['time_of_day'] as String,
      isEnabled: json['is_enabled'] as bool? ?? true,
      onesignalPlayerId: json['onesignal_player_id'] as String? ?? '',
      lastSentAt: json['last_sent_at'] == null
          ? null
          : DateTime.parse(json['last_sent_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$NotificationSettingImplToJson(
        _$NotificationSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'day_of_month': instance.dayOfMonth,
      'time_of_day': instance.timeOfDay,
      'is_enabled': instance.isEnabled,
      'onesignal_player_id': instance.onesignalPlayerId,
      'last_sent_at': instance.lastSentAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
