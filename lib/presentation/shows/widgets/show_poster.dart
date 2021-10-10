import 'package:flutter/material.dart';
import 'package:mock_series/domain/shows/models/show.dart';

class ShowPoster extends StatelessWidget {
  final Show show;
  const ShowPoster({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: show.image != null
          ? InkWell(
              child: FadeInImage.assetNetwork(
              placeholder: "assets/images/transparent_picture.png",
              image: show.image!.original!,
            ))
          : Text(show.name!),
    );
  }
}
