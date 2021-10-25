import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/widgets/episodes_list.dart';
import 'package:mock_series/presentation/shows/widgets/seasons_selector.dart';
import 'package:mock_series/presentation/shows/widgets/show_info_section.dart';
import 'package:mock_series/presentation/shows/widgets/show_poster.dart';

class ShowScreen extends StatelessWidget {
  final ShowsController showsController = Get.put(getIt<ShowsController>());
  final FavoritesController favoritesController =
      Get.put(getIt<FavoritesController>());
  final Show show;
  ShowScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(show.name!),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/show_background.png"))),
          padding: const EdgeInsets.all(20),
          child: Obx(() => showsController.isShowScreenLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          ShowPoster(show: show),
                          const SizedBox(
                            height: 20,
                          ),
                          ShowInfoSection(show: show),
                          SeasonsSelector(),
                          const Divider(
                            height: 1,
                          ),
                          EpisodesList()
                        ]))
                  ]),
                )),
        ));
  }
}
