import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/domain/shows/models/episode.dart';
import 'package:mock_series/injection.dart';

class EpisodeTile extends StatelessWidget {
  final Episode episode;
  const EpisodeTile({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());
    return InkWell(
      onTap: () async {
        // await Get.to(() => ShowScreen(key: Key(show.name!), show: show),
        //     preventDuplicates: false);
      },
      child: SizedBox(
        height: 60,
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
