import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/app_config.dart';
import 'api_exception.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // Log request/response di debug mode
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );

  // Global error mapping
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (DioException e, ErrorInterceptorHandler handler) {
        final statusCode = e.response?.statusCode;
        final message = e.response?.data is Map
            ? (e.response?.data['error'] ??
                  e.response?.data['message'] ??
                  'Terjadi kesalahan')
            : e.message ?? 'Terjadi kesalahan';

        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.connectionError) {
          handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              error: ApiException(
                message:
                    'Tidak ada koneksi internet atau server tidak dapat dijangkau',
                statusCode: null,
              ),
              type: e.type,
            ),
          );
          return;
        }

        handler.reject(
          DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            error: ApiException(
              message: message as String,
              statusCode: statusCode,
            ),
            type: e.type,
          ),
        );
      },
    ),
  );

  return dio;
});
