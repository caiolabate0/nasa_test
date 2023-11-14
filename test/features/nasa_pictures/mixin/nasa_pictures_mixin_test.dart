import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_test/features/nasa_pictures/details/nasa_pictures_mixin.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';

class NasaPicturesMixinTest with NasaPicturesMixin {}

void main() {
  test(
      'WHEN mixin.checkHdUrl is called and image has a HD URL THEN it should return this corresponding HD Url',
      () {
    final mixin = NasaPicturesMixinTest();
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
      'WHEN mixin.checkHdUrl is called and image DO NOT HAS a HD URL THEN it should return this corresponding regular Url',
      () {
    final mixin = NasaPicturesMixinTest();
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
}
