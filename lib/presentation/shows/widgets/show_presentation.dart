import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/presentation/shows/show_screen.dart';

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
          SizedBox(
              width: width,
              child: InkWell(
                //image
                onTap: () async {
                  Get.to(() => ShowScreen(key: Key(show.name!), show: show));
                },
                child: show.image != null
                    ? FadeInImage.assetNetwork(
                        placeholder: "assets/images/transparent_picture.png",
                        image: show.image!.original!,
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
