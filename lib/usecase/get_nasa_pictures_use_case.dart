import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/model/nasa_response.dart';
import 'package:nasa_test/network/dio_client.dart';
import 'package:nasa_test/config/keys.dart';

final getNasaPicturesUseCaseProvider =
    Provider<GetNasaPicturesUseCase>((ref) => GetNasaPicturesUseCase(
          ref.read(networkClientProvider),
        ));

class GetNasaPicturesUseCase {
  final NetworkClient _client;
  GetNasaPicturesUseCase(this._client);

  Future<List<NasaResponse>> execute() async {
    const url = 'https://api.nasa.gov/planetary/apod?api_key=$API_KEY&count=20';
    final response = await _client.get(url);
    return List.from(response.data.map((i) => NasaResponse.fromJson(i)));
  }
}
