import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/statistics_repository.dart';
import '../models/statistics.dart';

part 'statistics_provider.g.dart';

@riverpod
Future<OverviewStats> overviewStats(OverviewStatsRef ref) async {
  final repo = ref.watch(statisticsRepositoryProvider);
  return repo.getOverview();
}

@riverpod
Future<MonthlyStats> monthlyStats(
  MonthlyStatsRef ref, {
  int? month,
  int? year,
}) async {
  final now = DateTime.now();
  final repo = ref.watch(statisticsRepositoryProvider);
  return repo.getMonthlyStats(
    month: month ?? now.month,
    year: year ?? now.year,
  );
}
