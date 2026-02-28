import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/notification_setting.dart';
import '../core/network/dio_client.dart';

class NotificationRepository {
  final Dio _dio;
  NotificationRepository(this._dio);

  /// Register OneSignal device player ID
  Future<void> registerDevice(String playerId) async {
    await _dio.post('/notifications/register', data: {'player_id': playerId});
  }

  Future<List<NotificationSetting>> getSettings() async {
    final res = await _dio.get('/notifications/settings');
    final List data = res.data['data'] ?? [];
    return data
        .map((e) => NotificationSetting.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<NotificationSetting> createSetting(Map<String, dynamic> data) async {
    final res = await _dio.post('/notifications/settings', data: data);
    return NotificationSetting.fromJson(
      res.data['data'] as Map<String, dynamic>,
    );
  }

  Future<NotificationSetting> updateSetting(
    String id,
    Map<String, dynamic> data,
  ) async {
    final res = await _dio.patch('/notifications/settings/$id', data: data);
    return NotificationSetting.fromJson(
      res.data['data'] as Map<String, dynamic>,
    );
  }

  Future<void> deleteSetting(String id) async {
    await _dio.delete('/notifications/settings/$id');
  }

  /// Send a test notification to the registered device
  Future<void> sendTest(String playerId) async {
    await _dio.post('/notifications/test', data: {'player_id': playerId});
  }
}

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(dioProvider));
});
