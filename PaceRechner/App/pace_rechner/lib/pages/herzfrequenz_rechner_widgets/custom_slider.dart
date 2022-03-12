import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  TextEditingController prozent;
  Function onChange;
  CustomSlider({Key? key, required this.prozent, required this.onChange})
      : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double currentValue = 50;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentValue,
      max: 100,
      divisions: 100,
      //label: currentValue.round().toString() + "%",
      onChanged: (double value) {
        setState(() {
          currentValue = value;
          widget.prozent.text = value.round().toString();
          widget.onChange();
        });
      },
    );
  }
}
