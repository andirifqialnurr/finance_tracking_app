import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/report_repository.dart';
import '../models/report.dart';

part 'report_provider.g.dart';

@riverpod
Future<MonthlyReport> monthlyReport(MonthlyReportRef ref, int month, int year) {
  return ref.watch(reportRepositoryProvider).getMonthlyReport(month, year);
}

@riverpod
Future<YearlyReport> yearlyReport(YearlyReportRef ref, int year) {
  return ref.watch(reportRepositoryProvider).getYearlyReport(year);
}

@riverpod
class ReportExportNotifier extends _$ReportExportNotifier {
  @override
  AsyncValue<Uint8List?> build() => const AsyncValue.data(null);

  Future<Uint8List> exportMonthly(int month, int year, String format) async {
    state = const AsyncValue.loading();
    try {
      final bytes = await ref
          .read(reportRepositoryProvider)
          .exportMonthlyReport(month, year, format);
      state = AsyncValue.data(bytes);
      return bytes;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
