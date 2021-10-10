import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/show_screen.dart';
import 'package:mock_series/presentation/shows/utils/show_shows_snackbar.dart';

class ShowPresentation extends StatelessWidget {
  final Show show;
  final Widget actionTile;
  static const double width = 285;

  const ShowPresentation(
      {Key? key, required this.show, required this.actionTile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              width: width,
              child: InkWell(
                //image
                onTap: () async {
                  Get.to(() => ShowScreen(key: Key(show.name!), show: show));
                },
                child: show.image != null
                    ? Image.network(
                        show.image!.original!,
                        semanticLabel: show.name,
                        cacheWidth: 350,
                        errorBuilder: (context, exception, stackTrack) =>
                            Image.asset("assets/images/placeholder.png"),
                      )
                    : Text(show.name!),
              )),
          actionTile,
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
