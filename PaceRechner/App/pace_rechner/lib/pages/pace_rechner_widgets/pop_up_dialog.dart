import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pace Rechner Infos'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Version 1.0"),
          Text(""),
          Text("Bei der Berechnung können Rundungsfehler entstehen. Angaben sind ohne Gewähr."),
          Text(""),
          Text("Viel Spaß beim Laufen!"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Schließen'),
        ),
      ],
    );
  }
}
