import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/presentation/shows/utils/show_shows_snackbar.dart';
import '../../injection.dart';
import 'widgets/search_bar.dart';

class MainShowsScreen extends StatelessWidget {
  const MainShowsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());

    showsController.getMainScreenShowsList(showShowsSnackBar);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Mock Series"),
      ),
      body: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Obx(() {
                  return showsController.mainShowList.isNotEmpty
                      ? SingleChildScrollView(
                          child: Column(
                          children: showsController.mainShowList
                              .map((element) => Text(element.name))
                              .toList(),
                        ))
                      : const CircularProgressIndicator();
                }),
                SingleChildScrollView(
                    child: Column(
                  children: showsController.mainShowList
                      .map((element) => Text(element.name))
                      .toList(),
                )),
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
