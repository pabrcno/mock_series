import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mock_series/domain/shows/models/show.dart';

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
                        child: Row(children: <Widget>[
                      const Text("Seasons"),
                      const SizedBox(
                        width: 28,
                      ),
                      DropdownButton<String>(
                        value: "One",
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        iconSize: 24,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? newValue) {},
                        items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ]))
                  ]))
            ]),
          ),
        ));
  }
}
