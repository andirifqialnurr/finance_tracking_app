import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

// ─── BudgetAlert ────────────────────────────────────────────────────────────

@freezed
class BudgetAlert with _$BudgetAlert {
  const factory BudgetAlert({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'threshold_percentage') @Default(80) int thresholdPercentage,
    @JsonKey(name: 'is_enabled') @Default(true) bool isEnabled,
    @Default('active') String status,
    String? level,
    String? message,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'last_triggered') DateTime? lastTriggered,
  }) = _BudgetAlert;

  factory BudgetAlert.fromJson(Map<String, dynamic> json) =>
      _$BudgetAlertFromJson(json);
}
