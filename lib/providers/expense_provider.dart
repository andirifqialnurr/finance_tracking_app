import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/expense_repository.dart';
import '../models/expense.dart';
import '../core/error/failure.dart';
import 'account_provider.dart';
import 'statistics_provider.dart';

part 'expense_provider.g.dart';

// ─── Expense list provider ────────────────────────────────────────────────────

@riverpod
Future<List<Expense>> expenses(ExpensesRef ref, {int? month, int? year}) {
  return ref
      .watch(expenseRepositoryProvider)
      .getExpenses(month: month, year: year);
}

// ─── Mutable notifier ─────────────────────────────────────────────────────────

@riverpod
class ExpenseNotifier extends _$ExpenseNotifier {
  @override
  AsyncValue<ExpenseCreateResult?> build() => const AsyncValue.data(null);

  Future<ExpenseCreateResult> createExpense({
    required double amount,
    required String description,
    required String categoryId,
    required String accountId,
    required DateTime date,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(expenseRepositoryProvider)
          .createExpense(
            amount: amount,
            description: description,
            categoryId: categoryId,
            accountId: accountId,
            date: date,
          );
      state = AsyncValue.data(result);
      ref.invalidate(accountsProvider);
      ref.invalidate(overviewStatsProvider);
      return result;
    } on DioException catch (e) {
      final msg =
          e.response?.data?['error'] as String? ?? 'Gagal mencatat pengeluaran';
      state = AsyncValue.error(ServerFailure(msg), StackTrace.current);
      rethrow;
    }
  }

  Future<void> deleteExpense(String id) async {
    await ref.read(expenseRepositoryProvider).deleteExpense(id);
    ref.invalidate(accountsProvider);
    ref.invalidate(overviewStatsProvider);
  }
}
