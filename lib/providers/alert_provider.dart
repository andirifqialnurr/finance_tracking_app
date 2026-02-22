import 'package:flutter/foundation.dart';
import '../models/alert.dart';
import '../services/alert_service.dart';
import '../services/api_client.dart';

/// Provider for Alerts Screen
/// Manages budget alerts with CRUD operations
class AlertProvider with ChangeNotifier {
  final AlertService _alertService;

  AlertProvider({AlertService? alertService})
    : _alertService = alertService ?? AlertService();

  // Loading states
  bool _isLoadingAlerts = false;
  bool _isCreating = false;
  bool _isUpdating = false;
  bool _isDeleting = false;

  // Data
  List<BudgetAlert> _alerts = [];
  BudgetAlert? _selectedAlert;

  // Errors
  String? _alertsError;
  String? _createError;
  String? _updateError;
  String? _deleteError;

  // Success messages
  String? _createSuccess;
  String? _updateSuccess;
  String? _deleteSuccess;

  // Getters - Loading States
  bool get isLoadingAlerts => _isLoadingAlerts;
  bool get isCreating => _isCreating;
  bool get isUpdating => _isUpdating;
  bool get isDeleting => _isDeleting;
  bool get isLoading =>
      _isLoadingAlerts || _isCreating || _isUpdating || _isDeleting;

  // Getters - Data
  List<BudgetAlert> get alerts => _alerts;
  BudgetAlert? get selectedAlert => _selectedAlert;

  // Getters - Errors
  String? get alertsError => _alertsError;
  String? get createError => _createError;
  String? get updateError => _updateError;
  String? get deleteError => _deleteError;

  // Getters - Success
  String? get createSuccess => _createSuccess;
  String? get updateSuccess => _updateSuccess;
  String? get deleteSuccess => _deleteSuccess;

  /// Fetch all alerts with optional filters
  ///
  /// [status] - Filter by status ('active', 'triggered', 'resolved')
  /// [month] - Filter by month (1-12)
  /// [year]  - Filter by year (e.g. 2026)
  Future<void> fetchAlerts({String? status, int? month, int? year}) async {
    _isLoadingAlerts = true;
    _alertsError = null;
    notifyListeners();

    try {
      _alerts = await _alertService.getAlerts(
        status: status,
        month: month,
        year: year,
      );
      _alertsError = null;
    } on ApiException catch (e) {
      _alertsError = e.message;
      _alerts = [];
    } catch (e) {
      _alertsError = 'Failed to load alerts: $e';
      _alerts = [];
    } finally {
      _isLoadingAlerts = false;
      notifyListeners();
    }
  }

  /// Create new alert
  ///
  /// [request] - CreateAlertRequest with alert details
  Future<bool> createAlert(CreateAlertRequest request) async {
    _isCreating = true;
    _createError = null;
    _createSuccess = null;
    notifyListeners();

    try {
      final newAlert = await _alertService.createAlert(request);
      _alerts.insert(0, newAlert); // Add to beginning of list
      _createSuccess = 'Alert created successfully!';
      _createError = null;
      return true;
    } on ApiException catch (e) {
      _createError = e.message;
      _createSuccess = null;
      return false;
    } catch (e) {
      _createError = 'Failed to create alert: $e';
      _createSuccess = null;
      return false;
    } finally {
      _isCreating = false;
      notifyListeners();
    }
  }

  /// Update alert
  ///
  /// [id] - Alert ID
  /// [request] - UpdateAlertRequest with updated fields
  Future<bool> updateAlert(String id, UpdateAlertRequest request) async {
    _isUpdating = true;
    _updateError = null;
    _updateSuccess = null;
    notifyListeners();

    try {
      final updatedAlert = await _alertService.updateAlert(id, request);

      // Update in list
      final index = _alerts.indexWhere((a) => a.id == id);
      if (index != -1) {
        _alerts[index] = updatedAlert;
      }

      // Update selected if it's the same
      if (_selectedAlert?.id == id) {
        _selectedAlert = updatedAlert;
      }

      _updateSuccess = 'Alert updated successfully!';
      _updateError = null;
      return true;
    } on ApiException catch (e) {
      _updateError = e.message;
      _updateSuccess = null;
      return false;
    } catch (e) {
      _updateError = 'Failed to update alert: $e';
      _updateSuccess = null;
      return false;
    } finally {
      _isUpdating = false;
      notifyListeners();
    }
  }

  /// Delete alert
  ///
  /// [id] - Alert ID
  Future<bool> deleteAlert(String id) async {
    _isDeleting = true;
    _deleteError = null;
    _deleteSuccess = null;
    notifyListeners();

    try {
      await _alertService.deleteAlert(id);

      // Remove from list
      _alerts.removeWhere((a) => a.id == id);

      // Clear selected if it's the same
      if (_selectedAlert?.id == id) {
        _selectedAlert = null;
      }

      _deleteSuccess = 'Alert deleted successfully!';
      _deleteError = null;
      return true;
    } on ApiException catch (e) {
      _deleteError = e.message;
      _deleteSuccess = null;
      return false;
    } catch (e) {
      _deleteError = 'Failed to delete alert: $e';
      _deleteSuccess = null;
      return false;
    } finally {
      _isDeleting = false;
      notifyListeners();
    }
  }

  /// Disable alert (convenience method)
  ///
  /// [id] - Alert ID
  Future<bool> disableAlert(String id) async {
    return await updateAlert(id, UpdateAlertRequest(isEnabled: false));
  }

  /// Enable alert (convenience method)
  ///
  /// [id] - Alert ID
  Future<bool> enableAlert(String id) async {
    return await updateAlert(id, UpdateAlertRequest(isEnabled: true));
  }

  /// Get filtered alerts by status (local filter)
  ///
  /// [status] - Status to filter ('all', 'active', 'triggered', 'resolved')
  List<BudgetAlert> getFilteredAlerts(String status) {
    if (status == 'all') {
      return _alerts;
    }
    return _alerts.where((alert) => alert.status == status).toList();
  }

  /// Clear operation messages
  void clearMessages() {
    _createError = null;
    _createSuccess = null;
    _updateError = null;
    _updateSuccess = null;
    _deleteError = null;
    _deleteSuccess = null;
    notifyListeners();
  }

  /// Clear selected alert
  void clearSelectedAlert() {
    _selectedAlert = null;
    notifyListeners();
  }

  /// Clear all data
  void clearAll() {
    _alerts = [];
    _selectedAlert = null;
    _alertsError = null;
    clearMessages();
    notifyListeners();
  }

  @override
  void dispose() {
    _alertService.dispose();
    super.dispose();
  }
}
