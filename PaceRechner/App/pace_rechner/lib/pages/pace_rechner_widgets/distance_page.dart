import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'custom_time_picker.dart';

class DistancePage extends StatefulWidget {
  final Size size;
  final String title;
  TextEditingController distanzController;
  TextEditingController zeitController;
  TextEditingController paceController;
  DistancePage(
      {Key? key,
      required this.size,
      required this.title,
      required this.distanzController,
      required this.zeitController,
      required this.paceController})
      : super(key: key);

  @override
  _DistancePageState createState() => _DistancePageState();
}

class _DistancePageState extends State<DistancePage> {
  Rechner rechner = Rechner();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.5,
      height: widget.size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.grey[700], borderRadius: BorderRadius.circular(15)),
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
                      "Time",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Orbitron"),
                    ),
                    Text(
                      "hh:mm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
                        controller: widget.zeitController,
                        mode: CupertinoTimerPickerMode.hm,
                        onChange: () => DistanzBerechnen(
                            widget.zeitController.text,
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
                          fontSize: 20,
                          fontFamily: "Orbitron"),
                    ),
                    Text(
                      "mm:ss",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
                        onChange: () => DistanzBerechnen(
                            widget.zeitController.text,
                            widget.paceController.text),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),          
          Padding(
            padding: const EdgeInsets.only(top:12),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white, fontSize: 35, fontFamily: "Orbitron"),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.distanzController.text,
                style: TextStyle(
                  color: CupertinoColors.activeGreen,
                  fontSize: 75,
                  fontFamily: "Orbitron",
                ),
              ),
            ),
          ),
          Text(
            "km",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Orbitron",
            ),
          )
        ],
      ),
    );
  }

  DistanzBerechnen(String _zeit, String _pace) {
    setState(() {
      widget.distanzController.text = rechner.DistanzBerechnen(_zeit, _pace);
    });
  }
}
