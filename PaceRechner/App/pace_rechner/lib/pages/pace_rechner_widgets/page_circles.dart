import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageCircles extends StatefulWidget {
  PageController controller;
  PageCircles({Key? key, required this.controller}) : super(key: key);

  @override
  _PageCirclesState createState() => _PageCirclesState();
}

class _PageCirclesState extends State<PageCircles> {
  double page = 0;
  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      setState(() {
        page = widget.controller.page!;
      });
    });
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: page >= 0 && page < 0.5
                        ? CupertinoColors.systemIndigo
                        : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: page >= 0.5 && page < 1.5
                        ? CupertinoColors.systemIndigo
                        : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: page >= 1.5 && page <= 2
                        ? CupertinoColors.systemIndigo
                        : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
