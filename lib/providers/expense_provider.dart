import 'package:flutter/foundation.dart';
import '../models/expense.dart';
import '../models/expense_category.dart';
import '../services/expense_service.dart';
import '../services/api_client.dart';

/// Provider for Expense screens (history, create, edit, delete)
class ExpenseProvider with ChangeNotifier {
  final ExpenseService _expenseService;

  ExpenseProvider({ExpenseService? expenseService})
    : _expenseService = expenseService ?? ExpenseService();

  // ── State ─────────────────────────────────────────────────────────────────
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _isSubmitting = false;

  List<Expense> _expenses = [];
  ExpensePaginationMeta? _pagination;
  ExpenseSummary? _summary;
  ExpenseCreateResponse? _lastCreated;

  String? _error;
  String? _submitError;

  // Filter state
  String? _categoryId;
  int? _month;
  int? _year;
  String? _sort;
  int _currentPage = 1;
  static const int _pageSize = 20;

  // ── Getters ───────────────────────────────────────────────────────────────
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get isSubmitting => _isSubmitting;
  List<Expense> get expenses => _expenses;
  ExpensePaginationMeta? get pagination => _pagination;
  ExpenseSummary? get summary => _summary;
  ExpenseCreateResponse? get lastCreated => _lastCreated;
  String? get error => _error;
  String? get submitError => _submitError;
  int? get month => _month;
  int? get year => _year;

  bool get hasNextPage =>
      _pagination != null && _currentPage < _pagination!.totalPages;

  // ── Fetch list ─────────────────────────────────────────────────────────────
  Future<void> fetchExpenses({
    String? categoryId,
    int? month,
    int? year,
    String? sort,
    bool refresh = false,
  }) async {
    if (!refresh && _isLoading) return;
    _isLoading = true;
    _error = null;
    _currentPage = 1;
    _categoryId = categoryId;
    _month = month;
    _year = year;
    _sort = sort ?? 'date_desc';
    notifyListeners();

    try {
      final response = await _expenseService.getExpenses(
        categoryId: _categoryId,
        month: _month,
        year: _year,
        sort: _sort ?? 'date_desc',
        page: 1,
        limit: _pageSize,
      );
      _expenses = response.data;
      _pagination = response.pagination;
      _summary = response.summary;
      _error = null;
    } on ApiException catch (e) {
      _error = e.message;
      _expenses = [];
    } catch (e) {
      _error = 'Failed to load expenses.';
      _expenses = [];
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
      final response = await _expenseService.getExpenses(
        categoryId: _categoryId,
        month: _month,
        year: _year,
        sort: _sort ?? 'date_desc',
        page: _currentPage,
        limit: _pageSize,
      );
      _expenses.addAll(response.data);
      _pagination = response.pagination;
    } catch (_) {
      _currentPage--;
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> refresh() => fetchExpenses(
    categoryId: _categoryId,
    month: _month,
    year: _year,
    sort: _sort,
    refresh: true,
  );

  // ── Create ─────────────────────────────────────────────────────────────────
  /// Returns true on success. Caller should check [lastCreated.alert] for budget warnings.
  Future<bool> createExpense({
    required String categoryId,
    required double amount,
    required DateTime date,
    String? description,
  }) async {
    _isSubmitting = true;
    _submitError = null;
    _lastCreated = null;
    notifyListeners();

    try {
      final result = await _expenseService.createExpense(
        categoryId: categoryId,
        amount: amount,
        date: date,
        description: description,
      );
      _lastCreated = result;
      if (_expenses.isNotEmpty) {
        _expenses.insert(0, result.expense);
      }
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to save expense.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // ── Update ─────────────────────────────────────────────────────────────────
  Future<bool> updateExpense({
    required String id,
    String? categoryId,
    double? amount,
    DateTime? date,
    String? description,
  }) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      final result = await _expenseService.updateExpense(
        id: id,
        categoryId: categoryId,
        amount: amount,
        date: date,
        description: description,
      );
      final idx = _expenses.indexWhere((e) => e.id == id);
      if (idx != -1) _expenses[idx] = result;
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to update expense.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // ── Delete ─────────────────────────────────────────────────────────────────
  Future<bool> deleteExpense(String id) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      await _expenseService.deleteExpense(id);
      _expenses.removeWhere((e) => e.id == id);
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to delete expense.';
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
