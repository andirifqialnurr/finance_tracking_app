import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/analytics_repository.dart';
import '../models/analytics.dart';

part 'analytics_provider.g.dart';

@riverpod
Future<SpendingPattern> spendingPattern(
  SpendingPatternRef ref,
  int month,
  int year,
) {
  return ref.watch(analyticsRepositoryProvider).getSpendingPattern(month, year);
}

@riverpod
Future<List<CategoryComparison>> categoryComparison(
  CategoryComparisonRef ref,
  int month,
  int year,
) {
  return ref
      .watch(analyticsRepositoryProvider)
      .getCategoryComparison(month, year);
}

@riverpod
Future<List<TopSpendingCategory>> topSpending(
  TopSpendingRef ref,
  int month,
  int year, {
  int limit = 5,
}) {
  return ref
      .watch(analyticsRepositoryProvider)
      .getTopSpending(month, year, limit: limit);
}

@riverpod
Future<BudgetPerformance> budgetPerformance(
  BudgetPerformanceRef ref,
  int month,
  int year,
) {
  return ref
      .watch(analyticsRepositoryProvider)
      .getBudgetPerformance(month, year);
}
