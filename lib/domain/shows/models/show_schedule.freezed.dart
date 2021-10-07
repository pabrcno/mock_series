// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'show_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShowSchedule _$ShowScheduleFromJson(Map<String, dynamic> json) {
  return _ShowSchedule.fromJson(json);
}

/// @nodoc
class _$ShowScheduleTearOff {
  const _$ShowScheduleTearOff();

  _ShowSchedule call({required String time, required List<String> days}) {
    return _ShowSchedule(
      time: time,
      days: days,
    );
  }

  ShowSchedule fromJson(Map<String, Object> json) {
    return ShowSchedule.fromJson(json);
  }
}

/// @nodoc
const $ShowSchedule = _$ShowScheduleTearOff();

/// @nodoc
mixin _$ShowSchedule {
  String get time => throw _privateConstructorUsedError;
  List<String> get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowScheduleCopyWith<ShowSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowScheduleCopyWith<$Res> {
  factory $ShowScheduleCopyWith(
          ShowSchedule value, $Res Function(ShowSchedule) then) =
      _$ShowScheduleCopyWithImpl<$Res>;
  $Res call({String time, List<String> days});
}

/// @nodoc
class _$ShowScheduleCopyWithImpl<$Res> implements $ShowScheduleCopyWith<$Res> {
  _$ShowScheduleCopyWithImpl(this._value, this._then);

  final ShowSchedule _value;
  // ignore: unused_field
  final $Res Function(ShowSchedule) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? days = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      days: days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ShowScheduleCopyWith<$Res>
    implements $ShowScheduleCopyWith<$Res> {
  factory _$ShowScheduleCopyWith(
          _ShowSchedule value, $Res Function(_ShowSchedule) then) =
      __$ShowScheduleCopyWithImpl<$Res>;
  @override
  $Res call({String time, List<String> days});
}

/// @nodoc
class __$ShowScheduleCopyWithImpl<$Res> extends _$ShowScheduleCopyWithImpl<$Res>
    implements _$ShowScheduleCopyWith<$Res> {
  __$ShowScheduleCopyWithImpl(
      _ShowSchedule _value, $Res Function(_ShowSchedule) _then)
      : super(_value, (v) => _then(v as _ShowSchedule));

  @override
  _ShowSchedule get _value => super._value as _ShowSchedule;

  @override
  $Res call({
    Object? time = freezed,
    Object? days = freezed,
  }) {
    return _then(_ShowSchedule(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      days: days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShowSchedule implements _ShowSchedule {
  const _$_ShowSchedule({required this.time, required this.days});

  factory _$_ShowSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_ShowScheduleFromJson(json);

  @override
  final String time;
  @override
  final List<String> days;

  @override
  String toString() {
    return 'ShowSchedule(time: $time, days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowSchedule &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.days, days) ||
                const DeepCollectionEquality().equals(other.days, days)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(days);

  @JsonKey(ignore: true)
  @override
  _$ShowScheduleCopyWith<_ShowSchedule> get copyWith =>
      __$ShowScheduleCopyWithImpl<_ShowSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShowScheduleToJson(this);
  }
}

abstract class _ShowSchedule implements ShowSchedule {
  const factory _ShowSchedule(
      {required String time, required List<String> days}) = _$_ShowSchedule;

  factory _ShowSchedule.fromJson(Map<String, dynamic> json) =
      _$_ShowSchedule.fromJson;

  @override
  String get time => throw _privateConstructorUsedError;
  @override
  List<String> get days => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShowScheduleCopyWith<_ShowSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
