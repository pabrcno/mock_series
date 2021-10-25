import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/widgets/add_favorite_tile.dart';
import 'package:mock_series/presentation/shows/widgets/remove_favorite_tile.dart';

import 'package:mock_series/presentation/shows/widgets/show_presentation.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController favoritesController =
      Get.put(getIt<FavoritesController>());
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Favorites"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/favorites_background.png"))),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(() => Center(
              child: favoritesController.favoritesList.isEmpty
                  ? const Text("You don't have any favorites 💔",
                      style: TextStyle(fontSize: 24))
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...favoritesController.favoritesList
                                .map((show) => ShowPresentation(
                                      show: show,
                                      actionTile:
                                          RemoveFavoriteTile(show: show),
                                    ))
                                .toList()
                          ],
                        ),
                      ),
                    ))),
        ),
      ),
    );
  }
}
