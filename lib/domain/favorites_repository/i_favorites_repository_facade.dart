import 'package:dartz/dartz.dart';
import 'package:mock_series/domain/favorites_repository/favorites_repository_failure.dart';
import 'package:mock_series/domain/shows/models/show.dart';

abstract class IFavoritesRepositoryFacade {
  List<Show> getFavoriteShows();
  bool isShowFavorite({required int showId});
  Future<Either<FavoritesRepositoryFailure, Unit>> writeFavoriteShow(
      {required Show show});
  Future<Either<FavoritesRepositoryFailure, Unit>> deleteFavoriteShow(
      {required int showId});
}
