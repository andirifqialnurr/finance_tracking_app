import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/budget.dart';
import '../core/network/dio_client.dart';

class BudgetRepository {
  final Dio _dio;
  BudgetRepository(this._dio);

  Future<List<BudgetWithCategory>> getBudgets({int? month, int? year}) async {
    final res = await _dio.get(
      '/budgets',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => BudgetWithCategory.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BudgetSummary> getBudgetSummary({int? month, int? year}) async {
    final res = await _dio.get(
      '/budgets/summary',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    return BudgetSummary.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<BudgetReallocation> reallocate({
    required String fromCategoryId,
    required String toCategoryId,
    required double amount,
    int? month,
    int? year,
  }) async {
    final res = await _dio.post(
      '/budgets/reallocate',
      data: {
        'from_category_id': fromCategoryId,
        'to_category_id': toCategoryId,
        'amount': amount,
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    return BudgetReallocation.fromJson(
      res.data['data'] as Map<String, dynamic>,
    );
  }

  Future<List<BudgetReallocation>> getReallocations({
    int? month,
    int? year,
  }) async {
    final res = await _dio.get(
      '/budgets/reallocations',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => BudgetReallocation.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  return BudgetRepository(ref.watch(dioProvider));
});
