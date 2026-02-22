import 'package:flutter/foundation.dart';
import '../models/expense_category.dart';
import '../services/category_service.dart';
import '../services/api_client.dart';

/// Provider for Category screens (management, create, edit, delete, toggle)
class CategoryProvider with ChangeNotifier {
  final CategoryService _categoryService;

  CategoryProvider({CategoryService? categoryService})
    : _categoryService = categoryService ?? CategoryService();

  // ── State ─────────────────────────────────────────────────────────────────
  bool _isLoading = false;
  bool _isSubmitting = false;

  List<ExpenseCategory> _categories = [];
  bool? _activeFilter; // null = all, true = active only, false = inactive only

  String? _error;
  String? _submitError;

  // ── Getters ───────────────────────────────────────────────────────────────
  bool get isLoading => _isLoading;
  bool get isSubmitting => _isSubmitting;
  List<ExpenseCategory> get categories => _categories;
  String? get error => _error;
  String? get submitError => _submitError;

  List<ExpenseCategory> get activeCategories =>
      _categories.where((c) => c.isActive).toList();

  int get activeCount => _categories.where((c) => c.isActive).length;
  double get totalActiveBudget => _categories
      .where((c) => c.isActive)
      .fold(0.0, (sum, c) => sum + c.monthlyBudget);

  // ── Fetch ──────────────────────────────────────────────────────────────────
  Future<void> fetchCategories({bool? isActive, bool refresh = false}) async {
    if (!refresh && _isLoading) return;
    _isLoading = true;
    _error = null;
    _activeFilter = isActive;
    notifyListeners();

    try {
      _categories = await _categoryService.getCategories(isActive: isActive);
      _error = null;
    } on ApiException catch (e) {
      _error = e.message;
      _categories = [];
    } catch (e) {
      _error = 'Failed to load categories.';
      _categories = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() =>
      fetchCategories(isActive: _activeFilter, refresh: true);

  // ── Create ─────────────────────────────────────────────────────────────────
  Future<bool> createCategory({
    required String name,
    required ExpenseCategoryType type,
    required double monthlyBudget,
    required int allocationPriority,
    bool isActive = true,
    Map<String, dynamic>? metadata,
  }) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      final result = await _categoryService.createCategory(
        name: name,
        type: type,
        monthlyBudget: monthlyBudget,
        allocationPriority: allocationPriority,
        isActive: isActive,
        metadata: metadata,
      );
      _categories.add(result);
      _categories.sort(
        (a, b) => a.allocationPriority.compareTo(b.allocationPriority),
      );
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to create category.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // ── Update ─────────────────────────────────────────────────────────────────
  Future<bool> updateCategory({
    required String id,
    String? name,
    ExpenseCategoryType? type,
    double? monthlyBudget,
    int? allocationPriority,
    bool? isActive,
    Map<String, dynamic>? metadata,
  }) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      final result = await _categoryService.updateCategory(
        id: id,
        name: name,
        type: type,
        monthlyBudget: monthlyBudget,
        allocationPriority: allocationPriority,
        isActive: isActive,
        metadata: metadata,
      );
      final idx = _categories.indexWhere((c) => c.id == id);
      if (idx != -1) _categories[idx] = result;
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to update category.';
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // ── Toggle active status ───────────────────────────────────────────────────
  Future<bool> toggleStatus(String id, bool isActive) async {
    // Optimistically update UI while API call runs
    final idx = _categories.indexWhere((c) => c.id == id);
    if (idx != -1) {
      final updated = List<ExpenseCategory>.from(_categories);
      updated[idx] = updated[idx].copyWith(isActive: isActive);
      _categories = updated;
      notifyListeners();
    }

    try {
      final result = await _categoryService.toggleCategoryStatus(id, isActive);
      // Server may echo back old is_active value — force the value we sent
      final updated = List<ExpenseCategory>.from(_categories);
      if (idx != -1) updated[idx] = result.copyWith(isActive: isActive);
      _categories = updated;
      notifyListeners();
      return true;
    } on ApiException catch (e) {
      // HTTP-level failure — revert
      debugPrint('[CategoryProvider] toggleStatus ApiException: $e');
      if (idx != -1) {
        final reverted = List<ExpenseCategory>.from(_categories);
        reverted[idx] = reverted[idx].copyWith(isActive: !isActive);
        _categories = reverted;
        notifyListeners();
      }
      _submitError = e.message;
      return false;
    } catch (e) {
      // Parse/other error — server likely succeeded, keep optimistic update
      debugPrint(
        '[CategoryProvider] toggleStatus non-API error (keeping optimistic): $e',
      );
      return true;
    }
  }

  // ── Delete ─────────────────────────────────────────────────────────────────
  Future<bool> deleteCategory(String id) async {
    _isSubmitting = true;
    _submitError = null;
    notifyListeners();

    try {
      await _categoryService.deleteCategory(id);
      _categories.removeWhere((c) => c.id == id);
      _submitError = null;
      return true;
    } on ApiException catch (e) {
      _submitError = e.message;
      return false;
    } catch (e) {
      _submitError = 'Failed to delete category.';
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
