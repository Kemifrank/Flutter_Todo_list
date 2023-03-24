import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;

 myButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xFF219ebc),

      child: Text(text),
    );
  }
}
