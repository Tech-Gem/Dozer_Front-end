import 'package:DozerOwner/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final bool isError;
  final String? Function(String?)?  validator;

  const CustomTextField({super.key, 
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.isError = false, 
    this.validator
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        color: textFieldColor,
      ),
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon) : null,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
          ),
        ),
      ),
    );
  }
}
