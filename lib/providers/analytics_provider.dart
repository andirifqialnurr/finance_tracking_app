import 'package:flutter/foundation.dart';
import '../models/analytics.dart';
import '../services/analytics_service.dart';
import '../services/api_client.dart';

/// Provider for Analytics Screen
/// Manages all analytics-related data and API calls
class AnalyticsProvider with ChangeNotifier {
  final AnalyticsService _analyticsService;

  AnalyticsProvider({AnalyticsService? analyticsService})
    : _analyticsService = analyticsService ?? AnalyticsService();

  // Loading states
  bool _isLoadingSpendingPattern = false;
  bool _isLoadingCategoryComparison = false;
  bool _isLoadingTopSpending = false;
  bool _isLoadingBudgetPerformance = false;

  // Data
  List<SpendingPattern>? _spendingPatterns;
  List<CategoryComparison>? _categoryComparisons;
  TopSpending? _topSpending;
  BudgetPerformance? _budgetPerformance;

  // Errors
  String? _spendingPatternError;
  String? _categoryComparisonError;
  String? _topSpendingError;
  String? _budgetPerformanceError;

  // Getters - Loading States
  bool get isLoadingSpendingPattern => _isLoadingSpendingPattern;
  bool get isLoadingCategoryComparison => _isLoadingCategoryComparison;
  bool get isLoadingTopSpending => _isLoadingTopSpending;
  bool get isLoadingBudgetPerformance => _isLoadingBudgetPerformance;

  // Getters - Data
  List<SpendingPattern>? get spendingPatterns => _spendingPatterns;
  List<CategoryComparison>? get categoryComparisons => _categoryComparisons;
  TopSpending? get topSpending => _topSpending;
  BudgetPerformance? get budgetPerformance => _budgetPerformance;

  // Getters - Errors
  String? get spendingPatternError => _spendingPatternError;
  String? get categoryComparisonError => _categoryComparisonError;
  String? get topSpendingError => _topSpendingError;
  String? get budgetPerformanceError => _budgetPerformanceError;

  /// Fetch spending pattern data
  ///
  /// [month] - Current month (1-12)
  /// [year] - Current year
  /// [categoryId] - Optional category filter
  /// [period] - Number of months to look back (3, 6, or 12)
  Future<void> fetchSpendingPattern({
    required int month,
    required int year,
    String? categoryId,
    int period = 6,
  }) async {
    _isLoadingSpendingPattern = true;
    _spendingPatternError = null;
    notifyListeners();

    try {
      _spendingPatterns = await _analyticsService.getSpendingPattern(
        month: month,
        year: year,
        categoryId: categoryId,
        period: period,
      );
      _spendingPatternError = null;
    } on ApiException catch (e) {
      _spendingPatternError = e.message;
      _spendingPatterns = null;
    } catch (e) {
      _spendingPatternError = 'Failed to load spending pattern: $e';
      _spendingPatterns = null;
    } finally {
      _isLoadingSpendingPattern = false;
      notifyListeners();
    }
  }

  /// Fetch category comparison data
  ///
  /// [month] - Month to compare (1-12)
  /// [year] - Year
  Future<void> fetchCategoryComparison({
    required int month,
    required int year,
  }) async {
    _isLoadingCategoryComparison = true;
    _categoryComparisonError = null;
    notifyListeners();

    try {
      _categoryComparisons = await _analyticsService.getCategoryComparison(
        month: month,
        year: year,
      );
      _categoryComparisonError = null;
    } on ApiException catch (e) {
      _categoryComparisonError = e.message;
      _categoryComparisons = null;
    } catch (e) {
      _categoryComparisonError = 'Failed to load category comparison: $e';
      _categoryComparisons = null;
    } finally {
      _isLoadingCategoryComparison = false;
      notifyListeners();
    }
  }

  /// Fetch top spending categories
  ///
  /// [startDate] - Start date for the range
  /// [endDate] - End date for the range
  /// [limit] - Number of top categories to return
  Future<void> fetchTopSpending({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 5,
  }) async {
    _isLoadingTopSpending = true;
    _topSpendingError = null;
    notifyListeners();

    try {
      _topSpending = await _analyticsService.getTopSpending(
        startDate: startDate,
        endDate: endDate,
        limit: limit,
      );
      _topSpendingError = null;
    } on ApiException catch (e) {
      _topSpendingError = e.message;
      _topSpending = null;
    } catch (e) {
      _topSpendingError = 'Failed to load top spending: $e';
      _topSpending = null;
    } finally {
      _isLoadingTopSpending = false;
      notifyListeners();
    }
  }

  /// Fetch budget performance data
  ///
  /// [year] - Year to analyze
  Future<void> fetchBudgetPerformance({required int year}) async {
    _isLoadingBudgetPerformance = true;
    _budgetPerformanceError = null;
    notifyListeners();

    try {
      _budgetPerformance = await _analyticsService.getBudgetPerformance(
        year: year,
      );
      _budgetPerformanceError = null;
    } on ApiException catch (e) {
      _budgetPerformanceError = e.message;
      _budgetPerformance = null;
    } catch (e) {
      _budgetPerformanceError = 'Failed to load budget performance: $e';
      _budgetPerformance = null;
    } finally {
      _isLoadingBudgetPerformance = false;
      notifyListeners();
    }
  }

  /// Clear all data
  void clearAll() {
    _spendingPatterns = null;
    _categoryComparisons = null;
    _topSpending = null;
    _budgetPerformance = null;
    _spendingPatternError = null;
    _categoryComparisonError = null;
    _topSpendingError = null;
    _budgetPerformanceError = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _analyticsService.dispose();
    super.dispose();
  }
}
