import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/favorites_repository/favorites_repository_failure.dart';
import 'package:mock_series/domain/favorites_repository/i_favorites_repository_facade.dart';

import 'package:mock_series/domain/shows/models/show.dart';

@LazySingleton(as: IFavoritesRepositoryFacade)
class FavoritesRepository extends IFavoritesRepositoryFacade {
  final _favoritesRepo = GetStorage();

  Future<Either<FavoritesRepositoryFailure, Unit>>
      _intializeRepository() async {
    try {
      var favs = await _favoritesRepo.read("favorites");
      if (favs == null) {
        await _favoritesRepo.write("favorites", <int, Show>{});
      }
      return (right(unit));
    } catch (e) {
      return (left(const FavoritesRepositoryFailure.unexpected()));
    }
  }

  @override
  Future<Either<FavoritesRepositoryFailure, Unit>> writeFavoriteShow(
      {required Show show}) async {
    try {
      await _intializeRepository();
      Map<int, Show> favorites = await _favoritesRepo.read("favorites");
      if (!favorites.containsKey(show.id)) {
        favorites[show.id] = show;
      } else {
        throw Exception("Show already in favorites");
      }
      await _favoritesRepo.write("favorites", favorites);
      return (right(unit));
    } on Exception catch (e) {
      if (e == Exception("Show already in favorites")) {
        return (left(const FavoritesRepositoryFailure.unableToUpdate()));
      }
      return (left(const FavoritesRepositoryFailure.unexpected()));
    }
  }

  @override
  Future<Either<FavoritesRepositoryFailure, List<Show>>>
      getFavoriteShows() async {
    try {
      await _intializeRepository();
      Map<int, Show> favorites = await _favoritesRepo.read("favorites");
      List<Show> favoritesList =
          favorites.values.map((Show show) => show).toList();
      favoritesList.sort((Show a, Show b) {
        return a.name!.compareTo(b.name!);
      });
      return (right(favoritesList));
    } on Exception catch (e) {
      if (e == Exception("Show already in favorites")) {
        return (left(const FavoritesRepositoryFailure.unableToUpdate()));
      }
      return (left(const FavoritesRepositoryFailure.unexpected()));
    }
  }

  @override
  Future<Either<FavoritesRepositoryFailure, Unit>> deleteFavoriteShow(
      {required int showId}) async {
    try {
      await _intializeRepository();
      Map<int, Show> favorites = await _favoritesRepo.read("favorites");
      if (!favorites.containsKey(showId)) {
        favorites.remove(showId);
      } else {
        throw Exception("Show not in favorites");
      }
      await _favoritesRepo.write("favorites", favorites);
      return (right(unit));
    } on Exception catch (e) {
      if (e == Exception("Show not in favorites")) {
        return (left(const FavoritesRepositoryFailure.unableToUpdate()));
      }
      return (left(const FavoritesRepositoryFailure.unexpected()));
    }
  }
}
