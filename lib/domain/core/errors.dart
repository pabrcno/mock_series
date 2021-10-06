import 'package:mock_series/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFalure;

  UnexpectedValueError(this.valueFalure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was $valueFalure');
  }
}
