import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_page.dart';
import 'package:pace_rechner/pages/pace_rechner_page.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          PaceRechnerPage(),
          HerzfrequenzRechnerPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        unselectedItemColor: CupertinoColors.inactiveGray,
        selectedItemColor: CupertinoColors.white,
        selectedFontSize: 18,
        backgroundColor: CupertinoColors.systemIndigo,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Pace",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Pulse",
          )
        ],
      ),
    );
  }
}
