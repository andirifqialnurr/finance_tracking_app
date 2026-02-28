import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

// ─── Enums ────────────────────────────────────────────────────────────────────

enum AccountType {
  @JsonValue('CARD')
  card,
  @JsonValue('CASH')
  cash,
  @JsonValue('SAVINGS')
  savings,
}

const cardIncomeTypeSalary = 'SALARY';
const cardIncomeTypeProject = 'PROJECT';
const cardIncomeTypeFreelance = 'FREELANCE';
const cardIncomeTypeBusiness = 'BUSINESS';
const cardIncomeTypeOther = 'OTHER';

// ─── Account ──────────────────────────────────────────────────────────────────

@freezed
class Account with _$Account {
  const factory Account({
    required String id,
    required String name,
    required AccountType type,
    required double balance,

    /// Hanya untuk type=CARD: "SALARY" | "PROJECT" | "FREELANCE" | "BUSINESS" | "OTHER"
    @JsonKey(name: 'income_type') String? incomeType,

    /// Hanya untuk type=SAVINGS: target saldo
    @JsonKey(name: 'goal_amount') double? goalAmount,

    /// Hanya untuk type=SAVINGS: label tujuan
    @JsonKey(name: 'goal_label') String? goalLabel,

    /// Hex color (#4CAF50)
    String? color,
    String? description,

    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

// ─── AccountSummary ───────────────────────────────────────────────────────────

@freezed
class AccountSummary with _$AccountSummary {
  const factory AccountSummary({
    required Account account,
    @JsonKey(name: 'total_income') @Default(0) double totalIncome,
    @JsonKey(name: 'total_expense') @Default(0) double totalExpense,
    @JsonKey(name: 'total_transfer_in') @Default(0) double totalTransferIn,
    @JsonKey(name: 'total_transfer_out') @Default(0) double totalTransferOut,
    @JsonKey(name: 'net_flow') @Default(0) double netFlow,
  }) = _AccountSummary;

  factory AccountSummary.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryFromJson(json);
}

// ─── AccountsOverview ─────────────────────────────────────────────────────────

@freezed
class AccountsOverview with _$AccountsOverview {
  const factory AccountsOverview({
    @JsonKey(name: 'total_balance') @Default(0) double totalBalance,
    @Default([]) List<Account> accounts,
  }) = _AccountsOverview;

  factory AccountsOverview.fromJson(Map<String, dynamic> json) =>
      _$AccountsOverviewFromJson(json);
}
