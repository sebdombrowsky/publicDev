import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    final Function onPressed;
    final String text;
    final Color buttonColor;
    final IconData icon;
    final double width;
    final double height;
  const CustomButton({Key? key, required this.onPressed, required this.text, required this.buttonColor, required this.icon, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => onPressed(),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: buttonColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
