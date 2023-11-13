import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final dioProvider = Provider((ref) {
//   return NetworkClient(_client)
// });

final networkClientProvider = Provider((ref) {
  var dio = Dio();
  return NetworkClient(dio);
});

class NetworkClient {
  final Dio _client;

  NetworkClient(
    this._client,
  );

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _client.get(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    return _client.post(
      path,
      data: body,
    );
  }
}
