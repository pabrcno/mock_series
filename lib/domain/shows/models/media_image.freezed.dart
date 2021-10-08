// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaImage _$MediaImageFromJson(Map<String, dynamic> json) {
  return _MediaImage.fromJson(json);
}

/// @nodoc
class _$MediaImageTearOff {
  const _$MediaImageTearOff();

  _MediaImage call({required String? original, required String? medium}) {
    return _MediaImage(
      original: original,
      medium: medium,
    );
  }

  MediaImage fromJson(Map<String, Object> json) {
    return MediaImage.fromJson(json);
  }
}

/// @nodoc
const $MediaImage = _$MediaImageTearOff();

/// @nodoc
mixin _$MediaImage {
  String? get original => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaImageCopyWith<MediaImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaImageCopyWith<$Res> {
  factory $MediaImageCopyWith(
          MediaImage value, $Res Function(MediaImage) then) =
      _$MediaImageCopyWithImpl<$Res>;
  $Res call({String? original, String? medium});
}

/// @nodoc
class _$MediaImageCopyWithImpl<$Res> implements $MediaImageCopyWith<$Res> {
  _$MediaImageCopyWithImpl(this._value, this._then);

  final MediaImage _value;
  // ignore: unused_field
  final $Res Function(MediaImage) _then;

  @override
  $Res call({
    Object? original = freezed,
    Object? medium = freezed,
  }) {
    return _then(_value.copyWith(
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MediaImageCopyWith<$Res> implements $MediaImageCopyWith<$Res> {
  factory _$MediaImageCopyWith(
          _MediaImage value, $Res Function(_MediaImage) then) =
      __$MediaImageCopyWithImpl<$Res>;
  @override
  $Res call({String? original, String? medium});
}

/// @nodoc
class __$MediaImageCopyWithImpl<$Res> extends _$MediaImageCopyWithImpl<$Res>
    implements _$MediaImageCopyWith<$Res> {
  __$MediaImageCopyWithImpl(
      _MediaImage _value, $Res Function(_MediaImage) _then)
      : super(_value, (v) => _then(v as _MediaImage));

  @override
  _MediaImage get _value => super._value as _MediaImage;

  @override
  $Res call({
    Object? original = freezed,
    Object? medium = freezed,
  }) {
    return _then(_MediaImage(
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaImage implements _MediaImage {
  const _$_MediaImage({required this.original, required this.medium});

  factory _$_MediaImage.fromJson(Map<String, dynamic> json) =>
      _$$_MediaImageFromJson(json);

  @override
  final String? original;
  @override
  final String? medium;

  @override
  String toString() {
    return 'MediaImage(original: $original, medium: $medium)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MediaImage &&
            (identical(other.original, original) ||
                const DeepCollectionEquality()
                    .equals(other.original, original)) &&
            (identical(other.medium, medium) ||
                const DeepCollectionEquality().equals(other.medium, medium)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(original) ^
      const DeepCollectionEquality().hash(medium);

  @JsonKey(ignore: true)
  @override
  _$MediaImageCopyWith<_MediaImage> get copyWith =>
      __$MediaImageCopyWithImpl<_MediaImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaImageToJson(this);
  }
}

abstract class _MediaImage implements MediaImage {
  const factory _MediaImage(
      {required String? original, required String? medium}) = _$_MediaImage;

  factory _MediaImage.fromJson(Map<String, dynamic> json) =
      _$_MediaImage.fromJson;

  @override
  String? get original => throw _privateConstructorUsedError;
  @override
  String? get medium => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MediaImageCopyWith<_MediaImage> get copyWith =>
      throw _privateConstructorUsedError;
}
