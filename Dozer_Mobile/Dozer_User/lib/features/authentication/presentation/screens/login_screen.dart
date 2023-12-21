import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';
import '../widget/rounded_button.dart';
import '../widget/text_field.dart';

class LonginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 4.h, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Don't have an account yet? Sign up now ",
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'here',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              CustomTextField(
                controller: phoneNumberController,
                hintText: 'Email',
                icon: Icons.phone,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                icon: Icons.lock,
              ),
              SizedBox(height: 16.h),
              RoundedButton(
                width: double.infinity,
                buttonColor: primaryColor,
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 2.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 1.5,
                      thickness: 0.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 2.h,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 1.5,
                      thickness: 0.3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              RoundedButton(
                onPressed: () {
                  // Handle sign up with Google logic here
                },
                height: 6.h,
                width: double.infinity,
                child: Text('Sign in with Google')
                // buttonColor: Colors.red, // Custom button color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
