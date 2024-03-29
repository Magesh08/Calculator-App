import 'package:flutter/material.dart';

class MyButtons extends StatefulWidget {
  final VoidCallback? buttontapped;
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
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      onTap: widget.buttontapped,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: widget.color,
            child: Center(
              child: Text(
                widget.buttonText,
                style: TextStyle(color: widget.textColor, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
