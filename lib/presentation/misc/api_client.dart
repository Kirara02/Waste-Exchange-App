import 'dart:developer';

import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;

  ApiClient({
    String? baseUrl,
    String? defaultToken,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? 'https://api.test.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      ),
    );

    // Menambahkan headers setelah inisialisasi Dio
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Content-Type'] = 'application/json';

    if (defaultToken?.isNotEmpty ?? false) {
      _dio.options.headers['Authorization'] = "Bearer $defaultToken";
    }
  }

  Dio get dio => _dio;

  // Fungsi GET
  Future<Response> get(
    String endpoint, {
    bool authorization = false,
    String? token,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (authorization) _setAuthorization(token);

      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi POST
  Future<Response> post(
    String endpoint, {
    dynamic data,
    bool authorization = false,
    String? token,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (authorization) _setAuthorization(token);

      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi PUT
  Future<Response> put(
    String endpoint, {
    dynamic data,
    bool authorization = false,
    String? token,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (authorization) _setAuthorization(token);

      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi DELETE
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    bool authorization = false,
    String? token,
  }) async {
    try {
      if (authorization) _setAuthorization(token);

      final response = await _dio.delete(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi PATCH
  Future<Response> patch(
    String endpoint, {
    dynamic data,
    bool authorization = false,
    String? token,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (authorization) _setAuthorization(token);

      final response = await _dio.patch(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi DOWNLOAD
  Future<void> download(String url, String savePath) async {
    try {
      await _dio.download(url, savePath);
    } catch (e) {
      rethrow;
    }
  }

  void _setAuthorization(String? token) {
    if (token != null && token.isNotEmpty) {
      log("Authorization");

      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }
}
