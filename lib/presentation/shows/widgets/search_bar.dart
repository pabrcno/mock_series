import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/utils/show_shows_snackbar.dart';
import 'package:mock_series/presentation/shows/widgets/search_tile.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  onChanged: (value) => showsController.searchShows(
                      search: value, showErrorSnackBar: showShowsSnackBar),
                  autofocus: true,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).backgroundColor,
                    filled: true,
                    suffixIcon: const Icon(Icons.search, color: Colors.white),
                    hintText: "Search a show",
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                  )),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: Column(
                  children: [
                    ...showsController.searchShowList
                        .map((show) => SearchTile(show: show))
                        .toList(),
                    showsController.isSearchLoading.value
                        ? const Center(
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: CircularProgressIndicator()),
                          )
                        : const SizedBox(
                            height: 1,
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class ClosedSearchBar extends StatelessWidget {
  const ClosedSearchBar({
    Key? key,
    required this.openContainer,
  }) : super(key: key);
  final VoidCallback openContainer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openContainer,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Search a show", style: TextStyle(fontSize: 20)),
            Icon(
              Icons.search,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}

class OpenSearchBar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OpenSearchBar({
    required this.closedBuilder,
    required this.transitionType,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionDuration: const Duration(milliseconds: 400),
      closedColor: Theme.of(context).primaryColor,
      openColor: Theme.of(context).primaryColor,
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const SearchBar();
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
