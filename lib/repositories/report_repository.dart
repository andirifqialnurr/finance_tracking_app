import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/report.dart';
import '../core/network/dio_client.dart';

class ReportRepository {
  final Dio _dio;
  ReportRepository(this._dio);

  Future<MonthlyReport> getMonthlyReport(int month, int year) async {
    final res = await _dio.get(
      '/reports/monthly',
      queryParameters: {'month': month, 'year': year},
    );
    return MonthlyReport.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  Future<YearlyReport> getYearlyReport(int year) async {
    final res = await _dio.get(
      '/reports/yearly',
      queryParameters: {'year': year},
    );
    return YearlyReport.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  /// Export monthly report as PDF or Excel. Returns raw bytes.
  Future<Uint8List> exportMonthlyReport(
    int month,
    int year,
    String format,
  ) async {
    final res = await _dio.get(
      '/reports/monthly/export',
      queryParameters: {'month': month, 'year': year, 'format': format},
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(res.data as List<int>);
  }
}

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(ref.watch(dioProvider));
});
