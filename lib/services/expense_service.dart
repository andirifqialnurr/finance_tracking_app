import '../models/expense.dart';
import 'api_client.dart';

/// Service untuk expense-related API calls
class ExpenseService {
  final ApiClient _apiClient;

  ExpenseService({ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  /// Get all expenses with optional filters
  Future<List<Expense>> getExpenses({
    String? categoryId,
    String? month,
    int? year,
  }) async {
    try {
      final queryParams = <String, String>{};
      if (categoryId != null) queryParams['categoryId'] = categoryId;
      if (month != null) queryParams['month'] = month;
      if (year != null) queryParams['year'] = year.toString();

      final response = await _apiClient.get(
        '/expenses',
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => Expense.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch expenses: ${e.toString()}');
    }
  }

  /// Get expense by ID
  Future<Expense> getExpenseById(String id) async {
    try {
      final response = await _apiClient.get('/expenses/$id');
      return Expense.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch expense: ${e.toString()}');
    }
  }

  /// Create new expense
  Future<Expense> createExpense({
    required String categoryId,
    required double amount,
    required DateTime date,
    String? description,
  }) async {
    try {
      final body = {
        'categoryId': categoryId,
        'amount': amount,
        'date': date.toIso8601String(),
        if (description != null) 'description': description,
      };

      final response = await _apiClient.post('/expenses', body: body);
      return Expense.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create expense: ${e.toString()}');
    }
  }

  /// Update expense
  Future<Expense> updateExpense({
    required String id,
    String? categoryId,
    double? amount,
    DateTime? date,
    String? description,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (categoryId != null) body['categoryId'] = categoryId;
      if (amount != null) body['amount'] = amount;
      if (date != null) body['date'] = date.toIso8601String();
      if (description != null) body['description'] = description;

      final response = await _apiClient.put('/expenses/$id', body: body);
      return Expense.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to update expense: ${e.toString()}');
    }
  }

  /// Delete expense
  Future<void> deleteExpense(String id) async {
    try {
      await _apiClient.delete('/expenses/$id');
    } catch (e) {
      throw Exception('Failed to delete expense: ${e.toString()}');
    }
  }

  /// Get total expenses for period
  Future<double> getTotalExpenses({
    String? categoryId,
    String? month,
    int? year,
  }) async {
    try {
      final queryParams = <String, String>{};
      if (categoryId != null) queryParams['categoryId'] = categoryId;
      if (month != null) queryParams['month'] = month;
      if (year != null) queryParams['year'] = year.toString();

      final response = await _apiClient.get(
        '/expenses/total',
        queryParams: queryParams,
      );

      return (response['data']['total'] as num).toDouble();
    } catch (e) {
      throw Exception('Failed to fetch total expenses: ${e.toString()}');
    }
  }

  /// Search expenses by description
  Future<List<Expense>> searchExpenses(String query) async {
    try {
      final response = await _apiClient.get(
        '/expenses/search',
        queryParams: {'q': query},
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => Expense.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search expenses: ${e.toString()}');
    }
  }
}
