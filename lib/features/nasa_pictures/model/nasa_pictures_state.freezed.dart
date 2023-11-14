// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nasa_pictures_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NasaPicturesState _$NasaPicturesStateFromJson(Map<String, dynamic> json) {
  return _NasaPicturesState.fromJson(json);
}

/// @nodoc
mixin _$NasaPicturesState {
  List<NasaPicture> get pictures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NasaPicturesStateCopyWith<NasaPicturesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NasaPicturesStateCopyWith<$Res> {
  factory $NasaPicturesStateCopyWith(
          NasaPicturesState value, $Res Function(NasaPicturesState) then) =
      _$NasaPicturesStateCopyWithImpl<$Res, NasaPicturesState>;
  @useResult
  $Res call({List<NasaPicture> pictures});
}

/// @nodoc
class _$NasaPicturesStateCopyWithImpl<$Res, $Val extends NasaPicturesState>
    implements $NasaPicturesStateCopyWith<$Res> {
  _$NasaPicturesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictures = null,
  }) {
    return _then(_value.copyWith(
      pictures: null == pictures
          ? _value.pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<NasaPicture>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NasaPicturesStateCopyWith<$Res>
    implements $NasaPicturesStateCopyWith<$Res> {
  factory _$$_NasaPicturesStateCopyWith(_$_NasaPicturesState value,
          $Res Function(_$_NasaPicturesState) then) =
      __$$_NasaPicturesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NasaPicture> pictures});
}

/// @nodoc
class __$$_NasaPicturesStateCopyWithImpl<$Res>
    extends _$NasaPicturesStateCopyWithImpl<$Res, _$_NasaPicturesState>
    implements _$$_NasaPicturesStateCopyWith<$Res> {
  __$$_NasaPicturesStateCopyWithImpl(
      _$_NasaPicturesState _value, $Res Function(_$_NasaPicturesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictures = null,
  }) {
    return _then(_$_NasaPicturesState(
      pictures: null == pictures
          ? _value._pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<NasaPicture>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NasaPicturesState implements _NasaPicturesState {
  const _$_NasaPicturesState({required final List<NasaPicture> pictures})
      : _pictures = pictures;

  factory _$_NasaPicturesState.fromJson(Map<String, dynamic> json) =>
      _$$_NasaPicturesStateFromJson(json);

  final List<NasaPicture> _pictures;
  @override
  List<NasaPicture> get pictures {
    if (_pictures is EqualUnmodifiableListView) return _pictures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pictures);
  }

  @override
  String toString() {
    return 'NasaPicturesState(pictures: $pictures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NasaPicturesState &&
            const DeepCollectionEquality().equals(other._pictures, _pictures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pictures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NasaPicturesStateCopyWith<_$_NasaPicturesState> get copyWith =>
      __$$_NasaPicturesStateCopyWithImpl<_$_NasaPicturesState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NasaPicturesStateToJson(
      this,
    );
  }
}

abstract class _NasaPicturesState implements NasaPicturesState {
  const factory _NasaPicturesState(
      {required final List<NasaPicture> pictures}) = _$_NasaPicturesState;

  factory _NasaPicturesState.fromJson(Map<String, dynamic> json) =
      _$_NasaPicturesState.fromJson;

  @override
  List<NasaPicture> get pictures;
  @override
  @JsonKey(ignore: true)
  _$$_NasaPicturesStateCopyWith<_$_NasaPicturesState> get copyWith =>
      throw _privateConstructorUsedError;
}

NasaPicture _$NasaPictureFromJson(Map<String, dynamic> json) {
  return _NasaPicture.fromJson(json);
}

/// @nodoc
mixin _$NasaPicture {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get hdUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NasaPictureCopyWith<NasaPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NasaPictureCopyWith<$Res> {
  factory $NasaPictureCopyWith(
          NasaPicture value, $Res Function(NasaPicture) then) =
      _$NasaPictureCopyWithImpl<$Res, NasaPicture>;
  @useResult
  $Res call(
      {int id,
      String title,
      String date,
      String explanation,
      String url,
      String? hdUrl});
}

/// @nodoc
class _$NasaPictureCopyWithImpl<$Res, $Val extends NasaPicture>
    implements $NasaPictureCopyWith<$Res> {
  _$NasaPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? date = null,
    Object? explanation = null,
    Object? url = null,
    Object? hdUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hdUrl: freezed == hdUrl
          ? _value.hdUrl
          : hdUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NasaPictureCopyWith<$Res>
    implements $NasaPictureCopyWith<$Res> {
  factory _$$_NasaPictureCopyWith(
          _$_NasaPicture value, $Res Function(_$_NasaPicture) then) =
      __$$_NasaPictureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String date,
      String explanation,
      String url,
      String? hdUrl});
}

/// @nodoc
class __$$_NasaPictureCopyWithImpl<$Res>
    extends _$NasaPictureCopyWithImpl<$Res, _$_NasaPicture>
    implements _$$_NasaPictureCopyWith<$Res> {
  __$$_NasaPictureCopyWithImpl(
      _$_NasaPicture _value, $Res Function(_$_NasaPicture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? date = null,
    Object? explanation = null,
    Object? url = null,
    Object? hdUrl = freezed,
  }) {
    return _then(_$_NasaPicture(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hdUrl: freezed == hdUrl
          ? _value.hdUrl
          : hdUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NasaPicture implements _NasaPicture {
  const _$_NasaPicture(
      {required this.id,
      required this.title,
      required this.date,
      required this.explanation,
      required this.url,
      this.hdUrl});

  factory _$_NasaPicture.fromJson(Map<String, dynamic> json) =>
      _$$_NasaPictureFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String date;
  @override
  final String explanation;
  @override
  final String url;
  @override
  final String? hdUrl;

  @override
  String toString() {
    return 'NasaPicture(id: $id, title: $title, date: $date, explanation: $explanation, url: $url, hdUrl: $hdUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NasaPicture &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.hdUrl, hdUrl) || other.hdUrl == hdUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, date, explanation, url, hdUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NasaPictureCopyWith<_$_NasaPicture> get copyWith =>
      __$$_NasaPictureCopyWithImpl<_$_NasaPicture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NasaPictureToJson(
      this,
    );
  }
}

abstract class _NasaPicture implements NasaPicture {
  const factory _NasaPicture(
      {required final int id,
      required final String title,
      required final String date,
      required final String explanation,
      required final String url,
      final String? hdUrl}) = _$_NasaPicture;

  factory _NasaPicture.fromJson(Map<String, dynamic> json) =
      _$_NasaPicture.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get date;
  @override
  String get explanation;
  @override
  String get url;
  @override
  String? get hdUrl;
  @override
  @JsonKey(ignore: true)
  _$$_NasaPictureCopyWith<_$_NasaPicture> get copyWith =>
      throw _privateConstructorUsedError;
}
