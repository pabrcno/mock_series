import 'package:dartz/dartz.dart';
import 'package:mock_series/domain/core/failures.dart';

Either<ValueFailure<String>, String> validatePassword(String input) {
  // Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:
  if (input.length >= 4) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}
