import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/favorites_repository/i_favorites_repository_facade.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';
import 'package:mock_series/domain/shows/models/show.dart';

@LazySingleton(as: IFavoritesRepositoryFacade)
class FavoritesRepository extends IFavoritesRepositoryFacade {
  @override
  Future<Either<ShowServiceFailure, Unit>> deleteFavoriteShow(
      {required int showId}) {
    // TODO: implement deleteFavoriteShow
    throw UnimplementedError();
  }

  @override
  Future<Either<ShowServiceFailure, List<Show>>> getFavoriteShows() {
    // TODO: implement getFavoriteShows
    throw UnimplementedError();
  }

  @override
  Future<Either<ShowServiceFailure, Unit>> writeFavoriteShow(
      {required Show show}) {
    // TODO: implement writeFavoriteShow
    throw UnimplementedError();
  }
}
