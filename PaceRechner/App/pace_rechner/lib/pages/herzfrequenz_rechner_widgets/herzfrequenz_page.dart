import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/custom_maxpulse_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    pulsController.text = "190";
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
              padding: const EdgeInsets.symmetric(vertical:12),
              child: Text(
                "Mit wie viel % deiner maximalen Herzfrequenz willst du trainieren?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: "Orbitron",
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Trage hier deine maximale Herzfrequenz ein",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Orbitron",
                ),
              ),
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
                    child: CustomMaxPulsePicker(controller: pulsController, onChange: () => null),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
