import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_test/config/local_storage/local_storage.dart';
import 'package:nasa_test/config/network/network_client.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_apod_response.dart';
import 'package:nasa_test/features/nasa_pictures/notifier/nasa_pictures_notifier.dart';
import 'package:nasa_test/features/nasa_pictures/usecase/get_nasa_pictures_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nasa_test/config/auth/keys.dart';

import '../mock/nasa_apod_mock.dart';

class NetworkClientSpy extends Mock implements NetworkClient {}

void main() {
  late LocalStorage localStorage;
  late NetworkClientSpy networkClientSpy;
  late GetNasaPicturesUseCase sut;
  late List<NasaApodResponse> success;
  late DioException failure;

  const int cardsQt = 10;
  const String url =
      'https://api.nasa.gov/planetary/apod?api_key=$API_KEY&count=$cardsQt';

  When mockCallRequest() => when(() => networkClientSpy.get(url));

  setUp(() async {
    networkClientSpy = NetworkClientSpy();
    localStorage = SharedPreferencesLocalStorage(
        prefs: () => SharedPreferences.getInstance());
    SharedPreferences.setMockInitialValues({});
    sut = GetNasaPicturesUseCase(networkClientSpy, localStorage);
    failure = DioException(requestOptions: RequestOptions());
  });

  setUp(() {
    success = List.from(
        NasaApodMock.makeJson().map((i) => NasaApodResponse.fromJson(i)));
  });

  test(
      'WHEN call GetNasaPicturesUseCase.execute THEN ensure call networkClient.get once',
      () async {
    mockCallRequest().thenAnswer(
      (_) async => NasaApodMock.makeJson(),
    );
    await sut.execute(const NasaArguments(interval: cardsQt));

    verify(() => networkClientSpy.get(url)).called(1);
  });

  test(
      'WHEN call GetNasaPicturesUseCase.execute THEN returns a List<NasaApodResponse>',
      () async {
    mockCallRequest().thenAnswer(
      (_) async => NasaApodMock.makeJson(),
    );
    final result = await sut.execute(const NasaArguments(interval: cardsQt));
    expect(result.runtimeType, success.runtimeType);
  });

  test(
      'WHEN request fail THEN must not throw an Error, otherwise must return a list recovered from local storage',
      () async {
    mockCallRequest().thenThrow(failure);
    final result = await sut.execute(const NasaArguments(interval: cardsQt));
    expect(result.runtimeType, success.runtimeType);
  });
}
