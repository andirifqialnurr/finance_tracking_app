import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/notification_repository.dart';
import '../models/notification_setting.dart';

part 'notification_setting_provider.g.dart';

@riverpod
Future<List<NotificationSetting>> notificationSettings(
  NotificationSettingsRef ref,
) {
  return ref.watch(notificationRepositoryProvider).getSettings();
}

@riverpod
class NotificationSettingNotifier extends _$NotificationSettingNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> createSetting(Map<String, dynamic> data) async {
    state = const AsyncLoading();
    try {
      await ref.read(notificationRepositoryProvider).createSetting(data);
      ref.invalidate(notificationSettingsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateSetting(String id, Map<String, dynamic> data) async {
    state = const AsyncLoading();
    try {
      await ref.read(notificationRepositoryProvider).updateSetting(id, data);
      ref.invalidate(notificationSettingsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteSetting(String id) async {
    state = const AsyncLoading();
    try {
      await ref.read(notificationRepositoryProvider).deleteSetting(id);
      ref.invalidate(notificationSettingsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> registerDevice(String playerId) async {
    await ref.read(notificationRepositoryProvider).registerDevice(playerId);
  }

  Future<void> sendTest(String playerId) async {
    await ref.read(notificationRepositoryProvider).sendTest(playerId);
  }
}
