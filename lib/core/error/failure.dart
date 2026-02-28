import '../network/api_exception.dart';

/// Sealed class hierarki untuk error handling di domain layer.
/// Digunakan bersama dartz Either<Failure, T>.
sealed class Failure {
  final String message;
  const Failure(this.message);
}

/// Error dari server (HTTP 4xx / 5xx)
class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  factory ServerFailure.fromApi(ApiException e) =>
      ServerFailure(e.message, statusCode: e.statusCode);
}

/// Tidak ada koneksi internet atau server tidak dapat dijangkau
class NetworkFailure extends Failure {
  const NetworkFailure() : super('Tidak ada koneksi internet');
}

/// Validasi form gagal — berisi map field → pesan error
class ValidationFailure extends Failure {
  final Map<String, String> errors;
  const ValidationFailure(this.errors) : super('Validasi gagal');
}

/// Saldo akun tidak mencukupi untuk transaksi
class InsufficientBalanceFailure extends Failure {
  const InsufficientBalanceFailure() : super('Saldo akun tidak mencukupi');
}

/// Error yang tidak diketahui / tidak terduga
class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Terjadi kesalahan tidak terduga'])
    : super(message);
}
