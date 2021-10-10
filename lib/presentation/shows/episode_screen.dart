import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mock_series/domain/shows/models/episode.dart';

class EpisodeScreen extends StatelessWidget {
  final Episode episode;
  const EpisodeScreen({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(episode.name!),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/episode_background.png"))),
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
                      child: episode.image != null
                          ? InkWell(
                              child: FadeInImage.assetNetwork(
                                  placeholder:
                                      "assets/images/transparent_picture.png",
                                  image: episode.image!.original!,
                                  width: MediaQuery.of(context).size.width))
                          : Container(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              label: Text("Season ${episode.season}",
                                  style: const TextStyle(fontSize: 18)),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            Chip(
                              label: Text("Episode ${episode.number}",
                                  style: const TextStyle(fontSize: 18)),
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "SUMARY",
                      style: TextStyle(fontSize: 18),
                    ),
                    Html(data: episode.summary ?? "", style: {
                      "p": Style(
                          fontSize: const FontSize(18),
                          lineHeight: const LineHeight(1.5)),
                    }),
                  ]))
            ]),
          )),
    );
  }
}
