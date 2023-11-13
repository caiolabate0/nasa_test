// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nasa_apod_response.freezed.dart';
part 'nasa_apod_response.g.dart';

@freezed
class NasaApodResponse with _$NasaApodResponse {
  const factory NasaApodResponse({
    String? copyright,
    String? date,
    String? explanation,
    String? hdurl,
    String? media_type,
    String? service_version,
    String? title,
    String? url,
  }) = _NasaApodResponse;

  factory NasaApodResponse.fromJson(Map<String, dynamic> json) =>
      _$NasaApodResponseFromJson(json);
}
