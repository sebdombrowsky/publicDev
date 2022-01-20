import 'package:flutter/material.dart';
import 'package:pace_rechner/pages/herzfrequenz_rechner_widgets/herzfrequenz_page.dart';

class HerzfrequenzPageView extends StatefulWidget {
  PageController pageController;
  HerzfrequenzPageView({Key? key, required this.pageController})
      : super(key: key);

  @override
  _HerzfrequenzPageViewState createState() => _HerzfrequenzPageViewState();
}

class _HerzfrequenzPageViewState extends State<HerzfrequenzPageView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: PageView(
        controller: widget.pageController,
        children: [
          HerzfrequenzPage(
            size: size,
            title: "Herzfrequenz",
          ),
        ],
      ),
    );
  }
}
