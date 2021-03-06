import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/application/favorites_controller/favorites_controller.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/injection.dart';

class AddFavoriteTile extends StatelessWidget {
  final double width = 285;
  final Show show;
  final FavoritesController favoritesController =
      Get.put(getIt<FavoritesController>());
  AddFavoriteTile({
    Key? key,
    required this.show,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await favoritesController.toggleFavorite(show: show);
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.all(12),
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
            Obx(() => Icon(Icons.favorite,
                color: favoritesController.getIsShowFavorite(showId: show.id)
                    ? Colors.white
                    : Colors.red,
                size: 30)),
          ],
        ),
      ),
    );
  }
}
