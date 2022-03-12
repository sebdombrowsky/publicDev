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
      headerValue: "bpm",
      expandedValue:
          "bpm steht für \"beats per minute\". In dieser Einheit wird deine Herzfrequenz, also dein Puls angegeben."));
  data.add(Item(
      headerValue: "maximale Herzfrequenz",
      expandedValue:
          "Als Faustformel zur Berechnung deiner maximalen Herzfrequenz (HFmax) kannst du dir merken:\n\nMaximalpuls bei Männern:\nHFmax = 223 – 0,9 x Lebensalter\n\nMaximalpuls bei Frauen:\nHFmax = 226 – Lebensalter"));
  data.add(Item(
      headerValue: "Pace",
      expandedValue:
          "Die Pace (Geschwindigkeit) wird in Minuten pro Kilometern angegeben und wird von Läuferinnen und Läufern oft als Richtwert verwendet:\n\n\"Heute laufe ich eine 5er Pace.\" bedeutet: \"Für einen Kilometer benötige ich 5 Minuten.\""));

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
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: TextStyle(
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
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Orbitron"),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
