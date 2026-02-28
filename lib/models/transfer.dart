import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer.freezed.dart';
part 'transfer.g.dart';

// ─── Transfer ─────────────────────────────────────────────────────────────────

@freezed
class Transfer with _$Transfer {
  const factory Transfer({
    required String id,
    @JsonKey(name: 'from_account_id') required String fromAccountId,
    @JsonKey(name: 'to_account_id') required String toAccountId,
    required double amount,
    String? note,
    @JsonKey(name: 'transfer_date') required DateTime transferDate,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Transfer;

  factory Transfer.fromJson(Map<String, dynamic> json) =>
      _$TransferFromJson(json);
}

// ─── TransferResult ───────────────────────────────────────────────────────────

/// Response dari POST /transfers — menyertakan saldo terbarukan kedua akun
@freezed
class TransferResult with _$TransferResult {
  const factory TransferResult({
    required Transfer transfer,
    @JsonKey(name: 'from_account_balance') required double fromAccountBalance,
    @JsonKey(name: 'to_account_balance') required double toAccountBalance,
  }) = _TransferResult;

  factory TransferResult.fromJson(Map<String, dynamic> json) =>
      _$TransferResultFromJson(json);
}
