import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                  labelText: 'Search a show',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Search a show", style: TextStyle(fontSize: 20)),
            Icon(
              Icons.search,
              size: 28,
            )
          ],
        ),
      ),
    );
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
      transitionDuration: const Duration(milliseconds: 400),
      closedColor: Theme.of(context).primaryColor,
      openColor: Theme.of(context).primaryColor,
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const SearchBar();
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
