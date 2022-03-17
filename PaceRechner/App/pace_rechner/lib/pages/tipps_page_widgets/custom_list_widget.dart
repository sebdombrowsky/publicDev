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

  data.add(Item(headerValue: "Abkürzungen", expandedValue: "toDo"));
  data.add(Item(
      headerValue: "beats per minute (bpm)",
      expandedValue:
          "In dieser Einheit wird deine Herzfrequenz, also dein Puls angegeben."));
  data.add(Item(headerValue: "Grundlagenausdauer GA1", expandedValue: "toDo"));
  data.add(Item(headerValue: "Grundlagenausdauer GA2", expandedValue: "toDo"));
  data.add(Item(headerValue: "Intervalltraining", expandedValue: "toDo"));
  data.add(Item(headerValue: "Lauftechnik", expandedValue: "toDo"));
  data.add(Item(
      headerValue: "maximale Herzfrequenz",
      expandedValue:
          "Als Faustformel zur Berechnung deiner maximalen Herzfrequenz (HFmax) kannst du dir merken:\n\nMaximalpuls bei Männern:\nHFmax = 223 – 0,9 x Lebensalter\n\nMaximalpuls bei Frauen:\nHFmax = 226 – Lebensalter"));
  data.add(Item(
      headerValue: "Pace",
      expandedValue:
          "Die Pace (Geschwindigkeit) wird in Minuten pro Kilometern angegeben und wird von Läuferinnen und Läufern oft als Richtwert verwendet:\n\n\"Heute laufe ich eine 5er Pace.\" bedeutet: \"Für einen Kilometer benötige ich 5 Minuten.\""));
  data.add(Item(headerValue: "Pulsmesser", expandedValue: "toDo"));
  data.add(Item(headerValue: "Trainingsplan", expandedValue: "toDo"));
  data.add(Item(headerValue: "VO2max", expandedValue: "toDo"));
  data.add(Item(headerValue: "Wettkampf WSA", expandedValue: "toDo"));

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
