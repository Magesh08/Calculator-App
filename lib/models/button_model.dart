import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final VoidCallback?
      buttontapped; // Define buttontapped as a function with no parameters
  final Color color;
  final Color textColor;
  final String buttonText;

  const MyButtons({
    Key? key,
    required this.buttontapped,
    required this.color,
    required this.textColor,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped, // Execute buttontapped function when tapped
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
