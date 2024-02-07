import 'package:Dozer/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final Color borderColor;
  final double borderWidth;
  final FormFieldValidator<String>? validator; // Add validator property

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.validator, // Initialize validator property
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        color: textFieldColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      child: TextFormField(
        // Change TextField to TextFormField
        controller: controller,
        obscureText: obscureText,
        validator: validator, // Assign validator property
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon) : null,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.w),
          ),
        ),
      ),
    );
  }
}
