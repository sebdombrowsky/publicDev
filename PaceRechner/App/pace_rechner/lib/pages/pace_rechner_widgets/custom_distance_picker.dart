import 'package:flutter/cupertino.dart';

class CustomDistancePicker extends StatefulWidget {
  final TextEditingController controller;
  const CustomDistancePicker({Key? key, required this.controller})
      : super(key: key);

  @override
  _CustomDistancePickerState createState() => _CustomDistancePickerState();
}

class _CustomDistancePickerState extends State<CustomDistancePicker> {
  String anzeige = "00.00";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDistancePicker(
          context: context,
          child: BottomDistancePicker(
            key: null,
            child: CupertinoPicker(
              backgroundColor:
                  CupertinoColors.systemBackground.resolveFrom(context),
              itemExtent: 50,
              scrollController: FixedExtentScrollController(initialItem: 0),
              children: const [
                Text("Halbmarathon"),
                Text("Marathon"),
                Text("1 Km"),
                Text("2 Km"),
                Text("3 Km"),
                Text("4 Km"),
                Text("5 Km"),
                Text("6 Km"),
                Text("7 Km"),
                Text("8 Km"),
                Text("9 Km"),
                Text("10 Km"),
                Text("11 Km"),
                Text("12 Km"),
                Text("13 Km"),
                Text("14 Km"),
                Text("15 Km"),
                Text("16 Km"),
                Text("17 Km"),
                Text("18 Km"),
                Text("19 Km"),
                Text("20 Km"),
                Text("21 Km"),
                Text("22 Km"),
                Text("23 Km"),
                Text("24 Km"),
                Text("25 Km"),
                Text("26 Km"),
                Text("27 Km"),
                Text("28 Km"),
                Text("29 Km"),
                Text("30 Km"),
                Text("31 Km"),
                Text("32 Km"),
                Text("33 Km"),
                Text("34 Km"),
                Text("35 Km"),
                Text("36 Km"),
                Text("37 Km"),
                Text("38 Km"),
                Text("39 Km"),
                Text("40 Km"),
                Text("41 Km"),
                Text("42 Km"),
              ],
              onSelectedItemChanged: (newDistance) {
                setState(() {
                  widget.controller.text = SetDistance(newDistance);
                });
              },
            ),
          ),
        );
      },
      child: Text(
        widget.controller.text == "" ? anzeige : widget.controller.text,
        style: const TextStyle(
            color: CupertinoColors.activeOrange,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

void showDistancePicker({
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

String SetDistance(int distancePos) {
  if (distancePos == 0) {
    return "21.1";
  } else if (distancePos == 1) {
    return "42.2";
  } else {
    return (distancePos - 1).toString();
  }
}

class BottomDistancePicker extends StatelessWidget {
  const BottomDistancePicker({
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
