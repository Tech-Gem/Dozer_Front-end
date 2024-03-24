import 'package:DozerOwner/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditField extends StatelessWidget {
  const EditField(
      {super.key,
      required this.hintText,
      required this.iconName,
      required this.controllers,
      this.validator});
  final String iconName;
  final String hintText;
  final Map<String, TextEditingController> controllers;
  final validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 16.h, 0, 0),
      child: Container(
          height:55.h,
          decoration: BoxDecoration(
            color: greyTextColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
                child: Center(
                  child: SvgPicture.asset(
                    ("assets/images/$iconName.svg"),
                    color: primaryColor,
                    height: 20.h,
                    width: 20.w,
                  ),
                )),
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                    fontFamily: 'Urbanist', fontWeight: FontWeight.w400),
                validator: validator,
                controller: controllers[hintText],
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    color: red,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: greyTextColor2,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            )
          ])),
    );
  }
}