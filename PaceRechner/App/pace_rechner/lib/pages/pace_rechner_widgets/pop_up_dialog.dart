import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pace Me Infos'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Version 1.0"),
          Text(""),
          Text("Mit dieser App lässt sich die Geschwindigkeit in Minuten pro Kilometern, die Distanz in Kilometern und die Zeit in Stunden berechnen."),
          Text(""),
          Text("Das Ergebnis wird auf der entsprechenden Seite beim Verändern der Werte im unteren Bereich angezeigt."),
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
