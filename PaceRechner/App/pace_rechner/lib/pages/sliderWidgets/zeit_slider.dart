import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ZeitSlider extends StatefulWidget {
  TextEditingController controller;
  final Function onChange;
  final Size size;
  ZeitSlider({Key? key, required this.controller, required this.onChange, required this.size}) : super(key: key);

  @override
  State<ZeitSlider> createState() => _ZeitSliderState();
}

class _ZeitSliderState extends State<ZeitSlider> {
   String LastValue = "";
   String ConvertDoubleToTime(double value)
   {
    var hours = (value ~/ 60).toString();
    var minutes = ((value % 60)).round().toStringAsFixed(0);

    if (minutes == "60")
    {
      return LastValue;
    }
    if (hours.length == 1)
    {
      hours = "0" + hours;
    }
    if (minutes.length == 1)
    {
      minutes = "0" + minutes;
    }
    LastValue = hours + ":" + minutes;
    return LastValue;
   }

  @override
  Widget build(BuildContext context) {
     return SleekCircularSlider(
      initialValue: 119.00,
      max: 1440,
      appearance: CircularSliderAppearance(
        size: widget.size.width * 0.6,
        customColors: CustomSliderColors(
          trackColor: CupertinoColors.activeOrange,
          progressBarColor: Colors.red,
        ),
        customWidths: CustomSliderWidths(
          trackWidth: 10,
          handlerSize: 20,
          progressBarWidth: 30,
        ),
        infoProperties: InfoProperties(
          modifier: (value) => ConvertDoubleToTime(value),
          mainLabelStyle: TextStyle(fontSize: 25, color: Colors.white),
        ),
        angleRange: 360,
        startAngle: 90,
      ),
      onChange: (double value) {
        widget.controller.text = ConvertDoubleToTime(value);
        widget.onChange();
      },
    );
  }
}