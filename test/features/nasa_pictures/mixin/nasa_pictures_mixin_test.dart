import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_test/shared/nasa_pictures_view_mixin.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_apod_response.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';
import 'package:nasa_test/features/nasa_pictures/notifier/nasa_pictures_notifier.dart';

import '../mock/nasa_apod_mock.dart';

class NasaPicturesViewMixinTest with NasaPicturesViewMixin {}

void main() {
  group('Test mixin.buildVisibleData method...', () {
    test(
        'WHEN method called THEN it should return the same lenght defined on interval parameter',
        () {
      final mixin = NasaPicturesViewMixinTest();
      const int interval = 3;
      const NasaArguments arguments = NasaArguments(interval: interval);
      List<NasaApodResponse> list = List.from(
          NasaApodMock.makeJson().map((i) => NasaApodResponse.fromJson(i)));

      final result = mixin.buildVisibleData(list: list, arguments: arguments);
      expect(result.length, interval);
    });

    test(
        'WHEN filter is passed THEN it should filter list where elements contain search text passed',
        () {
      final mixin = NasaPicturesViewMixinTest();
      const int interval = 5;
      const String filter = 'mars';
      const NasaArguments arguments =
          NasaArguments(interval: interval, filter: filter);
      List<NasaApodResponse> list = [
        const NasaApodResponse(title: 'This is jupiter'),
        const NasaApodResponse(title: 'This is earth'),
        const NasaApodResponse(title: 'This is mars'), // contains mars
        const NasaApodResponse(title: 'This is mars at night'), // contains mars
        const NasaApodResponse(title: 'This is the sun'),
        const NasaApodResponse(title: 'This is the moon'),
      ];

      final result = mixin.buildVisibleData(list: list, arguments: arguments);
      expect(result.length, 2);
    });
  });

  group('Test mixin.checkHdUrl method...', () {
    test(
        'WHEN image has a HD URL THEN it should return this corresponding HD Url',
        () {
      final mixin = NasaPicturesViewMixinTest();
      const NasaPicture imageWithHdUrl = NasaPicture(
          id: 1,
          title: 'title',
          date: 'date',
          explanation: 'explanation',
          url: 'link/to/url/image',
          hdUrl: 'link/to/hd/url/image');

      final url = mixin.checkHdUrl(imageWithHdUrl);
      expect(url, imageWithHdUrl.hdUrl);
    });

    test(
        'WHEN image DO NOT HAS a HD URL THEN it should return this corresponding regular Url',
        () {
      final mixin = NasaPicturesViewMixinTest();
      const NasaPicture imageWithoutHdUrl = NasaPicture(
          id: 1,
          title: 'title',
          date: 'date',
          explanation: 'explanation',
          url: 'link/to/url/image',
          hdUrl: null);

      final url = mixin.checkHdUrl(imageWithoutHdUrl);
      expect(url, imageWithoutHdUrl.url);
    });
  });
}
