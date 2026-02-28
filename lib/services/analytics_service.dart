import '../core/constants/api_endpoints.dart';
import '../models/analytics.dart';
import 'api_client.dart';

class AnalyticsService {
  final ApiClient _apiClient;

  AnalyticsService({ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  /// Get spending pattern for a specific period
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  Future<SpendingPattern> getSpendingPattern({
    required int month,
    required int year,
  }) async {
    try {
      final queryParams = {'month': month.toString(), 'year': year.toString()};

      final response = await _apiClient.get(
        ApiEndpoints.getSpendingPattern,
        queryParams: queryParams,
      );

      return SpendingPattern.fromJson(response['data'] as Map<String, dynamic>);
    } catch (e) {
      throw ApiException('Failed to get spending pattern: ${e.toString()}');
    }
  }

  /// Get category comparison between current and previous month
  ///
  /// [month] - Month to compare (1-12)
  /// [year] - Year
  Future<List<CategoryComparison>> getCategoryComparison({
    required int month,
    required int year,
  }) async {
    try {
      final queryParams = {'month': month.toString(), 'year': year.toString()};

      final response = await _apiClient.get(
        ApiEndpoints.getCategoryComparison,
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] as List<dynamic>;
      return data
          .map(
            (json) => CategoryComparison.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw ApiException('Failed to get category comparison: ${e.toString()}');
    }
  }

  /// Get top spending categories for a month
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  /// [limit] - Number of top categories to return. Default: 5
  Future<List<TopSpendingCategory>> getTopSpending({
    required int month,
    required int year,
    int limit = 5,
  }) async {
    try {
      final queryParams = {
        'month': month.toString(),
        'year': year.toString(),
        'limit': limit.toString(),
      };

      final response = await _apiClient.get(
        ApiEndpoints.getTopSpending,
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] as List<dynamic>;
      return data
          .map(
            (json) =>
                TopSpendingCategory.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw ApiException('Failed to get top spending: ${e.toString()}');
    }
  }

  /// Get budget performance for a specific month and year
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  Future<BudgetPerformance> getBudgetPerformance({
    required int month,
    required int year,
  }) async {
    try {
      final queryParams = {'month': month.toString(), 'year': year.toString()};

      final response = await _apiClient.get(
        ApiEndpoints.getBudgetPerformance,
        queryParams: queryParams,
      );

      return BudgetPerformance.fromJson(
        response['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw ApiException('Failed to get budget performance: ${e.toString()}');
    }
  }

  void dispose() {
    _apiClient.dispose();
  }
}
