import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_page.dart';
import 'package:pace_rechner/pages/pace_rechner_page.dart';
import 'package:pace_rechner/pages/tipps_page.dart';

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
        children: const [
          HerzfrequenzRechnerPage(),
          PaceRechnerPage(),
          TippsPage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        inactiveColor: CupertinoColors.inactiveGray,
        activeColor: CupertinoColors.activeOrange,
        iconSize: 35,
        backgroundColor: CupertinoColors.darkBackgroundGray,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
          ),        
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
          )
        ],
      ),
    );
  }
}
