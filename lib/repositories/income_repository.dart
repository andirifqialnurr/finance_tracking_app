import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/income.dart';
import '../core/network/dio_client.dart';

class IncomeRepository {
  final Dio _dio;
  IncomeRepository(this._dio);

  Future<IncomeCreateResult> createIncome({
    required double amount,
    required String source,
    required String accountId,
    String? description,
    required DateTime date,
  }) async {
    final res = await _dio.post(
      '/incomes',
      data: {
        'amount': amount,
        'source': source,
        'account_id': accountId,
        if (description != null) 'description': description,
        'date': date.toIso8601String(),
      },
    );
    return IncomeCreateResult.fromJson(
      res.data['data'] as Map<String, dynamic>,
    );
  }

  Future<List<Income>> getIncomes({int? month, int? year}) async {
    final res = await _dio.get(
      '/incomes',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    final List data = res.data['data'] ?? [];
    return data.map((e) => Income.fromJson(e as Map<String, dynamic>)).toList();
  }
}

final incomeRepositoryProvider = Provider<IncomeRepository>((ref) {
  return IncomeRepository(ref.watch(dioProvider));
});
