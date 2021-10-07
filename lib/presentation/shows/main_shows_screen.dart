import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import '../../injection.dart';
import 'widgets/search_bar.dart';

class MainShowsScreen extends StatelessWidget {
  const MainShowsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ShowsController showController = Get.put(getIt<ShowsController>());
    showController.getMainScreenShowsList();
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
                const Center(child: Text("SHOWS")),
                Positioned(
                  bottom: 10,
                  child: OpenSearchBar(
                    transitionType: ContainerTransitionType.fade,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return ClosedSearchBar(openContainer: openContainer);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
