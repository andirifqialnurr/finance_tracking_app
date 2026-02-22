import '../core/constants/api_endpoints.dart';
import '../models/alert.dart';
import 'api_client.dart';

class AlertService {
  final ApiClient _apiClient;

  AlertService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  /// Get all budget alerts
  ///
  /// [status] - Optional filter: "active" / "all"
  /// [month], [year] - Optional period filter
  ///
  /// Note: GET /alerts/:id does NOT exist — use this list endpoint with filters.
  Future<List<BudgetAlert>> getAlerts({
    String? status,
    int? month,
    int? year,
  }) async {
    try {
      final queryParams = <String, String>{};
      if (status != null && status.isNotEmpty && status != 'all') {
        queryParams['status'] = status;
      }
      if (month != null) queryParams['month'] = month.toString();
      if (year != null) queryParams['year'] = year.toString();

      final response = await _apiClient.get(
        ApiEndpoints.getAlerts,
        queryParams: queryParams.isNotEmpty ? queryParams : null,
      );

      final List<dynamic> data = response['data'] as List<dynamic>;
      return data
          .map((json) => BudgetAlert.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException('Failed to get alerts: ${e.toString()}');
    }
  }

  /// Create a new budget alert
  ///
  /// Body: { category_id, threshold_percentage, is_enabled }
  Future<BudgetAlert> createAlert(CreateAlertRequest request) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.createAlert,
        body: request.toJson(),
      );

      return BudgetAlert.fromJson(response['data'] as Map<String, dynamic>);
    } catch (e) {
      throw ApiException('Failed to create alert: ${e.toString()}');
    }
  }

  /// Update an existing alert — uses PATCH (not PUT)
  ///
  /// Body: { threshold_percentage?, is_enabled? }
  Future<BudgetAlert> updateAlert(String id, UpdateAlertRequest request) async {
    try {
      final response = await _apiClient.patch(
        ApiEndpoints.updateAlert(id),
        body: request.toJson(),
      );

      return BudgetAlert.fromJson(response['data'] as Map<String, dynamic>);
    } catch (e) {
      throw ApiException('Failed to update alert: ${e.toString()}');
    }
  }

  /// Delete an alert
  Future<void> deleteAlert(String id) async {
    try {
      await _apiClient.delete(ApiEndpoints.deleteAlert(id));
    } catch (e) {
      throw ApiException('Failed to delete alert: ${e.toString()}');
    }
  }

  /// Disable an alert (set is_enabled = false)
  Future<BudgetAlert> disableAlert(String id) async {
    return updateAlert(id, UpdateAlertRequest(isEnabled: false));
  }

  /// Enable an alert (set is_enabled = true)
  Future<BudgetAlert> enableAlert(String id) async {
    return updateAlert(id, UpdateAlertRequest(isEnabled: true));
  }

  void dispose() {
    _apiClient.dispose();
  }
}
