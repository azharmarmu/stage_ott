import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<dynamic> request(
    String path, {
    required Method method,
    Map<String, dynamic>? data,
    bool formData = false,
    Map<String, dynamic>? queryParams,
    String? token,
    String contentType = 'application/json',
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    int? timeoutSeconds,
  }) async {
    try {
      await _checkConnectivity();
      final headers = _buildHeaders(contentType, token);

      final options = Options(
        method: method.name,
        headers: headers,
        sendTimeout:
            timeoutSeconds != null ? Duration(seconds: timeoutSeconds) : null,
        receiveTimeout:
            timeoutSeconds != null ? Duration(seconds: timeoutSeconds) : null,
      );

      Response response;
      switch (method) {
        case Method.get:
          response = await dio.get(
            path,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case Method.post:
          response = await dio.post(
            path,
            data: formData && data != null ? FormData.fromMap(data) : data,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case Method.put:
          response = await dio.put(
            path,
            data: formData && data != null ? FormData.fromMap(data) : data,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case Method.delete:
          response = await dio.delete(
            path,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        case Method.patch:
          response = await dio.patch(
            path,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelToken,
          );
          break;
      }
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } catch (error) {
      throw ApiException(error.toString());
    }
  }

  Map<String, dynamic> _buildHeaders(String contentType, String? token) {
    return {
      'accept': contentType,
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  dynamic _handleResponse(Response response) {
    if ([200, 201, 202].contains(response.statusCode)) {
      return response.data;
    } else {
      throw ApiException('Error: ${response.statusMessage}');
    }
  }

  Future<void> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw ApiException('No internet connection');
    }
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  factory ApiException.fromDioError(DioException e) {
    if (e.response != null) {
      return ApiException(e.response?.data['message'] ??
          e.response?.statusMessage ??
          'Unknown error');
    }
    return ApiException(e.message ?? 'Network error');
  }
}

enum Method { get, post, put, delete, patch }
