
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/models/string_converter.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/custom_button.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/custom_text_field.dart';

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

  bool showDistanzen = false;
  bool showZeiten = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text("Pace Rechner"),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    icon: Icon(
                      Icons.sports_score,
                      color: Colors.green[400],
                    ),
                    hintText: "Distanz in km",
                    textInputType: TextInputType.number,
                    controller: distanzController,
                    onTap: () => {},
                  ),
                  CustomTextField(
                    icon: Icon(
                      Icons.timer,
                      color: Colors.red[200],
                    ),
                    hintText: "Zeit in Minuten",
                    textInputType: TextInputType.number,
                    controller: zeitController,
                    onTap: () => {},
                  ),
                  CustomTextField(
                    icon: Icon(
                      Icons.fast_forward_rounded,
                      color: Colors.blue[200],
                    ),
                    hintText: "mm:ss",
                    textInputType: TextInputType.number,
                    controller: paceController,
                    onTap: () => {showDistanzen = false, showZeiten = false},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          CustomButton(
                            onPressed: () => {
                              DistanzBerechnen(
                                  zeitController.text, paceController.text)
                            },
                            text: "Distanz",
                            buttonColor: Colors.green[400]!,
                            icon: Icons.sports_score,
                            height: 80,
                            width: 80,
                          ),
                          CustomButton(
                            onPressed: () => {
                              ZeitBerechnen(
                                  distanzController.text, paceController.text)
                            },
                            text: "Zeit",
                            buttonColor: Colors.red[200]!,
                            icon: Icons.timer,
                            height: 80,
                            width: 80,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomButton(
                            onPressed: () => {
                              PaceBerechnen(
                                  distanzController.text, zeitController.text)
                            },
                            text: "Pace",
                            buttonColor: Colors.blue[200]!,
                            icon: Icons.fast_forward_rounded,
                            height: 180,
                            width: 180,
                          ),
                        ],
                      )
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
