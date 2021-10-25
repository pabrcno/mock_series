import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/favorites_repository/favorites_repository_failure.dart';
import 'package:mock_series/domain/favorites_repository/i_favorites_repository_facade.dart';

import 'package:mock_series/domain/shows/models/show.dart';
import 'package:flutter/material.dart';

@injectable
class FavoritesController extends GetxController {
  final IFavoritesRepositoryFacade _favoritesRepo;
  RxList<Show> favoritesList = <Show>[].obs;
  RxMap<int, bool> isFavoriteIndex = <int, bool>{}.obs;
  FavoritesController(this._favoritesRepo);
  @override
  onInit() {
    super.onInit();
    setFavoritesList();
  }

  setFavoritesList() {
    favoritesList.value = _favoritesRepo.getFavoriteShows();
    for (var element in favoritesList) {
      isFavoriteIndex[element.id] = true;
    }
  }

  addFavorite({required Show show}) async {
    Either<FavoritesRepositoryFailure, Unit> addFavoriteOption =
        await _favoritesRepo.writeFavoriteShow(show: show);

    addFavoriteOption.fold(
        (l) => showSnackBar(
            title: "Error adding favorite",
            success: false,
            message: l.map(
                serverError: (_) => "serverError",
                unexpected: (_) => "unexpected",
                insufficientPermission: (_) => "insufficientPermission",
                unableToUpdate: (_) => "unableToUpdate")), (_) async {
      await setFavoritesList();
      setIsShowFavorite(showId: show.id);
      showSnackBar(title: "Favorite Added!", message: "❤️");
    });
  }

  deleteFavorite({required int showId}) async {
    Either<FavoritesRepositoryFailure, Unit> removeFavoriteOption =
        await _favoritesRepo.deleteFavoriteShow(showId: showId);

    removeFavoriteOption.fold(
        (l) => showSnackBar(
            title: "Error removing favorite",
            success: false,
            message: l.map(
                serverError: (_) => "serverError",
                unexpected: (_) => "unexpected",
                insufficientPermission: (_) => "insufficientPermission",
                unableToUpdate: (_) => "unableToUpdate")), (_) async {
      await setFavoritesList();
      setIsShowFavorite(showId: showId);
      showSnackBar(title: "Favorite Removed!", message: ":(");
    });
  }

  setIsShowFavorite({required showId}) {
    isFavoriteIndex[showId] = _favoritesRepo.isShowFavorite(showId: showId);
  }

  getIsShowFavorite({required showId}) {
    return isFavoriteIndex[showId] ?? false;
  }
}

showSnackBar(
    {required String title, required String message, bool success = true}) {
  if (Get.isSnackbarOpen!) return;
  return Get.showSnackbar(
    GetBar(
      title: title,
      message: message,
      backgroundColor: success ? Colors.pink[200]! : Colors.red,
      isDismissible: true,
      duration: const Duration(seconds: 2),
    ),
  );
}
