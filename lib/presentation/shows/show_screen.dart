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
        body: Center(child: Html(data: show.summary)));
  }
}
