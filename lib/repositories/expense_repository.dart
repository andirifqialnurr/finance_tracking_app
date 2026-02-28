import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense.dart';
import '../core/network/dio_client.dart';

class ExpenseRepository {
  final Dio _dio;
  ExpenseRepository(this._dio);

  Future<ExpenseCreateResult> createExpense({
    required double amount,
    required String description,
    required String categoryId,
    required String accountId,
    required DateTime date,
  }) async {
    final res = await _dio.post(
      '/expenses',
      data: {
        'amount': amount,
        'description': description,
        'category_id': categoryId,
        'account_id': accountId,
        'date': date.toIso8601String(),
      },
    );
    return ExpenseCreateResult.fromJson(
      res.data['data'] as Map<String, dynamic>,
    );
  }

  Future<List<Expense>> getExpenses({int? month, int? year}) async {
    final res = await _dio.get(
      '/expenses',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => Expense.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> deleteExpense(String id) async {
    await _dio.delete('/expenses/$id');
  }
}

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepository(ref.watch(dioProvider));
});
