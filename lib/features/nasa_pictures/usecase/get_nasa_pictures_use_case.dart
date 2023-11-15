// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/config/local_storage/local_storage.dart';
import 'package:nasa_test/config/network/network_client.dart';
import 'package:nasa_test/shared/nasa_pictures_view_mixin.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_apod_response.dart';
import 'package:nasa_test/config/auth/keys.dart';
import 'package:nasa_test/features/nasa_pictures/notifier/nasa_pictures_notifier.dart';

const NASA_APOD_FETCH_KEY = 'NasaApodResponse-Fetch';

final getNasaPicturesUseCaseProvider = Provider<GetNasaPicturesUseCase>((ref) =>
    GetNasaPicturesUseCase(
        ref.read(networkClientProvider), ref.read(localStorageProvider)));

class GetNasaPicturesUseCase with NasaPicturesViewMixin {
  final NetworkClient _client;
  final LocalStorage _localStorage;
  GetNasaPicturesUseCase(this._client, this._localStorage);

  Future<List<NasaApodResponse>> execute(NasaArguments arguments) async {
    // await _localStorage.deleteKey('NasaApodResponse-Fetch');
    try {
      const int picsRequest = 10;
      const url =
          'https://api.nasa.gov/planetary/apod?api_key=$API_KEY&count=$picsRequest';
      final response = await _client.get(url);
      final List<NasaApodResponse> picturesList = List.from(response.data
          .map<NasaApodResponse>((i) => NasaApodResponse.fromJson(i)));

      final List<NasaApodResponse> storageList = await _buildData(
          key: NASA_APOD_FETCH_KEY, picturesList: picturesList);
      return buildVisibleData(list: storageList, arguments: arguments);
    } catch (e) {
      final List<NasaApodResponse> storageList =
          await _buildData(key: NASA_APOD_FETCH_KEY, picturesList: []);
      return buildVisibleData(list: storageList, arguments: arguments);
    }
  }

  Future<List<NasaApodResponse>> _buildData(
      {required String key,
      required List<NasaApodResponse> picturesList}) async {
    List<NasaApodResponse> storageList = await _readData(key);
    storageList.addAll(picturesList);
    _saveData(key, storageList);
    return storageList;
  }

  // save data to local storage
  void _saveData(String key, List<NasaApodResponse> picturesList) async {
    await _localStorage.setString(key, json.encode(picturesList));
  }

  // read and return data from local storage
  Future<List<NasaApodResponse>> _readData(String key) async {
    final String storageList = await _localStorage.getString(key) ?? '';
    List decodedList = storageList.isNotEmpty ? json.decode(storageList) : [];

    List<NasaApodResponse> picturesList = decodedList
        .map<NasaApodResponse>((e) => NasaApodResponse.fromJson(e))
        .toList();
    return picturesList;
  }
}
