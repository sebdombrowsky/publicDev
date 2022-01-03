import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/distance_page.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/pace_page.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/time_page.dart';

class PageViewWidget extends StatefulWidget {
  Rechner rechner = Rechner();
  TextEditingController distanzController = TextEditingController();
  TextEditingController zeitController = TextEditingController();
  TextEditingController paceController = TextEditingController();
  PageController pageController;
  PageViewWidget({
    Key? key,
    required this.pageController
  }) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  
  @override
  Widget build(BuildContext context) {
        //default Werte
    widget.distanzController.text =
        widget.distanzController.text == "" ? "21.1" : widget.distanzController.text;
    widget.zeitController.text =
        widget.zeitController.text == "" ? "01:59" : widget.zeitController.text;
    widget.paceController.text =
        widget.paceController.text == "" ? "05:40" : widget.paceController.text;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.6,
      child: PageView(
        controller: widget.pageController,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PacePage(size: size, title: "Pace", distanzController: widget.distanzController, zeitController: widget.zeitController, paceController: widget.paceController,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DistancePage(size: size, title: "Distance", distanzController: widget.distanzController, zeitController: widget.zeitController, paceController: widget.paceController,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TimePage(size: size, title: "Time", distanzController: widget.distanzController, zeitController: widget.zeitController, paceController: widget.paceController,),
          ),
        ],
      ),
    );
  }
}
