import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidRequest({
    @required T? failedValue,
  }) = InvalidRequest<T>;

  const factory ValueFailure.invalidPassword({
    @required T? failedValue,
  }) = ShortPassword<T>;
}
