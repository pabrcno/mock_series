import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mock_series/screens/movies/widgets/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOVIES"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Center(child: Text("MOVIES")),
            Positioned(
              bottom: 0,
              child: OpenSearchBar(
                transitionType: ContainerTransitionType.fade,
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return ClosedSearchBar(openContainer: openContainer);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
