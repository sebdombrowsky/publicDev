import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems() {
  List<Item> data = <Item>[];

  data.add(Item(
      headerValue: "Abkürzungen",
      expandedValue:
          "bpm:\tbeats per minute\npb:\tpersönliche Bestleistung\nHFmax:\tmaximale Herzfrequenz"));

  data.add(Item(
      headerValue: "Grundlagenausdauer GA1",
      expandedValue:
          "Ein Training im GA1 Bereich dient als Basistraining für dein Leistungspensum.\nZielherzfrequenz: 60-75% deiner HFmax"));
  data.add(Item(
      headerValue: "Grundlagenausdauer GA2",
      expandedValue:
          "Ein Training im GA2 Bereich dient zur Leistungssteigerung und Verbesserung der Herzleistung.\nZielherzfrequenz: 75-85% deiner HFmax"));
  data.add(Item(
      headerValue: "maximale Herzfrequenz",
      expandedValue:
          "Als Faustformel zur Berechnung deiner maximalen Herzfrequenz (HFmax) kannst du dir merken:\n\nMaximalpuls bei Männern:\nHFmax = 223 – 0,9 x Lebensalter\n\nMaximalpuls bei Frauen:\nHFmax = 226 – Lebensalter"));
  data.add(Item(
      headerValue: "Pace",
      expandedValue:
          "Die Pace (Geschwindigkeit) wird in Minuten pro Kilometern angegeben und wird von Läuferinnen und Läufern oft als Richtwert verwendet:\n\n\"Heute laufe ich eine 5er Pace.\" bedeutet: \"Für einen Kilometer benötige ich 5 Minuten.\""));
  data.add(Item(
      headerValue: "Pulsmesser",
      expandedValue:
          "Um den eigenen Puls im Blick zu haben und den passenden Trainingsbereich zu definieren, empfiehlt es sich, eine Pulsuhr oder einen Brustgurt mit entsprechendem Sender zu tragen."));
  data.add(Item(
      headerValue: "Trainingsplan",
      expandedValue:
          "Für ein ausgewogenes Training solltest du sowohl deine Grundlagenausdauer trainieren, als auch leistungssteigernde Trainings, wie Intervalltrainings, in deinen Plan einbauen. Wenn du einen Wettkampf im Leistungssportbereich planst, dann lass dich individuell beraten und dir einen optimalen Trainingsplan zusammenstellen."));
  data.add(Item(
      headerValue: "VO2max",
      expandedValue:
          "Dieser Wert beschreibt die Rate, mit der Sauerstoff während eines Trainings verbraucht werden kann. Je höher der Wert, desto besser deine Cardofitness und Ausdauer."));
  data.add(Item(
      headerValue: "Wettkampf WSA",
      expandedValue:
          "Wettkampfspezifisches Ausdauertraining. In diesem Trainingsbereich läufst du dein Höchsttempo auf sehr kurze Strecken, um neue Höchstgeschwindigkeiten für deine Wettkämpfe zu erreichen.\n Zielherzfrequenz: über 85% der HFmax "));

  return data;
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: CupertinoColors.activeOrange,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              tileColor: CupertinoColors.darkBackgroundGray,
              title: Text(
                item.headerValue,
                style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 18,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.bold),
              ),
            );
          },
          body: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                item.expandedValue,
                style: TextStyle(fontSize: 15, fontFamily: "Orbitron"),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
