import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/domain/shows/models/episode.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/widgets/episode_tile.dart';

class EpisodesList extends StatelessWidget {
  ShowsController showsController = Get.put(getIt<ShowsController>());
  EpisodesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
        children: showsController.selectedSeasonEpisodes
            .map((Episode episode) => EpisodeTile(
                  episode: episode,
                ))
            .toList()));
  }
}
