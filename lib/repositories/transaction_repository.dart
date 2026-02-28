import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../core/network/dio_client.dart';

class TransactionRepository {
  final Dio _dio;
  TransactionRepository(this._dio);

  Future<List<Transaction>> getTransactions({
    int? month,
    int? year,
    String? accountId,
    String? type,
    int? limit,
    int? offset,
  }) async {
    final res = await _dio.get(
      '/transactions',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
        if (accountId != null) 'account_id': accountId,
        if (type != null) 'type': type,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      },
    );
    final raw = res.data['data'];
    if (raw == null) return [];
    final List items = raw is List ? raw : [];
    final result = <Transaction>[];
    for (final e in items) {
      try {
        result.add(Transaction.fromJson(e as Map<String, dynamic>));
      } catch (_) {
        // skip item that fails to parse
      }
    }
    return result;
  }

  Future<TransactionSummary> getSummary({int? month, int? year}) async {
    final res = await _dio.get(
      '/transactions/summary',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    final data = res.data['data'];
    if (data == null || data is! Map<String, dynamic>) {
      return const TransactionSummary(
        totalIncome: 0,
        totalExpense: 0,
        netBalance: 0,
      );
    }
    return TransactionSummary.fromJson(data);
  }
}

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(ref.watch(dioProvider));
});
