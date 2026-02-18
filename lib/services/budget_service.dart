import '../models/budget.dart';
import 'api_client.dart';

/// Service untuk budget-related API calls
class BudgetService {
  final ApiClient _apiClient;

  BudgetService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  /// Get current month budget for all categories
  Future<List<BudgetWithCategory>> getCurrentBudgets() async {
    try {
      final response = await _apiClient.get('/budgets/current');

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => BudgetWithCategory.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch budgets: ${e.toString()}');
    }
  }

  /// Get budget for specific month and year
  Future<List<BudgetWithCategory>> getBudgetsByMonth({
    required String month,
    required int year,
  }) async {
    try {
      final response = await _apiClient.get(
        '/budgets',
        queryParams: {'month': month, 'year': year.toString()},
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => BudgetWithCategory.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch budgets: ${e.toString()}');
    }
  }

  /// Get budget for specific category
  Future<CategoryBudget> getCategoryBudget(String categoryId) async {
    try {
      final response = await _apiClient.get('/budgets/category/$categoryId');
      return CategoryBudget.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch category budget: ${e.toString()}');
    }
  }

  /// Get budget summary for current month
  Future<BudgetSummary> getBudgetSummary() async {
    try {
      final response = await _apiClient.get('/budgets/summary');
      return BudgetSummary.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch budget summary: ${e.toString()}');
    }
  }

  /// Get budget summary for specific month
  Future<BudgetSummary> getBudgetSummaryByMonth({
    required String month,
    required int year,
  }) async {
    try {
      final response = await _apiClient.get(
        '/budgets/summary',
        queryParams: {'month': month, 'year': year.toString()},
      );
      return BudgetSummary.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch budget summary: ${e.toString()}');
    }
  }

  /// Check remaining budget for a category
  Future<double> getRemainingBudget(String categoryId) async {
    try {
      final response = await _apiClient.get(
        '/budgets/category/$categoryId/remaining',
      );
      return (response['data']['remaining'] as num).toDouble();
    } catch (e) {
      throw Exception('Failed to fetch remaining budget: ${e.toString()}');
    }
  }

  /// Get budget history for a category
  Future<List<CategoryBudget>> getCategoryBudgetHistory({
    required String categoryId,
    int? limit,
  }) async {
    try {
      final queryParams = <String, String>{};
      if (limit != null) {
        queryParams['limit'] = limit.toString();
      }

      final response = await _apiClient.get(
        '/budgets/category/$categoryId/history',
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => CategoryBudget.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch budget history: ${e.toString()}');
    }
  }

  /// Validate if expense amount is within budget
  Future<bool> validateExpenseAgainstBudget({
    required String categoryId,
    required double amount,
  }) async {
    try {
      final response = await _apiClient.post(
        '/budgets/validate',
        body: {'categoryId': categoryId, 'amount': amount},
      );
      return response['data']['isValid'] as bool;
    } catch (e) {
      throw Exception('Failed to validate expense: ${e.toString()}');
    }
  }
}
