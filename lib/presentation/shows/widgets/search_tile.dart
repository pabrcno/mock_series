import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/shows_controller/shows_controller.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';
import 'package:mock_series/presentation/shows/utils/show_shows_snackbar.dart';

class SearchTile extends StatelessWidget {
  final Show show;
  const SearchTile({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowsController showsController = Get.put(getIt<ShowsController>());
    return InkWell(
      onTap: () {
        showsController.setShowScreenInitialData(
            show: show, showErrorSnackBar: showShowsSnackBar);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 2, right: 2, left: 2),
        padding: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(color: Colors.white, width: 0.3)),
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 35),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.8),
                ),
                height: 148,
                width: 105,
                child: show.image != null
                    ? Image.network(
                        show.image!["medium"]!,
                        semanticLabel: show.name,
                      )
                    : Text(show.name!),
              ),
              Flexible(
                  child: Text(
                show.name!,
                style: const TextStyle(fontSize: 20),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
