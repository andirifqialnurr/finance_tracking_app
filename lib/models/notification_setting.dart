import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_setting.freezed.dart';
part 'notification_setting.g.dart';

// ─── NotificationSetting ──────────────────────────────────────────────────────

/// type values: ALLOCATION_REMINDER | BUDGET_ALERT | SAVINGS_GOAL | SCHEDULED_FUND
@freezed
class NotificationSetting with _$NotificationSetting {
  const factory NotificationSetting({
    required String id,
    required String type,
    required String title,
    required String body,
    @JsonKey(name: 'day_of_month') required int dayOfMonth,
    @JsonKey(name: 'time_of_day') required String timeOfDay,
    @JsonKey(name: 'is_enabled') @Default(true) bool isEnabled,
    @JsonKey(name: 'onesignal_player_id') @Default('') String onesignalPlayerId,
    @JsonKey(name: 'last_sent_at') DateTime? lastSentAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _NotificationSetting;

  factory NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingFromJson(json);
}
