import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/config/environment/develop_environment.dart';

final environmentProvider = Provider<EnvironmentConfigs>(
  (ref) => DevelopEnvironment(),
);

abstract class EnvironmentConfigs {
  String get baseUrl;
  ApiEnvironment get currentEnvironment;
}

enum ApiEnvironment { dev, prod }
