import 'package:dozer_owner/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({
    super.key,
    required this.boxHeight,
    required this.child,
  });
  final double boxHeight;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: 6.h,
            horizontal: 16.w),
        child: Container(
            height: boxHeight.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: child));
  }
}