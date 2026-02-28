import 'package:flutter/foundation.dart';
import '../models/income.dart';
import 'api_client.dart';

/// Service untuk income-related API calls
class IncomeService {
  final ApiClient _apiClient;

  IncomeService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  /// Get all incomes with optional filters
  ///
  /// Query params match backend:
  /// - month, year: filter by period
  /// - page, limit: pagination (default: page=1, limit=20)
  /// - sort: date_asc, date_desc, amount_asc, amount_desc
  /// - source: partial match filter
  Future<List<Income>> getIncomes({
    int? month,
    int? year,
    int page = 1,
    int limit = 20,
    String sort = 'date_desc',
    String? source,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'limit': limit.toString(),
        'sort': sort,
      };
      if (month != null) queryParams['month'] = month.toString();
      if (year != null) queryParams['year'] = year.toString();
      if (source != null && source.isNotEmpty) queryParams['source'] = source;

      final response = await _apiClient.get(
        '/incomes',
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] ?? [];
      return data
          .map((e) => Income.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch incomes: ${e.toString()}');
    }
  }

  /// Get income by ID (includes allocations in response)
  Future<Income> getIncomeById(String id) async {
    try {
      final response = await _apiClient.get('/incomes/$id');
      return Income.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch income: ${e.toString()}');
    }
  }

  /// Get income detail with allocation breakdown
  /// Backend returns allocations embedded in the detail response
  Future<Income> getIncomeWithAllocations(String id) async {
    try {
      final response = await _apiClient.get('/incomes/$id');
      return Income.fromJson(response['data']);
    } catch (e) {
      throw Exception(
        'Failed to fetch income with allocations: ${e.toString()}',
      );
    }
  }

  /// Create new income
  /// Returns income + auto-allocation breakdown
  Future<IncomeCreateResult> createIncome({
    required String source,
    required double amount,
    required DateTime date,
    String? description,
  }) async {
    try {
      final body = <String, dynamic>{
        'source': source,
        'amount': amount,
        'date': date.toUtc().toIso8601String(),
      };
      if (description != null && description.isNotEmpty) {
        body['description'] = description;
      }

      final response = await _apiClient.post('/incomes', body: body);
      debugPrint('[IncomeService] createIncome response: $response');

      final data = response['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw Exception('Unexpected response: missing data field');
      }
      return IncomeCreateResult.fromJson(data);
    } catch (e) {
      debugPrint('[IncomeService] createIncome error: $e');
      throw Exception('Failed to create income: ${e.toString()}');
    }
  }

  /// Update income — uses PATCH (not PUT)
  /// Server will re-calculate allocations if amount changes
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
      if (date != null) body['date'] = date.toUtc().toIso8601String();
      if (description != null) body['description'] = description;

      final response = await _apiClient.patch('/incomes/$id', body: body);
      return Income.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to update income: ${e.toString()}');
    }
  }

  /// Delete income — soft delete + rollback allocations
  Future<void> deleteIncome(String id) async {
    try {
      await _apiClient.delete('/incomes/$id');
    } catch (e) {
      throw Exception('Failed to delete income: ${e.toString()}');
    }
  }
}
