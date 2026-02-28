import 'package:flutter/foundation.dart';
import '../models/expense_category.dart';
import 'api_client.dart';

/// Service untuk category-related API calls
class CategoryService {
  final ApiClient _apiClient;

  CategoryService({ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  /// Get all categories
  /// [isActive] - optional filter for active/inactive categories
  Future<List<ExpenseCategory>> getCategories({bool? isActive}) async {
    try {
      final queryParams = <String, String>{};
      if (isActive != null) {
        queryParams['is_active'] = isActive.toString();
      }

      final response = await _apiClient.get(
        '/categories',
        queryParams: queryParams.isNotEmpty ? queryParams : null,
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
    required CategoryType type,
    required double monthlyBudget,
    required int allocationPriority,
    bool isActive = true,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final body = <String, dynamic>{
        'name': name,
        'type': type.name,
        'monthly_budget': monthlyBudget,
        'allocation_priority': allocationPriority,
        'is_active': isActive,
        if (metadata != null) 'metadata': metadata,
      };

      final response = await _apiClient.post('/categories', body: body);
      return ExpenseCategory.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create category: ${e.toString()}');
    }
  }

  /// Update category — uses PATCH (not PUT)
  Future<ExpenseCategory> updateCategory({
    required String id,
    String? name,
    CategoryType? type,
    double? monthlyBudget,
    int? allocationPriority,
    bool? isActive,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (name != null) body['name'] = name;
      if (type != null) body['type'] = type.name;
      if (monthlyBudget != null) body['monthly_budget'] = monthlyBudget;
      if (allocationPriority != null)
        body['allocation_priority'] = allocationPriority;
      if (isActive != null) body['is_active'] = isActive;
      if (metadata != null) body['metadata'] = metadata;

      final response = await _apiClient.patch('/categories/$id', body: body);
      debugPrint('[CategoryService] updateCategory response: $response');
      final data = response['data'];
      if (data == null) throw Exception('response[data] is null');
      return ExpenseCategory.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      debugPrint('[CategoryService] updateCategory ERROR: $e');
      throw Exception('Failed to update category: ${e.toString()}');
    }
  }

  /// Delete category — soft delete (sets is_active = false)
  Future<void> deleteCategory(String id) async {
    try {
      await _apiClient.delete('/categories/$id');
    } catch (e) {
      throw Exception('Failed to delete category: ${e.toString()}');
    }
  }

  /// Toggle category active status using PATCH /categories/:id
  Future<ExpenseCategory> toggleCategoryStatus(String id, bool isActive) async {
    try {
      return await updateCategory(id: id, isActive: isActive);
    } catch (e) {
      throw Exception('Failed to toggle category status: ${e.toString()}');
    }
  }

  /// Get categories by type
  Future<List<ExpenseCategory>> getCategoriesByType(CategoryType type) async {
    try {
      final response = await _apiClient.get(
        '/categories',
        queryParams: {'type': type.name},
      );

      final List<dynamic> data = response['data'] ?? [];
      return data.map((json) => ExpenseCategory.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories by type: ${e.toString()}');
    }
  }
}
