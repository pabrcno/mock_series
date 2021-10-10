import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/presentation/shows/favorites_screen.dart';
import 'package:mock_series/presentation/shows/widgets/infinite_scroll_shows.dart';
import '../../injection.dart';
import 'widgets/search_bar.dart';

// ignore: must_be_immutable
class MainShowsScreen extends StatelessWidget {
  ShowsController showsController = Get.put(getIt<ShowsController>());
  MainShowsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    showsController.initializeShowLists();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Mock Series"),
        actions: [
          IconButton(
            iconSize: 30,
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
              Get.to(() => FavoritesScreen());
            },
            color: Colors.pink[300],
          )
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/main_background.png"))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                InfiniteScrollShows(),
                Positioned(
                  bottom: 10,
                  child: OpenSearchBar(
                    transitionType: ContainerTransitionType.fade,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return ClosedSearchBar(openContainer: openContainer);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
