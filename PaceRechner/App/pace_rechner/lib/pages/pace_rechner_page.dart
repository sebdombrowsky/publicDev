import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/models/string_converter.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/custom_button.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/custom_distance_picker.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/custom_time_picker.dart';

import 'pace_rechner_widgets/pop_up_dialog.dart';

class PaceRechnerPage extends StatefulWidget {
  const PaceRechnerPage({Key? key}) : super(key: key);

  @override
  _PaceRechnerPageState createState() => _PaceRechnerPageState();
}

class _PaceRechnerPageState extends State<PaceRechnerPage> {
  StringConverter converter = StringConverter();
  Rechner rechner = Rechner();
  TextEditingController distanzController = TextEditingController();
  TextEditingController zeitController = TextEditingController();
  TextEditingController paceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //default Werte
    distanzController.text = distanzController.text == "" ? "21.1" : distanzController.text;
    zeitController.text = zeitController.text == "" ?"01:59" : zeitController.text;
    paceController.text = paceController.text == "" ?"05:40" : paceController.text;

    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        title: Text("Pace Rechner"),
        centerTitle: true,
        backgroundColor: CupertinoColors.systemIndigo,
        leading: IconButton (
                 icon: Icon(Icons.info), 
                 onPressed: () { 
                       showDialog(context: context, builder: (BuildContext context) => PopUpDialog());
                 },
            ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomButton(
                        onPressed: () => {
                          DistanzBerechnen(
                              zeitController.text, paceController.text)
                        },
                        text: "Distanz (km)",
                        buttonColor: CupertinoColors.activeGreen,
                        icon: Icons.sports_score,
                        height: 70,
                        width: 140,
                      ),
                      Material(
                        borderOnForeground: true,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: 110,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.grey[500]!),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: CustomDistancePicker(
                            controller: distanzController,
                          )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                        onPressed: () => {
                          ZeitBerechnen(
                              distanzController.text, paceController.text)
                        },
                        text: "Zeit (hh:mm)",
                        buttonColor: CupertinoColors.activeOrange,
                        icon: Icons.timer,
                        height: 70,
                        width: 140,
                      ),
                      Material(
                        borderOnForeground: true,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: 110,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.grey[500]!),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: CustomTimePicker(
                            controller: zeitController,
                            mode: CupertinoTimerPickerMode.hm,
                          )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                        onPressed: () => {
                          PaceBerechnen(
                              distanzController.text, zeitController.text)
                        },
                        text: "Pace (min/km)",
                        buttonColor: CupertinoColors.activeBlue,
                        icon: Icons.fast_forward_rounded,
                        height: 70,
                        width: 140,
                      ),
                      Material(
                        borderOnForeground: true,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: 110,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.grey[500]!),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: CustomTimePicker(
                            controller: paceController,
                            mode: CupertinoTimerPickerMode.ms,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void PaceBerechnen(String _distanz, String _zeit) {
    setState(() {
      paceController.text = rechner.PaceBerechnen(_distanz, _zeit);
    });
  }

  void DistanzBerechnen(String _zeit, String _pace) {
    setState(() {
      distanzController.text = rechner.DistanzBerechnen(_zeit, _pace);
    });
  }

  void ZeitBerechnen(String _distanz, String _pace) {
    setState(() {
      zeitController.text = rechner.ZeitBerechnen(_distanz, _pace);
    });
  }
}
