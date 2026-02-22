import 'package:flutter/foundation.dart';
import '../models/income.dart';
import '../services/income_service.dart';
import '../services/api_client.dart';

/// Provider for Income screens (history, create, edit, delete)
class IncomeProvider with ChangeNotifier {
  final IncomeService _incomeService;

  IncomeProvider({IncomeService? incomeService})
    : _incomeService = incomeService ?? IncomeService();

  // ── State ─────────────────────────────────────────────────────────────────
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _isSubmitting = false;

  List<Income> _incomes = [];
  PaginationMeta? _pagination;
  IncomeWithAllocations? _lastCreated;

  String? _error;
  String? _submitError;

  // Filter state
  int? _month;
  int? _year;
  String? _sort;
  int _currentPage = 1;
  static const int _pageSize = 20;

  // ── Getters ───────────────────────────────────────────────────────────────
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get isSubmitting => _isSubmitting;
  List<Income> get incomes => _incomes;
  PaginationMeta? get pagination => _pagination;
  IncomeWithAllocations? get lastCreated => _lastCreated;
  String? get error => _error;
  String? get submitError => _submitError;
  int? get month => _month;
  int? get year => _year;

  bool get hasNextPage =>
      _pagination != null && _currentPage < _pagination!.totalPages;

  // ── Fetch list ─────────────────────────────────────────────────────────────
  Future<void> fetchIncomes({
    int? month,
    int? year,
    String? sort,
    bool refresh = false,
  }) async {
    if (!refresh && _isLoading) return;
    _isLoading = true;
    _error = null;
    _currentPage = 1;
    _month = month;
    _year = year;
    _sort = sort ?? 'date_desc';
    notifyListeners();

    try {
      final response = await _incomeService.getIncomes(
        month: _month,
        year: _year,
        sort: _sort ?? 'date_desc',
        page: 1,
        limit: _pageSize,
      );
      _incomes = response.data;
      _pagination = response.pagination;
      _error = null;
    } on ApiException catch (e) {
      _error = e.message;
      _incomes = [];
    } catch (e) {
      _error = 'Failed to load incomes.';
      _incomes = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchNextPage() async {
    if (_isLoadingMore || !hasNextPage) return;
    _isLoadingMore = true;
    notifyListeners();

    try {
      _currentPage++;
      final response = await _incomeService.getIncomes(
        month: _month,
        year: _year,
        sort: _sort ?? 'date_desc',
        page: _currentPage,
        limit: _pageSize,
      );
      _incomes.addAll(response.data);
      _pagination = response.pagination;
    } catch (e) {
      _currentPage--;
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> refresh() =>
      fetchIncomes(month: _month, year: _year, sort: _sort, refresh: true);

  // ── Create ─────────────────────────────────────────────────────────────────
  /// Returns true on success. Caller should check [lastCreated] for allocation breakdown.
  Future<bool> createIncome({
    required String source,
    required double amount,
    required DateTime date,
    String? description,
  }) async {
    _isSubmitting = true;
    _submitError = null;
    _lastCreated = null;
    notifyListeners();

    try {
      final result = await _incomeService.createIncome(
        source: source,
        amount: amount,
        date: date,
        description: description,
      );
      _lastCreated = result;
      // Prepend to list if loaded
      if (_incomes.isNotEmpty) {
        _incomes.insert(0, result.income);
      }
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to save income.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // ── Update ─────────────────────────────────────────────────────────────────
  Future<bool> updateIncome({
    required String id,
    String? source,
    double? amount,
    DateTime? date,
    String? description,
  }) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      final result = await _incomeService.updateIncome(
        id: id,
        source: source,
        amount: amount,
        date: date,
        description: description,
      );
      final idx = _incomes.indexWhere((i) => i.id == id);
      if (idx != -1) _incomes[idx] = result.income;
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to update income.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // ── Delete ─────────────────────────────────────────────────────────────────
  Future<bool> deleteIncome(String id) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      await _incomeService.deleteIncome(id);
      _incomes.removeWhere((i) => i.id == id);
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to delete income.';
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
