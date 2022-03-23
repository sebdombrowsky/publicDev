import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/herzfrequenz_page_view.dart';


class HerzfrequenzRechnerPage extends StatefulWidget {
  const HerzfrequenzRechnerPage({Key? key}) : super(key: key);

  @override
  _HerzfrequenzRechnerPageState createState() =>
      _HerzfrequenzRechnerPageState();
}

class _HerzfrequenzRechnerPageState extends State<HerzfrequenzRechnerPage> {


  @override
  Widget build(BuildContext context) {
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
              HerzfrequenzPageView(
                pageController: pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
