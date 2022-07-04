
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/pages/sliderWidgets/distanz_slider.dart';
import 'package:pace_rechner/pages/sliderWidgets/zeit_slider.dart';


class PacePage extends StatefulWidget {
  final Size size;
  final String title;
  PacePage({Key? key, required this.size, required this.title})
      : super(key: key);

  @override
  _PacePageState createState() => _PacePageState();
}

class _PacePageState extends State<PacePage> {
  Rechner rechner = Rechner();

  TextEditingController distanzController = TextEditingController();
  TextEditingController zeitController = TextEditingController();
  TextEditingController paceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    distanzController.text =
        distanzController.text == "" ? "21.1" : distanzController.text;
    zeitController.text =
        zeitController.text == "" ? "01:59" : zeitController.text;
    paceController.text =
        paceController.text == "" ? "05:40" : paceController.text;
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
        decoration: BoxDecoration(color:  CupertinoColors.darkBackgroundGray),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: widget.size.width,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    paceController.text,
                    style: TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontSize: 75,
                      fontFamily: "Orbitron",
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "min/km",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 22,
                fontFamily: "Orbitron",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Distanz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                DistanzSlider(
                  controller: distanzController,
                  onChange: () => PaceBerechnen(
                      distanzController.text, zeitController.text),
                  size: widget.size,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ZeitSlider(
                  controller: zeitController,
                  onChange: () =>
                      PaceBerechnen(distanzController.text, zeitController.text),
                  size: widget.size,
                ),
                Text(
                  "Zeit hh:mm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PaceBerechnen(String _distanz, String _zeit) {
    setState(() {
      paceController.text = rechner.PaceBerechnen(_distanz, _zeit);
    });
  }
}
