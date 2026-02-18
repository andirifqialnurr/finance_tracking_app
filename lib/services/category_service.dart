import '../models/expense_category.dart';
import 'api_client.dart';

/// Service untuk category-related API calls
class CategoryService {
  final ApiClient _apiClient;

  CategoryService({ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  /// Get all categories
  Future<List<ExpenseCategory>> getCategories({bool? isActive}) async {
    try {
      final queryParams = <String, String>{};
      if (isActive != null) {
        queryParams['isActive'] = isActive.toString();
      }

      final response = await _apiClient.get(
        '/categories',
        queryParams: queryParams,
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => ExpenseCategory.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: ${e.toString()}');
    }
  }

  /// Get category by ID
  Future<ExpenseCategory> getCategoryById(String id) async {
    try {
      final response = await _apiClient.get('/categories/$id');
      return ExpenseCategory.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch category: ${e.toString()}');
    }
  }

  /// Create new category
  Future<ExpenseCategory> createCategory({
    required String name,
    required ExpenseCategoryType type,
    required double monthlyBudget,
    required int priority,
    bool isActive = true,
  }) async {
    try {
      final body = {
        'name': name,
        'type': type.name.toUpperCase(),
        'monthlyBudget': monthlyBudget,
        'priority': priority,
        'isActive': isActive,
      };

      final response = await _apiClient.post('/categories', body: body);
      return ExpenseCategory.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create category: ${e.toString()}');
    }
  }

  /// Update category
  Future<ExpenseCategory> updateCategory({
    required String id,
    String? name,
    ExpenseCategoryType? type,
    double? monthlyBudget,
    int? priority,
    bool? isActive,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (name != null) body['name'] = name;
      if (type != null) body['type'] = type.name.toUpperCase();
      if (monthlyBudget != null) body['monthlyBudget'] = monthlyBudget;
      if (priority != null) body['priority'] = priority;
      if (isActive != null) body['isActive'] = isActive;

      final response = await _apiClient.put('/categories/$id', body: body);
      return ExpenseCategory.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to update category: ${e.toString()}');
    }
  }

  /// Delete category
  Future<void> deleteCategory(String id) async {
    try {
      await _apiClient.delete('/categories/$id');
    } catch (e) {
      throw Exception('Failed to delete category: ${e.toString()}');
    }
  }

  /// Toggle category active status
  Future<ExpenseCategory> toggleCategoryStatus(String id, bool isActive) async {
    try {
      final response = await _apiClient.put(
        '/categories/$id/toggle',
        body: {'isActive': isActive},
      );
      return ExpenseCategory.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to toggle category status: ${e.toString()}');
    }
  }

  /// Get categories by type
  Future<List<ExpenseCategory>> getCategoriesByType(
    ExpenseCategoryType type,
  ) async {
    try {
      final response = await _apiClient.get(
        '/categories',
        queryParams: {'type': type.name.toUpperCase()},
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => ExpenseCategory.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories by type: ${e.toString()}');
    }
  }
}
