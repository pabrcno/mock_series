import 'package:freezed_annotation/freezed_annotation.dart';
part 'show_service_failure.freezed.dart';

@freezed
abstract class ShowServiceFailure with _$ShowServiceFailure {
  const factory ShowServiceFailure.rateLimit() = RateLimit;
  const factory ShowServiceFailure.unauthorized() = Unauthorized;
  const factory ShowServiceFailure.notFound() = NotFound;
  const factory ShowServiceFailure.timeout() = Timeout;
  const factory ShowServiceFailure.serverError() = ServerError;
}
