import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';

import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';

import 'package:mock_series/presentation/shows/widgets/episodes_list.dart';
import 'package:mock_series/presentation/shows/widgets/seasons_selector.dart';
import 'package:mock_series/presentation/shows/widgets/show_premiere_genres_row.dart';

class ShowScreen extends StatelessWidget {
  final Show show;
  const ShowScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());
    showsController.restartSelectedSeason();
    return Scaffold(
      appBar: AppBar(
        title: Text(show.name!),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      child: show.image != null
                          ? InkWell(
                              child: Hero(
                                  tag: "${show.id}_pic",
                                  child: Image.network(
                                    show.image!.original!,
                                    semanticLabel: show.name,
                                  )))
                          : Text(show.name!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowPremiereGenresRow(show: show),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("SUMARY"),
                    Html(data: show.summary),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Episodes"),
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
    );
  }
}
