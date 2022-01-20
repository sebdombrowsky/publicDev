import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pace_rechner/models/rechner.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/distance_page.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/pace_page.dart';
import 'package:pace_rechner/pages/pace_rechner_widgets/time_page.dart';

class PacePageViewWidget extends StatefulWidget {
  Rechner rechner = Rechner();
  PageController pageController;
  PacePageViewWidget({
    Key? key,
    required this.pageController
  }) : super(key: key);

  @override
  State<PacePageViewWidget> createState() => _PacePageViewWidgetState();
}

class _PacePageViewWidgetState extends State<PacePageViewWidget> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.6,
      child: PageView(
        controller: widget.pageController,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PacePage(size: size, title: "Pace",),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DistancePage(size: size, title: "Distance",),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TimePage(size: size, title: "Time",),
          ),
        ],
      ),
    );
  }
}
