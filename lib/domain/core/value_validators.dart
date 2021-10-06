import 'package:dartz/dartz.dart';
import 'package:mock_series/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9 ]""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.noSpecialCharacters(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}
