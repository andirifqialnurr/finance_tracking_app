import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transfer.dart';
import '../core/network/dio_client.dart';

class TransferRepository {
  final Dio _dio;
  TransferRepository(this._dio);

  Future<TransferResult> createTransfer({
    required String fromAccountId,
    required String toAccountId,
    required double amount,
    String? note,
    required DateTime transferDate,
  }) async {
    final res = await _dio.post(
      '/transfers',
      data: {
        'from_account_id': fromAccountId,
        'to_account_id': toAccountId,
        'amount': amount,
        if (note != null) 'note': note,
        'transfer_date': transferDate.toIso8601String(),
      },
    );
    return TransferResult.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<List<Transfer>> getTransfers({int? month, int? year}) async {
    final res = await _dio.get(
      '/transfers',
      queryParameters: {
        if (month != null) 'month': month,
        if (year != null) 'year': year,
      },
    );
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => Transfer.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> cancelTransfer(String id) async {
    await _dio.delete('/transfers/$id');
  }
}

final transferRepositoryProvider = Provider<TransferRepository>((ref) {
  return TransferRepository(ref.watch(dioProvider));
});
