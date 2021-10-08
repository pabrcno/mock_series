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
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              Html(data: show.summary),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Episodes"), SeasonsSelector()])),
                    const Divider(
                      height: 1,
                    ),
                  ]))
            ]),
          ),
        ));
  }
}
