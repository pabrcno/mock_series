import 'package:flutter/material.dart';
import 'package:mock_series/domain/shows/models/show.dart';

class ShowPremiereGenresRow extends StatelessWidget {
  final Show show;
  const ShowPremiereGenresRow({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            child: Column(
          children: [
            const Text(
              "Genres",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
                child: Row(
              children: [
                ...show.genres!
                    .map((genre) => Chip(
                          label: Text(genre),
                          backgroundColor: Theme.of(context).backgroundColor,
                        ))
                    .toList()
              ],
            ))
          ],
        )),
        SizedBox(
            child: Column(
          children: [
            const Text(
              "Premier",
              style: TextStyle(fontSize: 18),
            ),
            Chip(
              label: Text(show.premiered!),
              backgroundColor: Theme.of(context).primaryColor,
            )
          ],
        ))
      ]),
    );
  }
}
