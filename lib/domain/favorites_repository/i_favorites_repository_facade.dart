import 'package:dartz/dartz.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

abstract class IFavoritesRepositoryFacade {
  Future<Either<ShowServiceFailure, List<Show>>> getFavoriteShows();
  Future<Either<ShowServiceFailure, Unit>> writeFavoriteShow(
      {required Show show});
  Future<Either<ShowServiceFailure, Unit>> deleteFavoriteShow(
      {required int showId});
}
