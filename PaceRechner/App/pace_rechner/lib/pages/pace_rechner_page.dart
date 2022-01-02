import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/models/sprueche.dart';
import 'package:pace_rechner/models/string_converter.dart';

import 'pace_rechner_widgets/page_view.dart';
import 'pace_rechner_widgets/pop_up_dialog.dart';

class PaceRechnerPage extends StatefulWidget {
  const PaceRechnerPage({Key? key}) : super(key: key);

  @override
  _PaceRechnerPageState createState() => _PaceRechnerPageState();
}

class _PaceRechnerPageState extends State<PaceRechnerPage> {
  StringConverter converter = StringConverter();
  Rechner rechner = Rechner();
  Sprueche sprueche = Sprueche();
  TextEditingController distanzController = TextEditingController();
  TextEditingController zeitController = TextEditingController();
  TextEditingController paceController = TextEditingController();
  String spruch = "";

  @override
  Widget build(BuildContext context) {
    //default Werte
    distanzController.text =
        distanzController.text == "" ? "21.1" : distanzController.text;
    zeitController.text =
        zeitController.text == "" ? "01:59" : zeitController.text;
    paceController.text =
        paceController.text == "" ? "05:40" : paceController.text;

    return Scaffold(
      backgroundColor: Colors.white, // CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        title: Text(
          "Pace Me",
          style: TextStyle(fontFamily: "Orbitron", fontSize: 35),
        ),
        centerTitle: true,
        backgroundColor: CupertinoColors.systemIndigo,
        leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => PopUpDialog());
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PageViewWidget(),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  spruch,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: "OoohBaby"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
