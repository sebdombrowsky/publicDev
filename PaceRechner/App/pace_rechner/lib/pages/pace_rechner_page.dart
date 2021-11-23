import 'package:flutter/material.dart';
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
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);

    String paceInKmProMin = "";

    if (distanzInKm != null && zeitInMinuten != null) {
      var decimalPace = zeitInMinuten / distanzInKm;
      var ganzeZahlString = decimalPace.toString().split('.')[0];
      var nachKommaStellenString = "0." + decimalPace.toString().split('.')[1];
      var echtePaceNachKommaStelle =
          "0." + (double.parse(nachKommaStellenString) * 60).toStringAsFixed(0);
      double echtePace = double.parse(ganzeZahlString) +
          double.parse(echtePaceNachKommaStelle);
      paceInKmProMin = echtePace.toStringAsFixed(2);
    }

    setState(() {
      paceController.text = paceInKmProMin.replaceAll('.', ':') + " min/km";
    });
  }

  void DistanzBerechnen(String _zeit, String _pace) {
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);
    double? timePace = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String distanzInKm = "";

    if (zeitInMinuten != null && timePace != null) {
      var decimalPaceNachkommastelleString = timePace.toString().split('.')[1];
      if (decimalPaceNachkommastelleString.length == 1) {
        decimalPaceNachkommastelleString =
            decimalPaceNachkommastelleString + "0";
      }
      var decimalPaceNachkommastelle =
          double.parse(decimalPaceNachkommastelleString) / 60;
      var decimalPaceDouble = double.parse(timePace.toStringAsFixed(0)) +
          decimalPaceNachkommastelle;
      distanzInKm = (zeitInMinuten / decimalPaceDouble).toStringAsFixed(2);
    }

    setState(() {
      distanzController.text = distanzInKm + " km";
    });
  }

  void ZeitBerechnen(String _distanz, String _pace) {
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? timePace = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String zeitInMinuten = "";

    if (distanzInKm != null && timePace != null) {
      var decimalPaceNachkommastelleString = timePace.toString().split('.')[1];
      if (decimalPaceNachkommastelleString.length == 1) {
        decimalPaceNachkommastelleString =
            decimalPaceNachkommastelleString + "0";
      }
      var decimalPaceNachkommastelle =
          double.parse(decimalPaceNachkommastelleString) / 60;
      var decimalPaceDouble = double.parse(timePace.toStringAsFixed(0)) +
          decimalPaceNachkommastelle;
      zeitInMinuten = (distanzInKm * decimalPaceDouble).toStringAsFixed(0);
    }
    setState(() {
      zeitController.text = zeitInMinuten + " min";
    });
  }
}
