import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/injection.dart';

import 'package:mock_series/presentation/shows/widgets/search_tile.dart';
import 'package:easy_debounce/easy_debounce.dart';

class SearchBar extends StatelessWidget {
  final ShowsController showsController = Get.put(getIt<ShowsController>());
  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  onChanged: (value) => EasyDebounce.debounce(
                      'search_debouncer',
                      const Duration(milliseconds: 500),
                      () => showsController.searchShows(search: value)),
                  autofocus: true,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).backgroundColor,
                    filled: true,
                    suffixIcon: const Icon(Icons.search, color: Colors.white),
                    hintText: "Search a show",
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                  )),
              const SizedBox(height: 10),
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
      closedColor: Theme.of(context).backgroundColor,
      openColor: Theme.of(context).backgroundColor,
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return SearchBar();
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
