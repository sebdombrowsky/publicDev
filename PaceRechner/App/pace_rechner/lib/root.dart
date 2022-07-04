import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/herzfrequenz_page.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/distance_page.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/pace_page.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/time_page.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HerzfrequenzPage(size: MediaQuery.of(context).size, title: "Puls",),
          PacePage(size: MediaQuery.of(context).size, title: "Pace",),
          DistancePage(size: MediaQuery.of(context).size, title: "Distanz",),
          TimePage(size: MediaQuery.of(context).size, title: "Zeit",)
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: 60,
        currentIndex: _currentIndex,
        inactiveColor: CupertinoColors.inactiveGray,
        activeColor: CupertinoColors.activeOrange,
        iconSize: 30,
        backgroundColor: CupertinoColors.darkBackgroundGray,
        border: Border(top: BorderSide(color: CupertinoColors.activeBlue, width: 0.0)),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Puls"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: "Pace"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.signpost),
            label: "Distanz"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Zeit"
          )
        ],
      ),
    );
  }
}
