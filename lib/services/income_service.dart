import '../models/income.dart';
import 'api_client.dart';

/// Service untuk income-related API calls
class IncomeService {
  final ApiClient _apiClient;

  IncomeService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  /// Get all incomes with optional filters
  Future<List<Income>> getIncomes({String? month, int? year}) async {
    try {
      final queryParams = <String, String>{};
      if (month != null) queryParams['month'] = month;
      if (year != null) queryParams['year'] = year.toString();

      final response = await _apiClient.get(
        '/incomes',
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => Income.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch incomes: ${e.toString()}');
    }
  }

  /// Get income by ID
  Future<Income> getIncomeById(String id) async {
    try {
      final response = await _apiClient.get('/incomes/$id');
      return Income.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch income: ${e.toString()}');
    }
  }

  /// Get income with allocation details
  Future<IncomeWithAllocations> getIncomeWithAllocations(String id) async {
    try {
      final response = await _apiClient.get('/incomes/$id/allocations');
      return IncomeWithAllocations.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch income allocations: ${e.toString()}');
    }
  }

  /// Create new income
  Future<Income> createIncome({
    required String source,
    required double amount,
    required DateTime date,
    String? description,
  }) async {
    try {
      final body = {
        'source': source,
        'amount': amount,
        'date': date.toIso8601String(),
        if (description != null) 'description': description,
      };

      final response = await _apiClient.post('/incomes', body: body);
      return Income.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create income: ${e.toString()}');
    }
  }

  /// Update income
  Future<Income> updateIncome({
    required String id,
    String? source,
    double? amount,
    DateTime? date,
    String? description,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (source != null) body['source'] = source;
      if (amount != null) body['amount'] = amount;
      if (date != null) body['date'] = date.toIso8601String();
      if (description != null) body['description'] = description;

      final response = await _apiClient.put('/incomes/$id', body: body);
      return Income.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to update income: ${e.toString()}');
    }
  }

  /// Delete income
  Future<void> deleteIncome(String id) async {
    try {
      await _apiClient.delete('/incomes/$id');
    } catch (e) {
      throw Exception('Failed to delete income: ${e.toString()}');
    }
  }

  /// Get total income for period
  Future<double> getTotalIncome({String? month, int? year}) async {
    try {
      final queryParams = <String, String>{};
      if (month != null) queryParams['month'] = month;
      if (year != null) queryParams['year'] = year.toString();

      final response = await _apiClient.get(
        '/incomes/total',
        queryParams: queryParams,
      );

      return (response['data']['total'] as num).toDouble();
    } catch (e) {
      throw Exception('Failed to fetch total income: ${e.toString()}');
    }
  }
}
