import 'package:freezed_annotation/freezed_annotation.dart';
import 'expense_category.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

// ─── Transaction ─────────────────────────────────────────────────────────────

/// Unified transaction item — income, expense, atau transfer
@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String type,
    required double amount,
    required DateTime date,
    String? description,

    /// Untuk type='income' atau type='transfer'
    String? source,

    /// Untuk type='expense': detail kategori
    ExpenseCategory? category,

    /// ID akun terkait (Phase 4)
    @JsonKey(name: 'account_id') String? accountId,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

// ─── TransactionSummary ───────────────────────────────────────────────────────

@freezed
class TransactionSummary with _$TransactionSummary {
  const factory TransactionSummary({
    @JsonKey(name: 'total_income') @Default(0) double totalIncome,
    @JsonKey(name: 'total_expense') @Default(0) double totalExpense,
    @JsonKey(name: 'net_balance') @Default(0) double netBalance,
  }) = _TransactionSummary;

  factory TransactionSummary.fromJson(Map<String, dynamic> json) =>
      _$TransactionSummaryFromJson(json);
}
