// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nasa_response.freezed.dart';
part 'nasa_response.g.dart';

@freezed
class NasaResponse with _$NasaResponse {
  const factory NasaResponse({
    String? copyright,
    String? date,
    String? explanation,
    String? hdurl,
    String? media_type,
    String? service_version,
    String? title,
    String? url,
  }) = _NasaResponse;

  factory NasaResponse.fromJson(Map<String, dynamic> json) =>
      _$NasaResponseFromJson(json);
}
