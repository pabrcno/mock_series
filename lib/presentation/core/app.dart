import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/presentation/shows/main_shows_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: Colors.white, fontSize: 20),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            errorMaxLines: 1,
            labelStyle: TextStyle(color: Color.fromRGBO(138, 90, 171, 1))),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        primaryColor: const Color.fromRGBO(118, 104, 150, 1),
        backgroundColor: const Color.fromRGBO(43, 44, 67, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: MainShowsScreen(),
    );
  }
}
