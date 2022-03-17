import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/models/sprueche.dart';
import 'package:pace_rechner/models/string_converter.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/page_circles.dart';
import 'pace_rechner_widgets/pace_page_view.dart';
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

    PageController pageController = PageController(viewportFraction: 1);

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PacePageViewWidget(
                pageController: pageController,
              ),
              PageCircles(controller: pageController),
            ],
          ),
        ),
      ),
    );
  }
}
