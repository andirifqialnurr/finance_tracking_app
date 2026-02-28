import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/scheduled_fund.dart';
import '../core/network/dio_client.dart';

class ScheduledFundRepository {
  final Dio _dio;
  ScheduledFundRepository(this._dio);

  Future<List<ScheduledFund>> getScheduledFunds() async {
    final res = await _dio.get('/scheduled-funds');
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => ScheduledFund.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ScheduledFund> createScheduledFund(Map<String, dynamic> data) async {
    final res = await _dio.post('/scheduled-funds', data: data);
    return ScheduledFund.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<ScheduledFund> updateScheduledFund(
    String id,
    Map<String, dynamic> data,
  ) async {
    final res = await _dio.patch('/scheduled-funds/$id', data: data);
    return ScheduledFund.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<void> deleteScheduledFund(String id) async {
    await _dio.delete('/scheduled-funds/$id');
  }
}

final scheduledFundRepositoryProvider = Provider<ScheduledFundRepository>((
  ref,
) {
  return ScheduledFundRepository(ref.watch(dioProvider));
});
