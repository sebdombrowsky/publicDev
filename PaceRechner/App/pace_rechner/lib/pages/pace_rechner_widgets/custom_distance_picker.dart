import 'package:flutter/cupertino.dart';

class CustomDistancePicker extends StatefulWidget {
  final TextEditingController controller;
  final Function onChange;
  const CustomDistancePicker({Key? key, required this.controller, required this.onChange})
      : super(key: key);

  @override
  _CustomDistancePickerState createState() => _CustomDistancePickerState();
}

class _CustomDistancePickerState extends State<CustomDistancePicker> {
  String anzeige = "21.1";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showDistancePicker(
            context: context,
            child: BottomDistancePicker(
              key: null,
              child: CupertinoPicker(
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                itemExtent: 40,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: const [
                  Center(child: Text("Halbmarathon")),
                  Center(child: Text("Marathon")),
                  Center(child: Text("1 Km")),
                  Center(child: Text("2 Km")),
                  Center(child: Text("3 Km")),
                  Center(child: Text("4 Km")),
                  Center(child: Text("5 Km")),
                  Center(child: Text("6 Km")),
                  Center(child: Text("7 Km")),
                  Center(child: Text("8 Km")),
                  Center(child: Text("9 Km")),
                  Center(child: Text("10 Km")),
                  Center(child: Text("11 Km")),
                  Center(child: Text("12 Km")),
                  Center(child: Text("13 Km")),
                  Center(child: Text("14 Km")),
                  Center(child: Text("15 Km")),
                  Center(child: Text("16 Km")),
                  Center(child: Text("17 Km")),
                  Center(child: Text("18 Km")),
                  Center(child: Text("19 Km")),
                  Center(child: Text("20 Km")),
                  Center(child: Text("21 Km")),
                  Center(child: Text("22 Km")),
                  Center(child: Text("23 Km")),
                  Center(child: Text("24 Km")),
                  Center(child: Text("25 Km")),
                  Center(child: Text("26 Km")),
                  Center(child: Text("27 Km")),
                  Center(child: Text("28 Km")),
                  Center(child: Text("29 Km")),
                  Center(child: Text("30 Km")),
                  Center(child: Text("31 Km")),
                  Center(child: Text("32 Km")),
                  Center(child: Text("33 Km")),
                  Center(child: Text("34 Km")),
                  Center(child: Text("35 Km")),
                  Center(child: Text("36 Km")),
                  Center(child: Text("37 Km")),
                  Center(child: Text("38 Km")),
                  Center(child: Text("39 Km")),
                  Center(child: Text("40 Km")),
                  Center(child: Text("41 Km")),
                  Center(child: Text("42 Km")),
                  Center(child: Text("43 Km")),
                  Center(child: Text("44 Km")),
                  Center(child: Text("45 Km")),
                  Center(child: Text("46 Km")),
                  Center(child: Text("47 Km")),
                  Center(child: Text("48 Km")),
                  Center(child: Text("49 Km")),
                  Center(child: Text("50 Km")),
                ],
                onSelectedItemChanged: (newDistance) {
                  setState(() {
                    widget.controller.text = SetDistance(newDistance);
                    widget.onChange();
                  });
                },
              ),
            ),
          );
        },
        child: Text(
          widget.controller.text == "" ? anzeige : widget.controller.text,
          style: const TextStyle(
              color: CupertinoColors.activeGreen,
              fontSize: 30,
              fontFamily: "Orbitron"),
        ),
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
