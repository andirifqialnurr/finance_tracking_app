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
  /// [categoryId] - Optional category ID to filter by specific category
  /// [period] - Period in months (3, 6, or 12). Default: 6
  Future<List<SpendingPattern>> getSpendingPattern({
    required int month,
    required int year,
    String? categoryId,
    int period = 6,
  }) async {
    try {
      final queryParams = {
        'month': month.toString(),
        'year': year.toString(),
        'period': period.toString(),
      };

      if (categoryId != null && categoryId.isNotEmpty) {
        queryParams['category_id'] = categoryId;
      }

      final response = await _apiClient.get(
        ApiEndpoints.getSpendingPattern,
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] as List<dynamic>;
      return data
          .map((json) => SpendingPattern.fromJson(json as Map<String, dynamic>))
          .toList();
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

  /// Get top spending categories for a date range
  ///
  /// [startDate] - Start date (YYYY-MM-DD)
  /// [endDate] - End date (YYYY-MM-DD)
  /// [limit] - Number of top categories to return. Default: 5
  Future<TopSpending> getTopSpending({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 5,
  }) async {
    try {
      final queryParams = {
        'start_date': startDate.toIso8601String().split('T')[0],
        'end_date': endDate.toIso8601String().split('T')[0],
        'limit': limit.toString(),
      };

      final response = await _apiClient.get(
        ApiEndpoints.getTopSpending,
        queryParams: queryParams,
      );

      return TopSpending.fromJson(response['data'] as Map<String, dynamic>);
    } catch (e) {
      throw ApiException('Failed to get top spending: ${e.toString()}');
    }
  }

  /// Get budget performance for a specific year
  ///
  /// [year] - Year to analyze
  Future<BudgetPerformance> getBudgetPerformance({required int year}) async {
    try {
      final queryParams = {'year': year.toString()};

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
