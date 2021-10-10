import 'package:flutter/material.dart';
import 'package:mock_series/domain/shows/models/show.dart';

class ShowPoster extends StatelessWidget {
  final Show show;
  const ShowPoster({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      width: MediaQuery.of(context).size.width - 40,
      child: show.image != null
          ? InkWell(
              child: Image.network(
              show.image!.original!,
              semanticLabel: show.name,
              errorBuilder: (context, exception, stackTrack) =>
                  Image.asset("assets/images/placeholder.png"),
            ))
          : Text(show.name!),
    );
  }
}
