import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/analytics.dart';
import '../core/network/dio_client.dart';

class AnalyticsRepository {
  final Dio _dio;
  AnalyticsRepository(this._dio);

  Future<SpendingPattern> getSpendingPattern(int month, int year) async {
    final res = await _dio.get(
      '/analytics/spending-pattern',
      queryParameters: {'month': month, 'year': year},
    );
    return SpendingPattern.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<List<CategoryComparison>> getCategoryComparison(
    int month,
    int year,
  ) async {
    final res = await _dio.get(
      '/analytics/category-comparison',
      queryParameters: {'month': month, 'year': year},
    );
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => CategoryComparison.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<TopSpendingCategory>> getTopSpending(
    int month,
    int year, {
    int limit = 5,
  }) async {
    final res = await _dio.get(
      '/analytics/top-spending',
      queryParameters: {'month': month, 'year': year, 'limit': limit},
    );
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => TopSpendingCategory.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BudgetPerformance> getBudgetPerformance(int month, int year) async {
    final res = await _dio.get(
      '/analytics/budget-performance',
      queryParameters: {'month': month, 'year': year},
    );
    return BudgetPerformance.fromJson(res.data['data'] as Map<String, dynamic>);
  }
}

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return AnalyticsRepository(ref.watch(dioProvider));
});
