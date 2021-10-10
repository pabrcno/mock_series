import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';

class AddFavoriteTile extends StatelessWidget {
  final double width = 285;
  final Show show;

  const AddFavoriteTile({
    Key? key,
    required this.show,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoritesController favoritesController =
        Get.put(getIt<FavoritesController>());
    return InkWell(
      //add to favorites
      onTap: () {
        favoritesController.addFavorite(show: show);
      },
      child: Container(
        width: width + 1,
        height: 50,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(show.name!,
                  style: const TextStyle(
                    fontSize: 18,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.favorite, color: Colors.white, size: 26),
          ],
        ),
      ),
    );
  }
}
