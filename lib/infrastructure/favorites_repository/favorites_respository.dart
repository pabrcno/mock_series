import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/favorites_repository/favorites_repository_failure.dart';
import 'package:mock_series/domain/favorites_repository/i_favorites_repository_facade.dart';

import 'package:mock_series/domain/shows/models/show.dart';

@LazySingleton(as: IFavoritesRepositoryFacade)
class FavoritesRepository extends IFavoritesRepositoryFacade {
  final _favoritesRepo = GetStorage();
  final String _repoName = "favorites";

  Future<Either<FavoritesRepositoryFailure, Unit>>
      _intializeRepository() async {
    try {
      var favs = _favoritesRepo.read<Map<String, dynamic>>(_repoName);
      if (favs == null) {
        await _favoritesRepo.write(_repoName, <String, dynamic>{});
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
      var favorites = _favoritesRepo.read<Map<String, dynamic>>(_repoName);
      if (!favorites!.containsKey("${show.id}")) {
        favorites["${show.id}"] = json.encode(show.toJson());
      } else {
        throw Exception("Show already in favorites");
      }
      await _favoritesRepo.write(_repoName, favorites);
      return (right(unit));
    } on Exception catch (e) {
      if (e == Exception("Show already in favorites")) {
        return (left(const FavoritesRepositoryFailure.unableToUpdate()));
      }
      return (left(const FavoritesRepositoryFailure.unexpected()));
    }
  }

  @override
  List<Show> getFavoriteShows() {
    var favorites = _favoritesRepo.read<Map<String, dynamic>>(_repoName);
    if (favorites != null) {
      List<Show> favoritesList = favorites.values
          .map((element) => Show.fromJson(Map.from(json.decode(element))))
          .toList();
      favoritesList.sort((Show a, Show b) {
        return a.name!.compareTo(b.name!);
      });
      return (favoritesList);
    }
    return ([]);
  }

  @override
  Future<Either<FavoritesRepositoryFailure, Unit>> deleteFavoriteShow(
      {required int showId}) async {
    try {
      var favorites = _favoritesRepo.read<Map<String, dynamic>>(_repoName);

      if (favorites!.containsKey("$showId")) {
        favorites.remove("$showId");
      } else {
        throw Exception("Show not in favorites");
      }
      await _favoritesRepo.write(_repoName, favorites);
      return (right(unit));
    } on Exception catch (e) {
      if (e == Exception("Show not in favorites")) {
        return (left(const FavoritesRepositoryFailure.unableToUpdate()));
      }
      return (left(const FavoritesRepositoryFailure.unexpected()));
    }
  }

  @override
  bool isShowFavorite({required int showId}) {
    var favorites = _favoritesRepo.read<Map<String, dynamic>>(_repoName);
    if (favorites != null) {
      if (favorites.containsKey("$showId")) {
        return false;
      }
    }

    return true;
  }
}
