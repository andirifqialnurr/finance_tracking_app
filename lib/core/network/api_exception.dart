/// Custom exception untuk mapping HTTP errors dari Dio ke domain layer.
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';

  /// True jika error karena saldo tidak cukup (400 dari backend)
  bool get isInsufficientBalance =>
      statusCode == 400 && message.toLowerCase().contains('insufficient');

  /// True jika error karena validasi input (422)
  bool get isValidation => statusCode == 422;

  /// True jika server error (5xx)
  bool get isServerError => statusCode != null && statusCode! >= 500;
}
