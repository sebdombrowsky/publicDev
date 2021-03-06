import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/custom_maxpulse_picker.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/custom_slider.dart';
import 'package:pace_rechner/pages/sliderWidgets/puls_slider.dart';

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class HerzfrequenzPage extends StatefulWidget {
  final Size size;
  final String title;
  const HerzfrequenzPage({Key? key, required this.size, required this.title})
      : super(key: key);

  @override
  _HerzfrequenzPageState createState() => _HerzfrequenzPageState();
}

class _HerzfrequenzPageState extends State<HerzfrequenzPage> {
  String hfMax = "190";

  void loadHfMaxValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hfMax = (prefs.getString('hfMax'))!;
      pulsController.text = hfMax;
    });
  }

  @override
  void initState() {
    super.initState();
    loadHfMaxValue();
  }

  TextEditingController pulsController = TextEditingController();
  TextEditingController prozentController = TextEditingController();
  TextEditingController zielPulsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // pulsController.text = hfMax;
    pulsController.text =
        pulsController.text == "" ? "190" : pulsController.text;
    prozentController.text =
        prozentController.text == "" ? "50" : prozentController.text;
    PulsBerechnen(pulsController.text, prozentController.text);

    return Scaffold(
      backgroundColor: Colors.grey[200], // CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        title: Text(
          "Pace Me",
          style: TextStyle(fontFamily: "Orbitron", fontSize: 35),
        ),
        centerTitle: true,
        backgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.darkBackgroundGray,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: Text(
                "Deine maximale Herzfrequenz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 16,
                  fontFamily: "Orbitron",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
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
                            color: CupertinoColors.white,
                            fontSize: 22,
                            fontFamily: "Orbitron"),
                      ),
                      Text(
                        "bpm",
                        style: TextStyle(
                            color: CupertinoColors.white,
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
                            controller: pulsController,
                            onChange: () => {
                                  PulsBerechnen(pulsController.text,
                                      prozentController.text),
                                  SetHfMax(),
                                },
                            initial: (int.parse(hfMax) - 120)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: PulsSlider(
                  controller: prozentController,
                  size: widget.size,
                  onChange: () => PulsBerechnen(
                      pulsController.text, prozentController.text)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    zielPulsController.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: CupertinoColors.destructiveRed,
                        fontSize: 75,
                        fontFamily: "Orbitron",
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "bpm",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16,
                      fontFamily: "Orbitron",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Text(
                "Bewege den Slider, um einen Anteil zu berechnen.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 16,
                  fontFamily: "Orbitron",
                  fontWeight: FontWeight.bold,
                ),
              ),
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

  Future<void> SetHfMax() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hfMax = ((prefs.getString('hfMax')))!;
      prefs.setString('hfMax', pulsController.text);
    });
  }
}
