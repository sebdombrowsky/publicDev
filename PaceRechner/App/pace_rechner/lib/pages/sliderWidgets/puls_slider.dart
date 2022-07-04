import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PulsSlider extends StatefulWidget {
  TextEditingController controller;
  final Function onChange;
  final Size size;
  PulsSlider({Key? key, required this.controller, required this.onChange, required this.size}) : super(key: key);

  @override
  State<PulsSlider> createState() => _PulsSliderState();
}

class _PulsSliderState extends State<PulsSlider> {

  String ProzentModifier(double value)
  {
    return value.round().toString() + " %";
  }

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      initialValue: 50,
      max: 100,
      appearance: CircularSliderAppearance(
        size: widget.size.width * 0.6,
        customColors: CustomSliderColors(
          dotColor: CupertinoColors.systemRed,
          trackColor: CupertinoColors.activeOrange,
          progressBarColor: CupertinoColors.white,
        ),
        customWidths: CustomSliderWidths(
          trackWidth: 10,
          handlerSize: 20,
          progressBarWidth: 30,
        ),
        infoProperties: InfoProperties(
          modifier: (value) => ProzentModifier(value),
          mainLabelStyle: TextStyle(fontSize: 25, color: Colors.white),
        ),
        angleRange: 360,
        startAngle: 90,
      ),
      onChange: (double value) {
        widget.controller.text = ProzentModifier(value).split(' ')[0];
        widget.onChange();
      },
    );
  }
}