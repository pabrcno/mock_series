import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/show_screen.dart';
import 'package:mock_series/presentation/shows/utils/show_shows_snackbar.dart';

class ShowPresentation extends StatelessWidget {
  final Show show;
  static const double width = 285;
  const ShowPresentation({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());
    return InkWell(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            //title
            width: width,
            child: Text(
              show.name!,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              width: width,
              child: Obx(() => InkWell(
                  //image
                  onTap: () async {
                    showsController.isShowScreenLoading.value = true;
                    await showsController.setShowScreenInitialData(
                        show: show, showErrorSnackBar: showShowsSnackBar);
                    Get.to(() => ShowScreen(key: Key(show.name!), show: show));
                  },
                  child: Stack(children: [
                    showsController.isShowScreenLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : Container(),
                    show.image != null
                        ? Hero(
                            tag: "${show.id}_pic",
                            child: Image.network(
                              show.image!.original!,
                              semanticLabel: show.name,
                            ))
                        : Text(show.name!),
                  ])))),
          InkWell(
            //add to favorites
            onTap: () {
              //TODO: APPLY LIKE LOGIC
            },
            child: Container(
              width: width + 2,
              height: 50,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(138, 80, 171, 1)),
              child: const Center(
                  child: Icon(Icons.favorite, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
