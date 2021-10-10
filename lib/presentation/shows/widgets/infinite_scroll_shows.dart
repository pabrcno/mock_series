import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/widgets/add_favorite_tile.dart';
import 'package:mock_series/presentation/shows/widgets/show_presentation.dart';

class InfiniteScrollShows extends StatelessWidget {
  final ShowsController showsController = Get.put(getIt<ShowsController>());
  InfiniteScrollShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      ScrollController _scrollController = ScrollController();
      _scrollController.addListener(() {
        int reloadMargin = -800;
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent + reloadMargin) {
          if (showsController.memoryIndex.value >=
              showsController.memoryShowList.length) {
            showsController.addToPageIndex();
            showsController.getMainScreenShowsList();
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
    });
  }
}
