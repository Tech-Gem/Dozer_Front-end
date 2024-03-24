import 'package:DozerOwner/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color buttonColor;

  RoundedButton({
    required this.child,
    required this.onPressed,
    this.height = 50.0, // Default height
    this.width = 120.0, // Default width
    this.buttonColor = modalBackgroundColor, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
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
