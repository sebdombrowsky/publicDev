import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/custom_maxpulse_picker.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/custom_slider.dart';

class HerzfrequenzPage extends StatefulWidget {
  final Size size;
  final String title;
  const HerzfrequenzPage({Key? key, required this.size, required this.title})
      : super(key: key);

  @override
  _HerzfrequenzPageState createState() => _HerzfrequenzPageState();
}

class _HerzfrequenzPageState extends State<HerzfrequenzPage> {
  TextEditingController pulsController = TextEditingController();
  TextEditingController prozentController = TextEditingController();
  TextEditingController zielPulsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pulsController.text =
        pulsController.text == "" ? "190" : pulsController.text;
    zielPulsController.text =
        zielPulsController.text == "" ? "95" : zielPulsController.text;
    prozentController.text =
        prozentController.text == "" ? "50" : prozentController.text;
    return Container(
      width: widget.size.width * 0.5,
      height: widget.size.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Deine maximale Herzfrequenz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Orbitron",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Pulse",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: "Orbitron"),
                      ),
                      Text(
                        "bpm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Orbitron"),
                      ),
                    ],
                  ),
                  Material(
                    borderOnForeground: true,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.grey[500]!),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: CustomMaxPulsePicker(
                            controller: pulsController, onChange: () => null),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                "Mit wie viel % deiner maximalen Herzfrequenz willst du trainieren?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.bold),
              ),
            ),
            CustomSlider(
                prozent: prozentController,
                onChange: () =>
                    PulsBerechnen(pulsController.text, prozentController.text)),
            Text(
              "Für ein Training bei " +
                  prozentController.text +
                  "% deiner maximalen Herzfrequenz, liegt der optimale Pulsbereich bei",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Orbitron",
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: widget.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      zielPulsController.text,
                      style: TextStyle(
                        color: CupertinoColors.destructiveRed,
                        fontSize: 75,
                        fontFamily: "Orbitron",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "bpm",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: "Orbitron",
              ),
            )
          ],
        ),
      ),
    );
  }

  PulsBerechnen(String maxPuls, String prozent) {
    //maxPuls und prozent kann nicht null oder unconvertable sein
    double _maxPuls = double.parse(maxPuls);
    double _prozent = double.parse(prozent);

    int zielPuls = (_maxPuls * (_prozent / 100)).round();
    setState(() {
      print(zielPuls.toString() + zielPulsController.text);
      zielPulsController.text = zielPuls.toString();
    });
  }
}
