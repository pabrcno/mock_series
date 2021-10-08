// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'show.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Show _$ShowFromJson(Map<String, dynamic> json) {
  return _Show.fromJson(json);
}

/// @nodoc
class _$ShowTearOff {
  const _$ShowTearOff();

  _Show call(
      {required int id,
      required String? url,
      required String? name,
      required String? language,
      required List<String>? genres,
      String? premiered,
      required ShowSchedule? schedule,
      required String? summary,
      required MediaImage? image}) {
    return _Show(
      id: id,
      url: url,
      name: name,
      language: language,
      genres: genres,
      premiered: premiered,
      schedule: schedule,
      summary: summary,
      image: image,
    );
  }

  Show fromJson(Map<String, Object> json) {
    return Show.fromJson(json);
  }
}

/// @nodoc
const $Show = _$ShowTearOff();

/// @nodoc
mixin _$Show {
  int get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;
  String? get premiered => throw _privateConstructorUsedError;
  ShowSchedule? get schedule =>
      throw _privateConstructorUsedError; //HTML format
  String? get summary => throw _privateConstructorUsedError;
  MediaImage? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowCopyWith<Show> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowCopyWith<$Res> {
  factory $ShowCopyWith(Show value, $Res Function(Show) then) =
      _$ShowCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? url,
      String? name,
      String? language,
      List<String>? genres,
      String? premiered,
      ShowSchedule? schedule,
      String? summary,
      MediaImage? image});

  $ShowScheduleCopyWith<$Res>? get schedule;
  $MediaImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$ShowCopyWithImpl<$Res> implements $ShowCopyWith<$Res> {
  _$ShowCopyWithImpl(this._value, this._then);

  final Show _value;
  // ignore: unused_field
  final $Res Function(Show) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? name = freezed,
    Object? language = freezed,
    Object? genres = freezed,
    Object? premiered = freezed,
    Object? schedule = freezed,
    Object? summary = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      premiered: premiered == freezed
          ? _value.premiered
          : premiered // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ShowSchedule?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as MediaImage?,
    ));
  }

  @override
  $ShowScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ShowScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }

  @override
  $MediaImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $MediaImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$ShowCopyWith<$Res> implements $ShowCopyWith<$Res> {
  factory _$ShowCopyWith(_Show value, $Res Function(_Show) then) =
      __$ShowCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? url,
      String? name,
      String? language,
      List<String>? genres,
      String? premiered,
      ShowSchedule? schedule,
      String? summary,
      MediaImage? image});

  @override
  $ShowScheduleCopyWith<$Res>? get schedule;
  @override
  $MediaImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$ShowCopyWithImpl<$Res> extends _$ShowCopyWithImpl<$Res>
    implements _$ShowCopyWith<$Res> {
  __$ShowCopyWithImpl(_Show _value, $Res Function(_Show) _then)
      : super(_value, (v) => _then(v as _Show));

  @override
  _Show get _value => super._value as _Show;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? name = freezed,
    Object? language = freezed,
    Object? genres = freezed,
    Object? premiered = freezed,
    Object? schedule = freezed,
    Object? summary = freezed,
    Object? image = freezed,
  }) {
    return _then(_Show(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      premiered: premiered == freezed
          ? _value.premiered
          : premiered // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ShowSchedule?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as MediaImage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Show implements _Show {
  const _$_Show(
      {required this.id,
      required this.url,
      required this.name,
      required this.language,
      required this.genres,
      this.premiered,
      required this.schedule,
      required this.summary,
      required this.image});

  factory _$_Show.fromJson(Map<String, dynamic> json) => _$$_ShowFromJson(json);

  @override
  final int id;
  @override
  final String? url;
  @override
  final String? name;
  @override
  final String? language;
  @override
  final List<String>? genres;
  @override
  final String? premiered;
  @override
  final ShowSchedule? schedule;
  @override //HTML format
  final String? summary;
  @override
  final MediaImage? image;

  @override
  String toString() {
    return 'Show(id: $id, url: $url, name: $name, language: $language, genres: $genres, premiered: $premiered, schedule: $schedule, summary: $summary, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Show &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.genres, genres) ||
                const DeepCollectionEquality().equals(other.genres, genres)) &&
            (identical(other.premiered, premiered) ||
                const DeepCollectionEquality()
                    .equals(other.premiered, premiered)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(genres) ^
      const DeepCollectionEquality().hash(premiered) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$ShowCopyWith<_Show> get copyWith =>
      __$ShowCopyWithImpl<_Show>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShowToJson(this);
  }
}

abstract class _Show implements Show {
  const factory _Show(
      {required int id,
      required String? url,
      required String? name,
      required String? language,
      required List<String>? genres,
      String? premiered,
      required ShowSchedule? schedule,
      required String? summary,
      required MediaImage? image}) = _$_Show;

  factory _Show.fromJson(Map<String, dynamic> json) = _$_Show.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get language => throw _privateConstructorUsedError;
  @override
  List<String>? get genres => throw _privateConstructorUsedError;
  @override
  String? get premiered => throw _privateConstructorUsedError;
  @override
  ShowSchedule? get schedule => throw _privateConstructorUsedError;
  @override //HTML format
  String? get summary => throw _privateConstructorUsedError;
  @override
  MediaImage? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShowCopyWith<_Show> get copyWith => throw _privateConstructorUsedError;
}
