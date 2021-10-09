import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/domain/shows/models/season.dart';
import 'package:mock_series/injection.dart';

class SeasonsSelector extends StatelessWidget {
  const SeasonsSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());
    return Obx(() => SizedBox(
            child: Row(children: <Widget>[
          const Text("Seasons"),
          const SizedBox(
            width: 28,
          ),
          DropdownButton<String>(
            value: "${showsController.selectedSeason.value.number}",
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            iconSize: 24,
            underline: Container(
              height: 2,
            ),
            onChanged: (String? newValue) {},
            items: showsController.showSeasonsList
                .map<DropdownMenuItem<String>>((Season season) {
              return DropdownMenuItem<String>(
                onTap: () {
                  showsController.selectedSeason.value = season;
                  showsController.setSelectedSeasonEpisodes(
                      selectedSeasonId: season.id!);
                },
                value: "${season.number}",
                child: Text("${season.number}"),
              );
            }).toList(),
          )
        ])));
  }
}
