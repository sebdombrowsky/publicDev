import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/pages/sliderWidgets/pace_slider.dart';
import '../sliderWidgets/zeit_slider.dart';

class DistancePage extends StatefulWidget {
  final Size size;
  final String title;
  DistancePage({Key? key, required this.size, required this.title})
      : super(key: key);

  @override
  _DistancePageState createState() => _DistancePageState();
}

class _DistancePageState extends State<DistancePage> {
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
                    distanzController.text,
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 75,
                      fontFamily: "Orbitron",
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "km",
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
                  "Zeit hh:mm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                ZeitSlider(
                  controller: zeitController,
                  onChange: () => DistanzBerechnen(
                      zeitController.text, paceController.text),
                  size: widget.size,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaceSlider(
                  controller: paceController,
                  onChange: () =>
                      DistanzBerechnen(zeitController.text, paceController.text),
                  size: widget.size,
                ),
                Text(
                  "Pace min/km",
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

  DistanzBerechnen(String _zeit, String _pace) {
    setState(() {
      distanzController.text = rechner.DistanzBerechnen(_zeit, _pace);
    });
  }
}
