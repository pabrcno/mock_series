import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';

import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';

import 'package:mock_series/presentation/shows/widgets/episodes_list.dart';
import 'package:mock_series/presentation/shows/widgets/seasons_selector.dart';
import 'package:mock_series/presentation/shows/widgets/show_premiere_genres_row.dart';

// ignore: must_be_immutable
class ShowScreen extends StatelessWidget {
  ShowsController showsController = Get.put(getIt<ShowsController>());
  FavoritesController favoritesController =
      Get.put(getIt<FavoritesController>());
  final Show show;
  ShowScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showsController.setShowScreenInitialData(show: show);

    return Scaffold(
        appBar: AppBar(
          title: Text(show.name!),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  favoritesController.addFavorite(show: show);
                })
          ],
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
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 0.5),
                            ),
                            width: MediaQuery.of(context).size.width - 40,
                            child: show.image != null
                                ? InkWell(
                                    child: Image.network(
                                    show.image!.original!,
                                    semanticLabel: show.name,
                                    errorBuilder: (context, exception,
                                            stackTrack) =>
                                        Image.asset(
                                            "assets/images/placeholder.png"),
                                  ))
                                : Text(show.name!),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ShowPremiereGenresRow(show: show),
                          const SizedBox(
                            height: 20,
                          ),

                          Center(
                              child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                const Text(
                                  "Watch it on",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ...show.schedule!.days
                                        .map((day) => Chip(
                                              backgroundColor: Colors.red[400],
                                              label: Text(
                                                '${day[0]}${day[1]}${day[2]}',
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ))
                                        .toList()
                                  ],
                                )
                              ],
                            ),
                          )),
                          const SizedBox(
                            height: 5,
                          ),
                          Chip(
                              label: Text(
                            'At: ${show.schedule!.time} Hs',
                            style: const TextStyle(fontSize: 15),
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "SUMARY",
                            style: TextStyle(fontSize: 18),
                          ),
                          Html(data: show.summary ?? "", style: {
                            "p": Style(
                                fontSize: const FontSize(17),
                                lineHeight: const LineHeight(1.5)),
                          }),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Episodes",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SeasonsSelector()
                                  ])),
                          const Divider(
                            height: 1,
                          ),
                          // ignore: prefer_const_constructors
                          EpisodesList()
                        ]))
                  ]),
                )),
        ));
  }
}
