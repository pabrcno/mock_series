import 'package:flutter/material.dart';
import 'package:mock_series/domain/shows/models/show.dart';

class SearchTile extends StatelessWidget {
  final Show show;
  const SearchTile({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: GO TO MOVIE PAGE
      },
      child: Container(
        padding: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(color: Colors.white, width: 0.2)),
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 35),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.5),
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
                style: const TextStyle(fontSize: 22),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
