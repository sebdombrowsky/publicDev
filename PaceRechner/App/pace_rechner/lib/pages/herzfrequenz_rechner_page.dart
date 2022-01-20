import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/herzfrequenz_page_view.dart';

import 'pace_rechner_widgets/pop_up_dialog.dart';

class HerzfrequenzRechnerPage extends StatefulWidget {
  const HerzfrequenzRechnerPage({ Key? key }) : super(key: key);

  @override
  _HerzfrequenzRechnerPageState createState() => _HerzfrequenzRechnerPageState();
}

class _HerzfrequenzRechnerPageState extends State<HerzfrequenzRechnerPage> {
  @override
  Widget build(BuildContext context) {

    PageController pageController = PageController(viewportFraction: 0.95);

    return Scaffold(
      backgroundColor: Colors.grey[850], // CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        title: Text(
          "Pace Me",
          style: TextStyle(fontFamily: "Orbitron", fontSize: 35),
        ),
        centerTitle: true,
        backgroundColor: CupertinoColors.systemIndigo,
        leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => PopUpDialog());
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HerzfrequenzPageView(pageController: pageController,),
            ],
          ),
        ),
      ),
    );
  }
}