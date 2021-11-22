import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Icon icon;
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Function? onTap;
  
  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.textInputType,
      required this.controller,
      this.onTap})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 300,
        child: Center(
          child: TextField(
            autofocus: false,
            onTap: () => {SetOnTapState()},
            controller: widget.controller,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.hintText,
                icon: widget.icon),
            keyboardType: widget.textInputType,
          ),
        ),
      ),
    );
  }

  void SetOnTapState() {
    setState(() {
      widget.onTap!();
      widget.controller.text.split(' ').length > 1
          ? widget.controller.text = widget.controller.text.split(' ')[0]
          : () => {};
    });
  }
}
