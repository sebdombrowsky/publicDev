import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMaxPulsePicker extends StatefulWidget {
  final TextEditingController controller;
  final Function onChange;
  final int initial;
  const CustomMaxPulsePicker(
      {Key? key, required this.controller, required this.onChange, required this.initial})
      : super(key: key);

  @override
  _CustomMaxPulsePickerState createState() => _CustomMaxPulsePickerState();
}

class _CustomMaxPulsePickerState extends State<CustomMaxPulsePicker> {
  String anzeige = "190";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showPulsePicker(
            context: context,
            child: BottomPulsePicker(
              key: null,
              child: CupertinoPicker(
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                itemExtent: 40,
                scrollController: FixedExtentScrollController(initialItem: widget.initial),
                children: [
                  for(int i = 0; i < 111; i++) Center(child: Text((i+120).toString())),
                ],
                onSelectedItemChanged: (newPulse) {
                  setState(() {
                    widget.controller.text = (newPulse+120).toString();
                    widget.onChange();
                  });
                },
              ),
            ),
          );
        },
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            widget.controller.text == "" ? anzeige : widget.controller.text,
            style: const TextStyle(
                color: CupertinoColors.destructiveRed,
                fontSize: 30,
                fontFamily: "Orbitron"),
          ),
        ),
      ),
    );
  }
}
void showPulsePicker({
  required BuildContext context,
  required Widget child,
}) {
  final themeData = CupertinoTheme.of(context);
  final dialogBody = CupertinoTheme(
    data: themeData,
    child: child,
  );

  showCupertinoModalPopup<void>(
    context: context,
    builder: (context) => dialogBody,
  );
}

class BottomPulsePicker extends StatelessWidget {
  const BottomPulsePicker({
    required Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}
