import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/presentation/shows/favorites_screen.dart';
import 'package:mock_series/presentation/shows/utils/show_shows_snackbar.dart';
import 'package:mock_series/presentation/shows/widgets/show_presentation.dart';
import '../../injection.dart';
import 'widgets/add_favorite_tile.dart';
import 'widgets/search_bar.dart';

class MainShowsScreen extends StatelessWidget {
  const MainShowsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());

    showsController.initializeShowLists(showErrorSnackBar: showShowsSnackBar);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Mock Series"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.to(() => const FavoritesScreen());
            },
            color: Colors.red,
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
                Obx(() {
                  ScrollController _scrollController = ScrollController();
                  _scrollController.addListener(() {
                    int reloadMargin = -800;
                    if (_scrollController.position.pixels >=
                        _scrollController.position.maxScrollExtent +
                            reloadMargin) {
                      if (showsController.memoryIndex.value >=
                          showsController.memoryShowList.length) {
                        showsController.addToPageIndex();
                        showsController.getMainScreenShowsList(
                            showErrorSnackBar: showShowsSnackBar);
                      }
                      showsController.appendToLoadShowList();
                    }
                  });
                  return Center(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(children: [
                          ...showsController.toLoadShowList
                              .map((show) => ShowPresentation(
                                    show: show,
                                    actionTile: AddFavoriteTile(
                                      show: show,
                                    ),
                                  ))
                              .toList(),
                          showsController.isMainScreenLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : const SizedBox(
                                  height: 1,
                                )
                        ])),
                  ));
                }),
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
