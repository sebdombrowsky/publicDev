import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/custom_time_picker.dart';

import 'custom_distance_picker.dart';

class TimePage extends StatefulWidget {
  final Size size;
  final String title;
  TextEditingController distanzController;
  TextEditingController zeitController;
  TextEditingController paceController;
  TimePage(
      {Key? key,
      required this.size,
      required this.title,
      required this.distanzController,
      required this.zeitController,
      required this.paceController})
      : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  Rechner rechner = Rechner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.5,
      height: widget.size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.grey[600], borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                      "Distance",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Orbitron"),
                    ),
                    Text(
                      "km",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Orbitron"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
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
                          child: CustomDistancePicker(
                        controller: widget.distanzController,
                        onChange: () => ZeitBerechnen(
                            widget.distanzController.text,
                            widget.paceController.text),
                      )),
                    ),
                  ),
                ),
              ],
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
                      "Pace",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Orbitron"),
                    ),
                    Text(
                      "min/km",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Orbitron"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
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
                          child: CustomTimePicker(
                        controller: widget.paceController,
                        mode: CupertinoTimerPickerMode.ms,
                        onChange: () => ZeitBerechnen(
                            widget.distanzController.text,
                            widget.paceController.text),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white, fontSize: 35, fontFamily: "Orbitron"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: widget.size.width,
              decoration: BoxDecoration(
                  color: Colors.white,),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    widget.zeitController.text,
                    style: TextStyle(
                      color: CupertinoColors.activeOrange,
                      fontSize: 75,
                      fontFamily: "Orbitron",
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "hh:mm",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: "Orbitron",
            ),
          )
        ],
      ),
    );
  }

  void ZeitBerechnen(String _distanz, String _pace) {
    setState(() {
      widget.zeitController.text = rechner.ZeitBerechnen(_distanz, _pace);
    });
  }
}
