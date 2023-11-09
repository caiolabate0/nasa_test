// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NasaResponse _$$_NasaResponseFromJson(Map<String, dynamic> json) =>
    _$_NasaResponse(
      copyright: json['copyright'] as String?,
      date: json['date'] as String?,
      explanation: json['explanation'] as String?,
      hdurl: json['hdurl'] as String?,
      media_type: json['media_type'] as String?,
      service_version: json['service_version'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_NasaResponseToJson(_$_NasaResponse instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'media_type': instance.media_type,
      'service_version': instance.service_version,
      'title': instance.title,
      'url': instance.url,
    };
