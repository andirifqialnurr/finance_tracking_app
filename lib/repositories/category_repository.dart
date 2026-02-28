import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense_category.dart';
import '../core/network/dio_client.dart';

class CategoryRepository {
  final Dio _dio;
  CategoryRepository(this._dio);

  Future<List<ExpenseCategory>> getCategories() async {
    final res = await _dio.get('/categories');
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => ExpenseCategory.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ExpenseCategory> createCategory(Map<String, dynamic> data) async {
    final res = await _dio.post('/categories', data: data);
    return ExpenseCategory.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<ExpenseCategory> updateCategory(
    String id,
    Map<String, dynamic> data,
  ) async {
    final res = await _dio.patch('/categories/$id', data: data);
    return ExpenseCategory.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<void> deleteCategory(String id) async {
    await _dio.delete('/categories/$id');
  }
}

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(dioProvider));
});
