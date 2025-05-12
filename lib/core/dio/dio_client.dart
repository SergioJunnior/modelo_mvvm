abstract class DioClient {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams});
  Future<dynamic> post(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParams,
  });
  Future<dynamic> put(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParams,
  });
  Future<dynamic> delete(String path, {Map<String, dynamic>? queryParams});
}
