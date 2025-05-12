import 'package:dio/dio.dart';
import 'package:modelo_mvvm/core/dio/dio_client.dart';

class DioHttpClient implements DioClient {
  final Dio _dio;

  Dio get dioInstance => _dio;

  DioHttpClient([Dio? dio]) : _dio = dio ?? Dio() {
    _dio.interceptors.add(LogInterceptor());
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParams}) {
    return _dio.get(path, queryParameters: queryParams);
  }

  @override
  Future post(String path, data, {Map<String, dynamic>? queryParams}) {
    return _dio.post(path, data: data, queryParameters: queryParams);
  }

  @override
  Future put(String path, data, {Map<String, dynamic>? queryParams}) {
    return _dio.put(path, data: data, queryParameters: queryParams);
  }

  @override
  Future delete(String path, {Map<String, dynamic>? queryParams}) {
    return _dio.delete(path, queryParameters: queryParams);
  }
}
