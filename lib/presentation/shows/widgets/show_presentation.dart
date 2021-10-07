import 'package:flutter/material.dart';
import 'package:mock_series/domain/shows/models/show.dart';

class ShowPresentation extends StatelessWidget {
  final Show show;
  const ShowPresentation({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(
      children: [
        InkWell(
            child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5)),
          height: 210,
          width: 148,
          child: show.image != null
              ? Image.network(
                  show.image!["medium"]!,
                  semanticLabel: show.name,
                )
              : Text(show.name!),
        )),
        Container(
          width: 150,
          height: 25,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(138, 90, 171, 1)),
          child: const Center(child: Icon(Icons.favorite, color: Colors.white)),
        ),
        const SizedBox(height: 10),
        Container(
          width: 74,
          height: 25,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Text(show.name!),
        ),
      ],
    ));
  }
}
