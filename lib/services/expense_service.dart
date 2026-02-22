import '../models/expense.dart';
import 'api_client.dart';

/// Service untuk expense-related API calls
class ExpenseService {
  final ApiClient _apiClient;

  ExpenseService({ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  /// Get all expenses with optional filters
  ///
  /// Query params match backend:
  /// - category_id, month, year: context filters
  /// - start_date, end_date: flexible date range (YYYY-MM-DD)
  /// - min_amount, max_amount: amount range filter
  /// - search: description partial match
  /// - page, limit: pagination
  /// - sort: date_asc, date_desc, amount_asc, amount_desc
  Future<ExpensePaginatedResponse> getExpenses({
    String? categoryId,
    int? month,
    int? year,
    String? startDate,
    String? endDate,
    double? minAmount,
    double? maxAmount,
    String? search,
    int page = 1,
    int limit = 20,
    String sort = 'date_desc',
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'limit': limit.toString(),
        'sort': sort,
      };
      if (categoryId != null && categoryId.isNotEmpty) {
        queryParams['category_id'] = categoryId;
      }
      if (month != null) queryParams['month'] = month.toString();
      if (year != null) queryParams['year'] = year.toString();
      if (startDate != null) queryParams['start_date'] = startDate;
      if (endDate != null) queryParams['end_date'] = endDate;
      if (minAmount != null) queryParams['min_amount'] = minAmount.toString();
      if (maxAmount != null) queryParams['max_amount'] = maxAmount.toString();
      if (search != null && search.isNotEmpty) queryParams['search'] = search;

      final response = await _apiClient.get(
        '/expenses',
        queryParams: queryParams,
      );

      return ExpensePaginatedResponse.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch expenses: ${e.toString()}');
    }
  }

  /// Get expense by ID (returns full category object embedded)
  Future<Expense> getExpenseById(String id) async {
    try {
      final response = await _apiClient.get('/expenses/$id');
      return Expense.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch expense: ${e.toString()}');
    }
  }

  /// Create new expense
  /// Returns expense + updated budget remaining + optional alert
  Future<ExpenseCreateResponse> createExpense({
    required String categoryId,
    required double amount,
    required DateTime date,
    String? description,
  }) async {
    try {
      final body = <String, dynamic>{
        'category_id': categoryId,
        'amount': amount,
        'date': date.toUtc().toIso8601String(),
      };
      if (description != null && description.isNotEmpty) {
        body['description'] = description;
      }

      final response = await _apiClient.post('/expenses', body: body);
      return ExpenseCreateResponse.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create expense: ${e.toString()}');
    }
  }

  /// Update expense — uses PATCH (not PUT)
  /// Supports changing category, amount adjusted in budget accordingly
  Future<Expense> updateExpense({
    required String id,
    String? categoryId,
    double? amount,
    DateTime? date,
    String? description,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (categoryId != null) body['category_id'] = categoryId;
      if (amount != null) body['amount'] = amount;
      if (date != null) body['date'] = date.toUtc().toIso8601String();
      if (description != null) body['description'] = description;

      final response = await _apiClient.patch('/expenses/$id', body: body);
      return Expense.fromJson(response['data']['expense'] ?? response['data']);
    } catch (e) {
      throw Exception('Failed to update expense: ${e.toString()}');
    }
  }

  /// Delete expense — soft delete + restore budget
  Future<void> deleteExpense(String id) async {
    try {
      await _apiClient.delete('/expenses/$id');
    } catch (e) {
      throw Exception('Failed to delete expense: ${e.toString()}');
    }
  }
}
