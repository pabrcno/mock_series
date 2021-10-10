import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mock_series/domain/shows/models/show.dart';

import '../show_screen.dart';

class SearchTile extends StatelessWidget {
  final Show show;
  const SearchTile({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.to(() => ShowScreen(key: Key(show.name!), show: show),
            preventDuplicates: false);
      },
      child: SizedBox(
        child: Row(
          children: [
            Container(
              //image
              margin: const EdgeInsets.only(right: 35),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.1),
              ),
              height: 148,
              width: 105,
              child: show.image != null
                  ? Image.network(
                      show.image!.medium!,
                      semanticLabel: show.name,
                    )
                  : Text(show.name!),
            ),
            Flexible(
                //title
                child: Text(
              show.name!,
              style: const TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
