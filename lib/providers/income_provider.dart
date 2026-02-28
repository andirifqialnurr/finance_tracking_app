import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/income_repository.dart';
import '../models/income.dart';
import '../core/error/failure.dart';
import 'account_provider.dart';
import 'statistics_provider.dart';

part 'income_provider.g.dart';

// ─── Income list provider ─────────────────────────────────────────────────────

@riverpod
Future<List<Income>> incomes(IncomesRef ref, {int? month, int? year}) {
  return ref
      .watch(incomeRepositoryProvider)
      .getIncomes(month: month, year: year);
}

// ─── Mutable notifier ─────────────────────────────────────────────────────────

@riverpod
class IncomeNotifier extends _$IncomeNotifier {
  @override
  AsyncValue<IncomeCreateResult?> build() => const AsyncValue.data(null);

  /// Creates income and returns result with budget allocations.
  /// [alreadyAllocatedWarning] in result is a soft warning shown as SnackBar.
  Future<IncomeCreateResult> createIncome({
    required double amount,
    required String source,
    required String accountId,
    String? description,
    required DateTime date,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(incomeRepositoryProvider)
          .createIncome(
            amount: amount,
            source: source,
            accountId: accountId,
            description: description,
            date: date,
          );
      state = AsyncValue.data(result);
      ref.invalidate(accountsProvider);
      ref.invalidate(overviewStatsProvider);
      return result;
    } on DioException catch (e) {
      final msg =
          e.response?.data?['error'] as String? ?? 'Gagal mencatat pemasukan';
      state = AsyncValue.error(ServerFailure(msg), StackTrace.current);
      rethrow;
    }
  }
}
