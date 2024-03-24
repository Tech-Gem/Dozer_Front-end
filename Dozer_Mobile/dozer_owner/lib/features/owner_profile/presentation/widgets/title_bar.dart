import 'package:DozerOwner/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String iconName;
  final VoidCallback action;
  final double height;

  const TitleBar({
    Key? key,
    required this.title,
    required this.iconName,
    required this.action,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: height), // Use the height value here
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (title == "Edit Profile")
              ? IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/back_icon.svg",
                    color: primaryColor,
                    width: 40.w,
                    height: height, // Use the height value here
                  ),
                )
              : const SizedBox.shrink(),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: primaryColor,
                fontFamily: 'Urbanist',
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                height: 10.h,
              ),
            ),
          ),
          IconButton(
            onPressed: action,
            icon: SvgPicture.asset(
              "assets/images/$iconName.svg",
              color: primaryColor,
              width: 100.w,
              height: height, // Use the height value here
            ),
          ),
        ],
      ),
    );
  }
}
