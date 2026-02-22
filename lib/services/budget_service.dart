import '../models/budget.dart';
import 'api_client.dart';

/// Service untuk budget-related API calls
class BudgetService {
  final ApiClient _apiClient;

  BudgetService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  /// Get budget status per category for a specific month & year
  ///
  /// GET /budgets?month=2&year=2026
  Future<List<BudgetWithCategory>> getBudgets({
    required int month,
    required int year,
  }) async {
    try {
      final response = await _apiClient.get(
        '/budgets',
        queryParams: {'month': month.toString(), 'year': year.toString()},
      );

      final List<dynamic> data = response['data'] ?? [];
      return data
          .map(
            (json) => BudgetWithCategory.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch budgets: ${e.toString()}');
    }
  }

  /// Get budget summary (totals) for a specific month & year
  ///
  /// GET /budgets/summary?month=2&year=2026
  Future<BudgetSummary> getBudgetSummary({
    required int month,
    required int year,
  }) async {
    try {
      final response = await _apiClient.get(
        '/budgets/summary',
        queryParams: {'month': month.toString(), 'year': year.toString()},
      );
      return BudgetSummary.fromJson(response['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch budget summary: ${e.toString()}');
    }
  }

  /// Manually reallocate budget from one category to another
  ///
  /// POST /budgets/reallocate
  Future<BudgetReallocation> reallocateBudget({
    required String fromCategoryId,
    required String toCategoryId,
    required double amount,
    String? reason,
  }) async {
    try {
      final body = <String, dynamic>{
        'from_category_id': fromCategoryId,
        'to_category_id': toCategoryId,
        'amount': amount,
        if (reason != null && reason.isNotEmpty) 'reason': reason,
      };

      final response = await _apiClient.post('/budgets/reallocate', body: body);
      return BudgetReallocation.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to reallocate budget: ${e.toString()}');
    }
  }

  /// Get history of budget reallocations for a specific month & year
  ///
  /// GET /budgets/reallocations?month=2&year=2026
  Future<List<BudgetReallocation>> getReallocations({
    required int month,
    required int year,
  }) async {
    try {
      final response = await _apiClient.get(
        '/budgets/reallocations',
        queryParams: {'month': month.toString(), 'year': year.toString()},
      );

      final List<dynamic> data = response['data'] ?? [];
      return data
          .map(
            (json) => BudgetReallocation.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch budget reallocations: ${e.toString()}');
    }
  }

  /// Cancel / delete a budget reallocation
  ///
  /// DELETE /budgets/reallocate/:id
  Future<void> cancelReallocation(String id) async {
    try {
      await _apiClient.delete('/budgets/reallocate/$id');
    } catch (e) {
      throw Exception('Failed to cancel reallocation: ${e.toString()}');
    }
  }
}
