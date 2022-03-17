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
      width: widget.size.width,
      height: widget.size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                "Du planst ein Training und möchtest \"auf Puls\" laufen?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Orbitron",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "Gib als erstes deine maximale Herzfrequenz an. Infos zum Berechnen der max. Herzfrequenz findest du unter \"Tips\"",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
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
                        "Puls",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Orbitron"),
                      ),
                      Text(
                        "bpm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
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
                    fontSize: 16,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prozentController.text + "%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: CupertinoColors.destructiveRed,
                          fontSize: 24,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "entspricht",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Orbitron",
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      zielPulsController.text + " bpm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: CupertinoColors.destructiveRed,
                          fontSize: 24,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CustomSlider(
                  prozent: prozentController,
                  onChange: () =>
                      PulsBerechnen(pulsController.text, prozentController.text)),
            ),
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
      zielPulsController.text = zielPuls.toString();
    });
  }
}
