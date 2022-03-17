import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/tipps_page_widgets/custom_list_widget.dart';
import 'pace_rechner_widgets/pop_up_dialog.dart';

class TippsPage extends StatefulWidget {
  const TippsPage({Key? key}) : super(key: key);

  @override
  _TippsPageState createState() => _TippsPageState();
}

class _TippsPageState extends State<TippsPage> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ListWidget(),
          ],
        ),
      ),
    );
  }
}
