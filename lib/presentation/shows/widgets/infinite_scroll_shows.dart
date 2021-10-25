import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/widgets/add_favorite_tile.dart';

import 'package:mock_series/presentation/shows/widgets/show_presentation.dart';

class InfiniteScrollShows extends StatelessWidget {
  final ShowsController showsController = Get.put(getIt<ShowsController>());
  final FavoritesController favoritesController =
      Get.put(getIt<FavoritesController>());
  InfiniteScrollShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: showsController.memoryShowList.length,
          itemBuilder: (BuildContext context, int index) {
            favoritesController.setIsShowFavorite(
                showId: showsController.memoryShowList[index].id);
            return ShowPresentation(
                show: showsController.memoryShowList[index],
                actionTile: Obx(
                  () => AddFavoriteTile(
                      show: showsController.memoryShowList[index],
                      isFavorite: favoritesController.isFavoriteIndex[
                                  showsController.memoryShowList[index].id] ==
                              null
                          ? false
                          : favoritesController.isFavoriteIndex[
                              showsController.memoryShowList[index].id]!),
                ));
          },
        ),
      ));
    });
  }
}
