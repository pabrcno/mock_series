import 'package:dartz/dartz.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

abstract class IShowServiceFacade {
  Either<ShowServiceFailure, bool> hello();
}
