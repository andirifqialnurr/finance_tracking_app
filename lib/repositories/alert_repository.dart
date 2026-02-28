import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/alert.dart';
import '../core/network/dio_client.dart';

class AlertRepository {
  final Dio _dio;
  AlertRepository(this._dio);

  Future<List<BudgetAlert>> getAlerts() async {
    final res = await _dio.get('/alerts');
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => BudgetAlert.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BudgetAlert> createAlert(Map<String, dynamic> data) async {
    final res = await _dio.post('/alerts', data: data);
    return BudgetAlert.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<BudgetAlert> updateAlert(String id, Map<String, dynamic> data) async {
    final res = await _dio.patch('/alerts/$id', data: data);
    return BudgetAlert.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<void> deleteAlert(String id) async {
    await _dio.delete('/alerts/$id');
  }
}

final alertRepositoryProvider = Provider<AlertRepository>((ref) {
  return AlertRepository(ref.watch(dioProvider));
});
