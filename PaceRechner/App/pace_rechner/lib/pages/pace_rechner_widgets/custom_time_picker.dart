import 'package:flutter/cupertino.dart';

class CustomTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final CupertinoTimerPickerMode mode;
  const CustomTimePicker(
      {Key? key, required this.controller, required this.mode})
      : super(key: key);

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  Duration timer = const Duration();
  String anzeige = "";

  @override
  Widget build(BuildContext context) {
    anzeige = widget.mode == CupertinoTimerPickerMode.hm ? "hh:mm" : "mm:ss";
    return GestureDetector(
      onTap: () {
        showTimePicker(
          context: context,
          child: BottomTimePicker(
            key: null,
            child: CupertinoTimerPicker(
              mode: widget.mode,
              backgroundColor:
                  CupertinoColors.systemBackground.resolveFrom(context),
              initialTimerDuration: timer,
              onTimerDurationChanged: (newTimer) {
                setState(() {
                  timer = newTimer;
                  widget.controller.text =
                      widget.mode == CupertinoTimerPickerMode.hm
                          ? newTimer.toString().split(':')[0] +
                              ":" +
                              newTimer.toString().split(':')[1]
                          : newTimer.toString().split(':')[1] +
                              ":" +
                              newTimer.toString().split(':')[2].split('.')[0];
                });
              },
            ),
          ),
        );
      },
      child: Text(
        widget.controller.text == "" ? anzeige : widget.controller.text,
        /*widget.mode == CupertinoTimerPickerMode.hm
            ? '${timer.inHours}:'
                '${(timer.inMinutes % 60).toString().padLeft(2, '0')}'
            : '${timer.inMinutes}:' //(timer.inMinutes % 60).toString().padLeft(2, '0')
                '${(timer.inSeconds % 60).toString().padLeft(2, '0')}',*/
        style: const TextStyle(
            color: CupertinoColors.activeOrange,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

void showTimePicker({
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

class BottomTimePicker extends StatelessWidget {
  const BottomTimePicker({
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
