import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheduled_fund.freezed.dart';
part 'scheduled_fund.g.dart';

// ─── ScheduledFund ────────────────────────────────────────────────────────────

/// schedule_type values: TOP_UP | TRANSFER
@freezed
class ScheduledFund with _$ScheduledFund {
  const factory ScheduledFund({
    required String id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'from_account_id') String? fromAccountId,
    @JsonKey(name: 'schedule_type') required String scheduleType,
    required double amount,
    @JsonKey(name: 'day_of_month') required int dayOfMonth,
    String? description,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'last_executed_at') DateTime? lastExecutedAt,
    @JsonKey(name: 'next_execute_at') DateTime? nextExecuteAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ScheduledFund;

  factory ScheduledFund.fromJson(Map<String, dynamic> json) =>
      _$ScheduledFundFromJson(json);
}
