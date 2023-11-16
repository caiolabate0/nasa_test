import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/config/environment/environment.dart';

final networkClientProvider = Provider((ref) {
  var dio = Dio();
  return NetworkClient(dio, ref.read(environmentProvider));
});

class NetworkClient {
  final Dio _client;
  final EnvironmentConfigs _env;

  NetworkClient(
    this._client,
    this._env,
  );

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _client.get(
      '${_env.baseUrl}$path',
      queryParameters: queryParameters,
    );
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    return _client.post(
      '${_env.baseUrl}$path',
      data: body,
    );
  }
}
