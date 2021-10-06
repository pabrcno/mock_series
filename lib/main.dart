import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/screens/movies/widgets/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: Colors.white, fontSize: 20),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            errorMaxLines: 1,
            labelStyle: TextStyle(color: Color.fromRGBO(138, 90, 171, 1))),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        primaryColor: const Color.fromRGBO(138, 90, 171, 1),
        backgroundColor: const Color.fromRGBO(43, 44, 67, 1),
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
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Mock Series"),
      ),
      body: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                const Center(child: Text("MOVIES")),
                Positioned(
                  bottom: 10,
                  child: OpenSearchBar(
                    transitionType: ContainerTransitionType.fade,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return ClosedSearchBar(openContainer: openContainer);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
