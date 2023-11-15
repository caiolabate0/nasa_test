import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';
import 'package:nasa_test/features/nasa_pictures/usecase/get_nasa_pictures_use_case.dart';

class NasaArguments extends Equatable {
  final int interval;
  final String? filter;
  const NasaArguments({required this.interval, this.filter});

  @override
  List<Object?> get props => [interval, filter];
}

final nasaPictureNotifierProvider =
    FutureProvider.family<NasaPicturesState, NasaArguments>((ref, args) async {
  final usecase = ref.read(getNasaPicturesUseCaseProvider);
  final response = await usecase.execute(args);
  int index = 0;
  return NasaPicturesState(
      pictures: response.map((e) {
    final picture = NasaPicture(
        id: index++,
        title: e.title ?? '',
        date: e.date ?? '',
        url: e.url ?? '',
        explanation: e.explanation ?? '',
        hdUrl: e.hdurl);
    return picture;
  }).toList());
});
