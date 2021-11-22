import 'package:flutter/material.dart';

class CustomDistanzButton extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const CustomDistanzButton(
      {Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  State<CustomDistanzButton> createState() => _CustomDistanzButtonState();
}

class _CustomDistanzButtonState extends State<CustomDistanzButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => SetDistanz(widget.text, widget.controller),
        child: Material(
          elevation: 26,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green[400]),
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

  void SetDistanz(String _text, TextEditingController _controller) {
    if (_text == "1 Km") {
      setState(() {
        _controller.text = "1.00 Km";
      });
    }
    if (_text == "5 Km") {
      setState(() {
        _controller.text = "5.00 Km";
      });
    }
    if (_text == "10 Km") {
      setState(() {
        _controller.text = "10.00 Km";
      });
    }
    if (_text == "15 Km") {
      setState(() {
        _controller.text = "15.00 Km";
      });
    }
    if (_text == "Halbmarathon") {
      setState(() {
        _controller.text = "21.09 Km";
      });
    }
    if (_text == "Marathon") {
      setState(() {
        _controller.text = "42.2 Km";
      });
    }
  }
}
