import 'package:flutter/foundation.dart';
import '../models/transaction.dart';
import '../services/transaction_service.dart';
import '../services/api_client.dart';

/// Provider for Transaction History Screen
/// Manages combined income + expense transaction list with filtering & pagination
class TransactionProvider with ChangeNotifier {
  final TransactionService _transactionService;

  TransactionProvider({TransactionService? transactionService})
    : _transactionService = transactionService ?? TransactionService();

  // Loading states
  bool _isLoading = false;
  bool _isLoadingMore = false;

  // Data
  List<Transaction> _transactions = [];
  TransactionSummary? _summary;
  TransactionPaginationMeta? _pagination;

  // Filters
  int? _month;
  int? _year;
  String? _type; // 'income', 'expense', or null (all)
  String? _categoryId;
  String? _sort;
  int _currentPage = 1;
  static const int _pageSize = 20;

  // Error
  String? _error;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  List<Transaction> get transactions => _transactions;
  TransactionSummary? get summary => _summary;
  TransactionPaginationMeta? get pagination => _pagination;
  String? get error => _error;
  int? get month => _month;
  int? get year => _year;
  String? get type => _type;

  bool get hasNextPage =>
      _pagination != null && _currentPage < _pagination!.totalPages;

  /// Load first page of transactions with the given filters.
  Future<void> fetchTransactions({
    int? month,
    int? year,
    String? type,
    String? categoryId,
    String? sort,
  }) async {
    _isLoading = true;
    _error = null;
    _currentPage = 1;
    _month = month;
    _year = year;
    _type = type;
    _categoryId = categoryId;
    _sort = sort;
    notifyListeners();

    try {
      final response = await _transactionService.getTransactions(
        month: _month,
        year: _year,
        type: _type,
        categoryId: _categoryId,
        sort: _sort,
        page: 1,
        limit: _pageSize,
      );
      _transactions = response.transactions;
      _summary = response.summary;
      _pagination = response.pagination;
      _error = null;
    } on ApiException catch (e) {
      _error = e.message;
      _transactions = [];
    } catch (e) {
      _error = 'Failed to load transactions: $e';
      _transactions = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Load the next page (append to current list).
  Future<void> fetchNextPage() async {
    if (_isLoadingMore || !hasNextPage) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      _currentPage++;
      final response = await _transactionService.getTransactions(
        month: _month,
        year: _year,
        type: _type,
        categoryId: _categoryId,
        sort: _sort,
        page: _currentPage,
        limit: _pageSize,
      );
      _transactions.addAll(response.transactions);
      _pagination = response.pagination;
    } on ApiException catch (e) {
      _currentPage--; // revert on failure
      _error = e.message;
    } catch (e) {
      _currentPage--;
      _error = 'Failed to load more transactions: $e';
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  /// Convenience: refresh with current filters
  Future<void> refresh() async {
    await fetchTransactions(
      month: _month,
      year: _year,
      type: _type,
      categoryId: _categoryId,
      sort: _sort,
    );
  }

  /// Filter by type ('income', 'expense', or null for all)
  Future<void> filterByType(String? type) async {
    await fetchTransactions(
      month: _month,
      year: _year,
      type: type,
      categoryId: _categoryId,
      sort: _sort,
    );
  }

  /// Filter by month/year period
  Future<void> filterByPeriod({int? month, int? year}) async {
    await fetchTransactions(
      month: month,
      year: year,
      type: _type,
      categoryId: _categoryId,
      sort: _sort,
    );
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _transactionService.dispose();
    super.dispose();
  }
}
