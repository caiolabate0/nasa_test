// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'nasa_apod_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NasaApodResponse _$$_NasaApodResponseFromJson(Map<String, dynamic> json) =>
    _$_NasaApodResponse(
      copyright: json['copyright'] as String?,
      date: json['date'] as String?,
      explanation: json['explanation'] as String?,
      hdurl: json['hdurl'] as String?,
      media_type: json['media_type'] as String?,
      service_version: json['service_version'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_NasaApodResponseToJson(_$_NasaApodResponse instance) =>
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
