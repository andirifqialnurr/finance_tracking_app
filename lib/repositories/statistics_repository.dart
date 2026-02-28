import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/statistics.dart';
import '../core/network/dio_client.dart';

class StatisticsRepository {
  final Dio _dio;
  StatisticsRepository(this._dio);

  Future<OverviewStats> getOverview() async {
    final res = await _dio.get('/statistics/overview');
    return OverviewStats.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<MonthlyStats> getMonthlyStats({
    required int month,
    required int year,
  }) async {
    final res = await _dio.get(
      '/statistics/monthly',
      queryParameters: {'month': month, 'year': year},
    );
    return MonthlyStats.fromJson(res.data['data'] as Map<String, dynamic>);
  }
}

final statisticsRepositoryProvider = Provider<StatisticsRepository>((ref) {
  return StatisticsRepository(ref.watch(dioProvider));
});
