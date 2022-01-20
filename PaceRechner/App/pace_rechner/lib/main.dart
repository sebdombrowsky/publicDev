import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_page.dart';
import 'package:pace_rechner/pages/pace_rechner_page.dart';
import 'package:pace_rechner/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/root": (BuildContext context) => RootWidget(),
        "/pace": (BuildContext context) => PaceRechnerPage(),
        "/puls": (BuildContext context) => HerzfrequenzRechnerPage(),
      },
      home: RootWidget(),
    );
  }
}
