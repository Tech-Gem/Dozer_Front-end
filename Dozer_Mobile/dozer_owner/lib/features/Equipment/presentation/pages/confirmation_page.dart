import 'package:flutter/material.dart';
import 'package:DozerOwner/core/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Container(
        padding: EdgeInsets.all(4.w),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 16.h,
              color: Colors.green,
            ),
            SizedBox(height: 4.h),
            Text(
              'Your Equipment form has been submitted!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Our Engineer will contact you soon for a review.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: greyTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
