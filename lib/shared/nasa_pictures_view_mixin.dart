import 'package:nasa_test/features/nasa_pictures/model/nasa_apod_response.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';
import 'package:nasa_test/features/nasa_pictures/notifier/nasa_pictures_notifier.dart';

class NasaPicturesViewMixin {
  List<NasaApodResponse> buildScreenData(
      {required List<NasaApodResponse> list,
      required NasaArguments arguments}) {
    String filter = arguments.filter ?? '';
    int interval = arguments.interval;

    if (filter.isEmpty) {
      list.shuffle();
      return list.take(interval).toList();
    } else {
      return list
          .where((element) =>
              element.title!.toLowerCase().contains(filter.toLowerCase()))
          .take(interval)
          .toList();
    }
  }

  String checkHdUrl(NasaPicture image) =>
      (image.hdUrl != null) ? (image.hdUrl ?? '') : image.url;
}
