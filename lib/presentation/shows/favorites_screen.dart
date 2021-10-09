import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/widgets/show_presentation.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoritesController favoritesController =
        Get.put(getIt<FavoritesController>());
    favoritesController.setFavoritesList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Mock Series"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
            color: Colors.red,
          )
        ],
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
            child: Stack(
              children: <Widget>[
                Center(
                    child: favoritesController.favoritesList.isEmpty
                        ? const Text("You don't have any favorites yet 💔",
                            style: TextStyle(fontSize: 24))
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                                child: Column(children: [
                              ...favoritesController.favoritesList
                                  .map((show) => ShowPresentation(show: show))
                                  .toList(),
                            ])),
                          ))
              ],
            ),
          )),
    );
  }
}
