import 'package:dozer_owner/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldDropDown<T> extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final Color borderColor;
  final double borderWidth;
  final Map<String, T> dropdownValues;
  final FormFieldValidator<T>? validator;

  CustomTextFieldDropDown({
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    required this.dropdownValues,
    this.validator,
  });

  @override
  _CustomTextFieldDropDownState<T> createState() =>
      _CustomTextFieldDropDownState<T>();
}

class _CustomTextFieldDropDownState<T>
    extends State<CustomTextFieldDropDown<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null; // Set the initial value to null
  }

  String? validate(T? value) {
    if (widget.validator != null) {
      return widget.validator!(value);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        color: textFieldColor,
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: selectedValue,
          onChanged: (newValue) {
            widget.controller.text = newValue.toString();
            setState(() {
              selectedValue = newValue;
            });
          },
          validator: validate,
          items: widget.dropdownValues.entries.map((entry) {
            final value = entry.value;
            return DropdownMenuItem<T>(
              value: value,
              child: Text(
                entry.key,
                style: TextStyle(fontSize: 14.sp),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.w),
            ),
          ),
        ),
      ),
    );
  }
}