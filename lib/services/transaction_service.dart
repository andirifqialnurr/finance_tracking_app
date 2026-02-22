import '../core/constants/api_endpoints.dart';
import '../models/transaction.dart';
import 'api_client.dart';

/// Service for the combined transaction history endpoint.
/// Wraps GET /api/v1/transactions.
class TransactionService {
  final ApiClient _apiClient;

  TransactionService({ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  /// Fetch combined income + expense transaction history.
  ///
  /// Parameters (all optional):
  /// - [month]      : 1–12
  /// - [year]       : e.g. 2026
  /// - [startDate]  : YYYY-MM-DD
  /// - [endDate]    : YYYY-MM-DD
  /// - [type]       : 'income', 'expense', or 'all' (default)
  /// - [categoryId] : UUID – filters expenses by category
  /// - [page]       : pagination page (default 1)
  /// - [limit]      : items per page (default 20)
  /// - [sort]       : 'date_asc', 'date_desc', 'amount_asc', 'amount_desc'
  Future<TransactionPaginatedResponse> getTransactions({
    int? month,
    int? year,
    String? startDate,
    String? endDate,
    String? type,
    String? categoryId,
    int? page,
    int? limit,
    String? sort,
  }) async {
    try {
      final queryParams = <String, String>{};

      if (month != null) queryParams['month'] = month.toString();
      if (year != null) queryParams['year'] = year.toString();
      if (startDate != null) queryParams['start_date'] = startDate;
      if (endDate != null) queryParams['end_date'] = endDate;
      if (type != null && type.isNotEmpty) queryParams['type'] = type;
      if (categoryId != null && categoryId.isNotEmpty) {
        queryParams['category_id'] = categoryId;
      }
      if (page != null) queryParams['page'] = page.toString();
      if (limit != null) queryParams['limit'] = limit.toString();
      if (sort != null && sort.isNotEmpty) queryParams['sort'] = sort;

      final response = await _apiClient.get(
        ApiEndpoints.getTransactions,
        queryParams: queryParams.isEmpty ? null : queryParams,
      );

      return TransactionPaginatedResponse.fromJson(
        response as Map<String, dynamic>,
      );
    } catch (e) {
      throw ApiException('Failed to get transactions: ${e.toString()}');
    }
  }

  void dispose() {
    _apiClient.dispose();
  }
}
