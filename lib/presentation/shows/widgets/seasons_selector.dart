import 'package:flutter/material.dart';

class SeasonsSelector extends StatelessWidget {
  const SeasonsSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    ]));
  }
}
