import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/budget_repository.dart';
import '../models/budget.dart';

part 'budget_provider.g.dart';

// ─── Read-only providers ──────────────────────────────────────────────────────

@riverpod
Future<List<BudgetWithCategory>> budgets(
  BudgetsRef ref, {
  int? month,
  int? year,
}) {
  return ref
      .watch(budgetRepositoryProvider)
      .getBudgets(month: month, year: year);
}

@riverpod
Future<BudgetSummary> budgetSummary(
  BudgetSummaryRef ref, {
  int? month,
  int? year,
}) {
  return ref
      .watch(budgetRepositoryProvider)
      .getBudgetSummary(month: month, year: year);
}

@riverpod
Future<List<BudgetReallocation>> budgetReallocations(
  BudgetReallocationsRef ref, {
  int? month,
  int? year,
}) {
  return ref
      .watch(budgetRepositoryProvider)
      .getReallocations(month: month, year: year);
}

// ─── Mutable notifier ─────────────────────────────────────────────────────────

@riverpod
class BudgetNotifier extends _$BudgetNotifier {
  @override
  AsyncValue<BudgetReallocation?> build() => const AsyncValue.data(null);

  Future<BudgetReallocation> reallocate({
    required String fromCategoryId,
    required String toCategoryId,
    required double amount,
    int? month,
    int? year,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(budgetRepositoryProvider)
          .reallocate(
            fromCategoryId: fromCategoryId,
            toCategoryId: toCategoryId,
            amount: amount,
            month: month,
            year: year,
          );
      state = AsyncValue.data(result);
      ref.invalidate(budgetsProvider);
      ref.invalidate(budgetSummaryProvider);
      ref.invalidate(budgetReallocationsProvider);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
