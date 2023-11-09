import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/model/nasa_pictures_state.dart';
import 'package:nasa_test/usecase/get_nasa_pictures_use_case.dart';

final nasaProvider = FutureProvider<NasaPicturesState>((ref) async {
  final usecase = ref.read(getNasaPicturesUseCaseProvider);
  final response = await usecase.execute();
  int index = 0;
  return NasaPicturesState(
      pictures: response.map((e) {
    final pic =
        NasaPicture(id: index, title: e.title ?? '', date: e.date ?? '');
    index++;
    return pic;
  }).toList());
});
