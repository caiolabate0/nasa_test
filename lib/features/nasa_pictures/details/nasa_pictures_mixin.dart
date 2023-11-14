import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';

class NasaPicturesMixin {
  String checkHdUrl(NasaPicture image) =>
      (image.hdUrl != null) ? (image.hdUrl ?? '') : image.url;
}
