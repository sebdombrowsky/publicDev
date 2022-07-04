import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DistanzSlider extends StatefulWidget {
  TextEditingController controller;
  final Function onChange;
  final Size size;
  DistanzSlider({Key? key, required this.controller, required this.onChange, required this.size}) : super(key: key);

  @override
  State<DistanzSlider> createState() => _DistanzSliderState();
}

class _DistanzSliderState extends State<DistanzSlider> {
  String DistanzModifier(double value) {

    var roundedValue = value.toStringAsFixed(1);

    if (roundedValue == "21.1") {
      return "Halbmarathon";
    }
    if (roundedValue == "42.2") {
      return "Marathon";
    }

    return '$roundedValue Km';
  }

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      initialValue: 21.1,
      appearance: CircularSliderAppearance(
        size: widget.size.width * 0.6,
        customColors: CustomSliderColors(
          trackColor: CupertinoColors.activeOrange,
          progressBarColor: Colors.lightGreen,
        ),
        customWidths: CustomSliderWidths(
          trackWidth: 10,
          handlerSize: 20,
          progressBarWidth: 30,
        ),
        infoProperties: InfoProperties(
          modifier: (value) => DistanzModifier(value),
          mainLabelStyle: TextStyle(fontSize: 25, color: Colors.white),
        ),
        angleRange: 360,
        startAngle: 90,
      ),
      onChange: (double value) {
        widget.controller.text = value.toString();
        widget.onChange();
      },
    );
  }
}
