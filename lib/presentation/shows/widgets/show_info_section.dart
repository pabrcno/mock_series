import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/presentation/shows/widgets/show_premiere_genres_row.dart';

class ShowInfoSection extends StatelessWidget {
  final Show show;
  const ShowInfoSection({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ShowPremiereGenresRow(show: show),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Watch it on",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...show.schedule!.days
                      .map((day) => Chip(
                            backgroundColor: Colors.red[400],
                            label: Text(
                              '${day[0]}${day[1]}${day[2]}',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ))
                      .toList()
                ],
              )
            ],
          ),
        )),
        const SizedBox(
          height: 5,
        ),
        Chip(
            label: Text(
          'At: ${show.schedule!.time} Hs',
          style: const TextStyle(fontSize: 15),
        )),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "SUMARY",
          style: TextStyle(fontSize: 18),
        ),
        Html(data: show.summary ?? "", style: {
          "p": Style(
              fontSize: const FontSize(17), lineHeight: const LineHeight(1.5)),
        }),
      ],
    );
  }
}
