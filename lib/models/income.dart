import 'package:freezed_annotation/freezed_annotation.dart';

part 'income.freezed.dart';
part 'income.g.dart';

// ─── Income ───────────────────────────────────────────────────────────────────

@freezed
class Income with _$Income {
  const factory Income({
    required String id,
    required double amount,
    required String source,
    String? description,

    /// ID akun yang menerima pemasukan ini — WAJIB (Phase 4)
    @JsonKey(name: 'account_id') required String accountId,

    required DateTime date,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);
}

// ─── BudgetAllocation ─────────────────────────────────────────────────────────

/// Hasil alokasi satu kategori setelah income SALARY masuk
@freezed
class BudgetAllocation with _$BudgetAllocation {
  const factory BudgetAllocation({
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'allocated_amount') required double allocatedAmount,
    required double percentage,
  }) = _BudgetAllocation;

  factory BudgetAllocation.fromJson(Map<String, dynamic> json) =>
      _$BudgetAllocationFromJson(json);
}

// ─── IncomeCreateResult ───────────────────────────────────────────────────────

/// Response dari POST /incomes
@freezed
class IncomeCreateResult with _$IncomeCreateResult {
  const factory IncomeCreateResult({
    required Income income,
    @Default([]) List<BudgetAllocation> allocations,
    @JsonKey(name: 'already_allocated_warning') String? alreadyAllocatedWarning,
  }) = _IncomeCreateResult;

  factory IncomeCreateResult.fromJson(Map<String, dynamic> json) =>
      _$IncomeCreateResultFromJson(json);
}
