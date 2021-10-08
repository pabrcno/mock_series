import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/presentation/shows/widgets/seasons_selector.dart';

class ShowScreen extends StatelessWidget {
  final Show show;
  const ShowScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(show.name!),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      child: show.image != null
                          ? InkWell(
                              child: Hero(
                                  tag: "${show.id}_pic",
                                  child: Image.network(
                                    show.image!.original!,
                                    semanticLabel: show.name,
                                  )))
                          : Text(show.name!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                child: Column(
                              children: [Text("Genres")],
                            )),
                            SizedBox(
                                child: Column(
                              children: [
                                Text("Premier"),
                                Text(show.premiered!)
                              ],
                            ))
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("SUMARY"),
                    Html(data: show.summary),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Episodes"),
                              SeasonsSelector()
                            ])),
                    const Divider(
                      height: 1,
                    ),
                  ]))
            ]),
          ),
        ));
  }
}
