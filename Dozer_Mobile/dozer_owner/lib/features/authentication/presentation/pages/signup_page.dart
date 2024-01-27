import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/features/welcome.dart';
import 'package:DozerOwner/features/widgets/rounded_button.dart';
import 'package:DozerOwner/features/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 1.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        width: 60.w,
                        height: 30.h, // Responsive width based on screen width
                      ),
                    ),
                    Text(
                      'Register to Dozer',
                      style: TextStyle(
                        fontSize:
                            20.sp, // Responsive font size based on screen width
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Create your Dozer account to explore your dream place to rent your construction materials',
                      style: TextStyle(
                        fontSize:
                            17.sp, // Responsive font size based on screen width
                        color: greyTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text('Full Name'),
                    ), // Responsive height
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Full Name',
                      icon: Icons.person,
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text('Email Address'),
                    ), // Responsive height
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Email ',
                      icon: Icons.email,
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text('Phone Number'),
                    ), // Responsive height
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Phone Number',
                      icon: Icons.phone,
                    ),
                    SizedBox(height: 4.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RoundedButton(
                          height: 4.h,
                          width: 8.w,
                          buttonColor: primaryColor,
                          child: Text('Next', style: TextStyle(color: white)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomePage(),
                              ),
                            );
                          }),
                    ),
                  ]),
            ),
          )),
    );
  }
}
