import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/domain/shows/models/episode.dart';

import '../episode_screen.dart';

class EpisodeTile extends StatelessWidget {
  final Episode episode;
  const EpisodeTile({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.to(
            () => EpisodeScreen(
                key: Key('${episode.name!}${episode.id}'), episode: episode),
            preventDuplicates: false);
      },
      child: SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  //title
                  child: Text(
                episode.name!,
                style: const TextStyle(fontSize: 20),
              )),
              Text('${episode.number}', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
