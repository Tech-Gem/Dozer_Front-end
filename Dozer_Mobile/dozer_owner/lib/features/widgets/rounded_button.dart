import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color buttonColor;
  final Color borderColor;
  final double borderWidth;

  const RoundedButton({
    required this.child,
    required this.onPressed,
    this.height = 50.0, // Default height
    this.width = 120.0, // Default width
    this.buttonColor = modalBackgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    // Default color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(child: child),
      ),
    );
  }
}
