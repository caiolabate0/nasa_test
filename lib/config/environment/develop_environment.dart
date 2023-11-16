import 'package:nasa_test/config/environment/environment.dart';

class DevelopEnvironment extends EnvironmentConfigs {
  @override
  String get baseUrl => 'https://api.nasa.gov/planetary/';

  @override
  ApiEnvironment get currentEnvironment => ApiEnvironment.dev;
}
