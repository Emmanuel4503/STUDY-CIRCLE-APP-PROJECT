
abstract class ApiClient {
  ApiClient._();

  /// TODO: implement real requests once a networking package is added.
  static Future<T> get<T>(String path) async {
    throw UnimplementedError('ApiClient.get is not implemented yet.');
  }

  static Future<T> post<T>(String path, {Object? body}) async {
    throw UnimplementedError('ApiClient.post is not implemented yet.');
  }
}
