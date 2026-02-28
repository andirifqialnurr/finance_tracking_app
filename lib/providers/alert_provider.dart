import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/alert_repository.dart';
import '../models/alert.dart';

part 'alert_provider.g.dart';

@riverpod
Future<List<BudgetAlert>> alerts(AlertsRef ref) {
  return ref.watch(alertRepositoryProvider).getAlerts();
}

@riverpod
class AlertNotifier extends _$AlertNotifier {
  @override
  AsyncValue<BudgetAlert?> build() => const AsyncValue.data(null);

  Future<BudgetAlert> createAlert(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref.read(alertRepositoryProvider).createAlert(data);
      state = AsyncValue.data(result);
      ref.invalidate(alertsProvider);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<BudgetAlert> updateAlert(String id, Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(alertRepositoryProvider)
          .updateAlert(id, data);
      state = AsyncValue.data(result);
      ref.invalidate(alertsProvider);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> deleteAlert(String id) async {
    await ref.read(alertRepositoryProvider).deleteAlert(id);
    ref.invalidate(alertsProvider);
  }
}
