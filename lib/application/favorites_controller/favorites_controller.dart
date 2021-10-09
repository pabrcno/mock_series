import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/favorites_repository/favorites_repository_failure.dart';
import 'package:mock_series/domain/favorites_repository/i_favorites_repository_facade.dart';
import 'package:mock_series/domain/shows/models/show.dart';

@injectable
class FavoritesController extends GetxController {
  final IFavoritesRepositoryFacade _favoritesRepo;
  List<Show> favoritesList = <Show>[].obs;

  FavoritesController(this._favoritesRepo);

  setFavoritesList() async {
    Either<FavoritesRepositoryFailure, List<Show>> favoritesOption =
        await _favoritesRepo.getFavoriteShows();
    favoritesOption.fold(
        (l) => print("FAIL SET FAVORITES"), (favs) => favoritesList = favs);
  }

  addFavorite({required Show show}) async {
    Either<FavoritesRepositoryFailure, Unit> addFavoriteOption =
        await _favoritesRepo.writeFavoriteShow(show: show);

    addFavoriteOption.fold((l) => print("FAILED FAVORITE ADDED"), (_) async {
      await setFavoritesList();
    });
  }

  deleteFavoriteShow({required int showId}) async {
    Either<FavoritesRepositoryFailure, Unit> removeFavoriteOption =
        await _favoritesRepo.deleteFavoriteShow(showId: showId);

    removeFavoriteOption.fold((l) => print("FAILED FAVORITE REMOVED"),
        (_) => print("FAVORITE REMOVED"));
  }
}
