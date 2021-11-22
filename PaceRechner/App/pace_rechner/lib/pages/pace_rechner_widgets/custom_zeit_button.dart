import 'package:flutter/material.dart';

class CustomZeitButton extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const CustomZeitButton(
      {Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  State<CustomZeitButton> createState() => _CustomZeitButtonState();
}

class _CustomZeitButtonState extends State<CustomZeitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => SetZeit(widget.text, widget.controller),
        child: Material(
          elevation: 26,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red[200]),
            child: Center(
                child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            )),
          ),
        ),
      ),
    );
  }

  void SetZeit(String _text, TextEditingController _controller) {
    if (_text == "1 Minute") {
      setState(() {
        _controller.text = "1 min";
      });
    }
    if (_text == "5 Minuten") {
      setState(() {
        _controller.text = "5 min";
      });
    }
    if (_text == "30 Minuten") {
      setState(() {
        _controller.text = "30 min";
      });
    }
    if (_text == "1 Stunde") {
      setState(() {
        _controller.text = "60 min";
      });
    }
    if (_text == "2 Stunden") {
      setState(() {
        _controller.text = "120 min";
      });
    }
    if (_text == "4 Stunden") {
      setState(() {
        _controller.text = "240 min";
      });
    }
  }
}
