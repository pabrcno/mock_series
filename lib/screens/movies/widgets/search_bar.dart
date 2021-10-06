import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ClosedSearchBar extends StatelessWidget {
  const ClosedSearchBar({
    Key? key,
    required this.openContainer,
  }) : super(key: key);
  final VoidCallback openContainer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: openContainer,
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'Look for a movie',
                    labelStyle: TextStyle(fontSize: 22)
                    // obs
                    )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width,
              child: ListView(children: const <Widget>[
                ListTile(
                  title: Text("HELO 1"),
                ),
                ListTile(
                  title: Text("HELO 2"),
                ),
                ListTile(
                  title: Text("HELO 3"),
                )
              ]),
            )
          ]),
        ));
  }
}

class OpenSearchBar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OpenSearchBar({
    required this.closedBuilder,
    required this.transitionType,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionDuration: const Duration(milliseconds: 800),
      closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const SearchBar();
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
