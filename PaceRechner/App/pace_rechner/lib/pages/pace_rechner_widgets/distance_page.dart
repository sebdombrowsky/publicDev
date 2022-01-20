import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'custom_time_picker.dart';

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
    return Container(
      width: widget.size.width * 0.5,
      height: widget.size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: "Orbitron"),
                    ),
                    Text(
                      "hh:mm",
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
                        child: CustomTimePicker(
                      controller: zeitController,
                      mode: CupertinoTimerPickerMode.hm,
                      onChange: () => DistanzBerechnen(
                          zeitController.text, paceController.text),
                    )),
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
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: "Orbitron"),
                    ),
                    Text(
                      "min/km",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "Orbitron"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
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
                        controller: paceController,
                        mode: CupertinoTimerPickerMode.ms,
                        onChange: () => DistanzBerechnen(
                            zeitController.text, paceController.text),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Orbitron"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
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
                      distanzController.text,
                      style: TextStyle(
                        color: CupertinoColors.activeGreen,
                        fontSize: 75,
                        fontFamily: "Orbitron",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "km",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: "Orbitron",
            ),
          )
        ],
      ),
    );
  }

  DistanzBerechnen(String _zeit, String _pace) {
    setState(() {
      distanzController.text = rechner.DistanzBerechnen(_zeit, _pace);
    });
  }
}
