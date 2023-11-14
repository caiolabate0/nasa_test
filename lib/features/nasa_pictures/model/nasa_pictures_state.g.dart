// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_pictures_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NasaPicturesState _$$_NasaPicturesStateFromJson(Map<String, dynamic> json) =>
    _$_NasaPicturesState(
      pictures: (json['pictures'] as List<dynamic>)
          .map((e) => NasaPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NasaPicturesStateToJson(
        _$_NasaPicturesState instance) =>
    <String, dynamic>{
      'pictures': instance.pictures,
    };

_$_NasaPicture _$$_NasaPictureFromJson(Map<String, dynamic> json) =>
    _$_NasaPicture(
      id: json['id'] as int,
      title: json['title'] as String,
      date: json['date'] as String,
      explanation: json['explanation'] as String,
      url: json['url'] as String,
      hdUrl: json['hdUrl'] as String?,
    );

Map<String, dynamic> _$$_NasaPictureToJson(_$_NasaPicture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'explanation': instance.explanation,
      'url': instance.url,
      'hdUrl': instance.hdUrl,
    };
