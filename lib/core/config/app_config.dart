class AppConfig {
  /// Base URL untuk backend API.
  /// Android emulator: 10.0.2.2 adalah alias ke localhost host mesin.
  /// iOS Simulator / Web: gunakan localhost langsung.
  static const String baseUrl = 'http://10.0.2.2:8081/api/v1';
  // static const String baseUrl = 'http://localhost:8081/api/v1';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
