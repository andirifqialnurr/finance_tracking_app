import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/app_constants.dart';

/// Base API client untuk handle HTTP requests
class ApiClient {
  final String baseUrl;
  final http.Client _httpClient;

  ApiClient({String? baseUrl, http.Client? httpClient})
    : baseUrl = baseUrl ?? AppConstants.apiBaseUrl,
      _httpClient = httpClient ?? http.Client();

  /// GET request
  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParams);
      final response = await _httpClient.get(
        uri,
        headers: _buildHeaders(headers),
      );

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('GET request failed: ${e.toString()}');
    }
  }

  /// POST request
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      final response = await _httpClient.post(
        uri,
        headers: _buildHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      );

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('POST request failed: ${e.toString()}');
    }
  }

  /// PUT request
  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      final response = await _httpClient.put(
        uri,
        headers: _buildHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      );

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('PUT request failed: ${e.toString()}');
    }
  }

  /// DELETE request
  Future<dynamic> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      final response = await _httpClient.delete(
        uri,
        headers: _buildHeaders(headers),
      );

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('DELETE request failed: ${e.toString()}');
    }
  }

  /// Build URI dengan query parameters
  Uri _buildUri(String endpoint, [Map<String, String>? queryParams]) {
    final uri = Uri.parse('$baseUrl$endpoint');
    if (queryParams != null && queryParams.isNotEmpty) {
      return uri.replace(queryParameters: queryParams);
    }
    return uri;
  }

  /// Build headers dengan default content-type
  Map<String, String> _buildHeaders(Map<String, String>? customHeaders) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }

  /// Handle HTTP response
  dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      if (response.body.isEmpty) {
        return null;
      }
      return jsonDecode(response.body);
    } else if (statusCode == 400) {
      final error = jsonDecode(response.body);
      throw BadRequestException(
        error['message'] ?? 'Bad request',
        errors: error['errors'],
      );
    } else if (statusCode == 401) {
      throw UnauthorizedException('Unauthorized access');
    } else if (statusCode == 404) {
      throw NotFoundException('Resource not found');
    } else if (statusCode == 500) {
      throw ServerException('Internal server error');
    } else {
      throw ApiException('Request failed with status: $statusCode');
    }
  }

  void dispose() {
    _httpClient.close();
  }
}

/// Base API Exception
class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;
}

/// Bad Request Exception (400)
class BadRequestException extends ApiException {
  final Map<String, dynamic>? errors;

  BadRequestException(super.message, {this.errors});

  @override
  String toString() {
    if (errors != null) {
      return '$message\nErrors: $errors';
    }
    return message;
  }
}

/// Unauthorized Exception (401)
class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message);
}

/// Not Found Exception (404)
class NotFoundException extends ApiException {
  NotFoundException(super.message);
}

/// Server Exception (500)
class ServerException extends ApiException {
  ServerException(super.message);
}
