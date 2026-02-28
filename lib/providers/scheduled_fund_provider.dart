import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/scheduled_fund_repository.dart';
import '../models/scheduled_fund.dart';

part 'scheduled_fund_provider.g.dart';

@riverpod
Future<List<ScheduledFund>> scheduledFunds(ScheduledFundsRef ref) {
  return ref.watch(scheduledFundRepositoryProvider).getScheduledFunds();
}

@riverpod
class ScheduledFundNotifier extends _$ScheduledFundNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> createScheduledFund(Map<String, dynamic> data) async {
    state = const AsyncLoading();
    try {
      await ref.read(scheduledFundRepositoryProvider).createScheduledFund(data);
      ref.invalidate(scheduledFundsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateScheduledFund(String id, Map<String, dynamic> data) async {
    state = const AsyncLoading();
    try {
      await ref
          .read(scheduledFundRepositoryProvider)
          .updateScheduledFund(id, data);
      ref.invalidate(scheduledFundsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteScheduledFund(String id) async {
    state = const AsyncLoading();
    try {
      await ref.read(scheduledFundRepositoryProvider).deleteScheduledFund(id);
      ref.invalidate(scheduledFundsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
