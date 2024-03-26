import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;

  MyButtons({
    required this.color, // Marked as required
    required this.buttonText, // Marked as required
    required this.textColor, // Marked as required
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: color,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 16, // Adjust the font size as needed
            ),
          ),
        ),
      ),
    );
  }
}
