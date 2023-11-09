import 'package:freezed_annotation/freezed_annotation.dart';

part 'nasa_pictures_state.freezed.dart';
part 'nasa_pictures_state.g.dart';

@freezed
class NasaPicturesState with _$NasaPicturesState {
  const factory NasaPicturesState({required List<NasaPicture> pictures}) =
      _NasaPicturesState;

  factory NasaPicturesState.fromJson(Map<String, dynamic> json) =>
      _$NasaPicturesStateFromJson(json);
}

@freezed
class NasaPicture with _$NasaPicture {
  const factory NasaPicture({
    required int id,
    required String title,
    required String date,
  }) = _NasaPicture;

  factory NasaPicture.fromJson(Map<String, dynamic> json) =>
      _$NasaPictureFromJson(json);
}
