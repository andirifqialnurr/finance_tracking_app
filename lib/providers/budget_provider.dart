import 'package:flutter/foundation.dart';
import '../models/budget.dart';
import '../services/budget_service.dart';
import '../services/api_client.dart';

/// Provider for Budget screens (overview, summary, reallocations)
class BudgetProvider with ChangeNotifier {
  final BudgetService _budgetService;

  BudgetProvider({BudgetService? budgetService})
    : _budgetService = budgetService ?? BudgetService();

  // ── State ─────────────────────────────────────────────────────────────────
  bool _isLoading = false;
  bool _isSubmitting = false;

  List<BudgetWithCategory> _budgets = [];
  BudgetSummary? _summary;
  List<BudgetReallocation> _reallocations = [];

  int _month = DateTime.now().month;
  int _year = DateTime.now().year;

  String? _error;
  String? _submitError;

  // ── Getters ───────────────────────────────────────────────────────────────
  bool get isLoading => _isLoading;
  bool get isSubmitting => _isSubmitting;
  List<BudgetWithCategory> get budgets => _budgets;
  BudgetSummary? get summary => _summary;
  List<BudgetReallocation> get reallocations => _reallocations;
  int get month => _month;
  int get year => _year;
  String? get error => _error;
  String? get submitError => _submitError;

  // ── Fetch budgets + summary together ──────────────────────────────────────
  Future<void> fetchAll({int? month, int? year, bool refresh = false}) async {
    if (!refresh && _isLoading) return;
    _isLoading = true;
    _error = null;
    if (month != null) _month = month;
    if (year != null) _year = year;
    notifyListeners();

    try {
      // Fetch independently so a failure in getBudgets doesn't block summary
      try {
        _budgets = await _budgetService.getBudgets(month: _month, year: _year);
        debugPrint('[BudgetProvider] getBudgets OK: ${_budgets.length} items');
      } catch (e) {
        debugPrint('[BudgetProvider] getBudgets error: $e');
        _budgets = [];
      }

      try {
        _summary = await _budgetService.getBudgetSummary(
          month: _month,
          year: _year,
        );
        debugPrint(
          '[BudgetProvider] summary OK: income=${_summary?.totalIncome}, spent=${_summary?.totalSpent}',
        );
      } catch (e) {
        debugPrint('[BudgetProvider] getBudgetSummary error: $e');
      }

      _error = null;
    } on ApiException catch (e) {
      _error = e.message;
    } catch (e) {
      debugPrint('[BudgetProvider] fetchAll error: $e');
      _error = 'Failed to load budget data.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() => fetchAll(refresh: true);

  Future<void> changeMonth(int month, int year) =>
      fetchAll(month: month, year: year, refresh: true);

  // ── Fetch reallocations ────────────────────────────────────────────────────
  Future<void> fetchReallocations({int? month, int? year}) async {
    try {
      _reallocations = await _budgetService.getReallocations(
        month: month ?? _month,
        year: year ?? _year,
      );
      notifyListeners();
    } catch (_) {
      _reallocations = [];
    }
  }

  // ── Reallocate budget ──────────────────────────────────────────────────────
  Future<bool> reallocateBudget({
    required String fromCategoryId,
    required String toCategoryId,
    required double amount,
    String? reason,
  }) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      final result = await _budgetService.reallocateBudget(
        fromCategoryId: fromCategoryId,
        toCategoryId: toCategoryId,
        amount: amount,
        reason: reason,
      );
      _reallocations.insert(0, result);
      // Refresh budgets to reflect new allocation
      await fetchAll(refresh: true);
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to reallocate budget.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // ── Cancel reallocation ────────────────────────────────────────────────────
  Future<bool> cancelReallocation(String id) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      await _budgetService.cancelReallocation(id);
      _reallocations.removeWhere((r) => r.id == id);
      await fetchAll(refresh: true);
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to cancel reallocation.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    _submitError = null;
    notifyListeners();
  }
}
