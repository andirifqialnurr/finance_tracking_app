import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

// ─── Expense ──────────────────────────────────────────────────────────────────

@freezed
class Expense with _$Expense {
  const factory Expense({
    required String id,
    required double amount,
    required String description,

    /// ID kategori pengeluaran
    @JsonKey(name: 'category_id') required String categoryId,

    /// ID akun sumber dana — WAJIB (Phase 4)
    @JsonKey(name: 'account_id') required String accountId,

    required DateTime date,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}

// ─── ExpenseCreateResult ──────────────────────────────────────────────────────

/// Response dari POST /expenses
/// - budgetWarning: SOFT warning jika budget terlampaui / belum ada budget
///   (transaksi TETAP berhasil — HTTP 200)
@freezed
class ExpenseCreateResult with _$ExpenseCreateResult {
  const factory ExpenseCreateResult({
    required Expense expense,

    /// null → tidak ada warning. Tampilkan SnackBar oranye jika tidak null.
    @JsonKey(name: 'budget_warning') String? budgetWarning,
  }) = _ExpenseCreateResult;

  factory ExpenseCreateResult.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCreateResultFromJson(json);
}
