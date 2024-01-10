import 'package:Dozer/features/authentication/presentation/auth/auth.dart';
import 'package:Dozer/features/authentication/presentation/screens/otp_verification.dart';
import 'package:Dozer/features/authentication/presentation/widget/rounded_button.dart';
import 'package:Dozer/features/authentication/presentation/widget/text_field.dart';
import 'package:Dozer/features/home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Dozer/core/utils/colors.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? errorMessage = '';
  bool isFullNameError = false;
  bool isPhoneNumberError = false;
  bool isLogin = true;
  bool isFieldEmpty = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> signUpWithPhoneNumber() async {
    // Validate input fields
    if (phoneNumberController.text.trim().isEmpty) {
      errorMessage = 'All fields must be filled.';
      isFieldEmpty = true;
    } else {
      isFieldEmpty = false; // Reset isFieldEmpty if all fields are filled
    }

    if (isFieldEmpty) {
      setState(() {});
      return;
    }

    try {
      // Send OTP to the provided phone number
      await Auth().sendOtpToPhoneNumber(phoneNumberController.text.trim());

      // Navigate to the OTP verification screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(
            phoneNumber: phoneNumberController.text.trim(),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await Auth().signInWithGoogle();
      // Navigate to the home screen after successful sign-in
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 40.w,
                  height: 23.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Column(
                  children: [
                    Text(
                      'Welcome to our app!',
                      style: TextStyle(
                        fontSize: 3.5.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Please sign up to get started.',
                      style: TextStyle(fontSize: 2.h),
                    ),
                    SizedBox(height: 1.h),
                    // CustomTextField(
                    //   controller: fullNameController,
                    //   hintText: 'Full Name',
                    //   icon: Icons.person,
                    //   isError: isFullNameError,
                    // ),
                    // if (isFullNameError)
                    //   Text(
                    //     errorMessage ?? '',
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    CustomTextField(
                      controller: phoneNumberController,
                      hintText: 'Phone Number',
                      icon: Icons.phone,
                      isError: isPhoneNumberError,
                    ),
                    if (isPhoneNumberError)
                      Text(
                        errorMessage ?? '',
                        style: TextStyle(color: Colors.red),
                      ),
                    // if (isFieldEmpty)
                    //   Text(
                    //     'All fields must be filled.',
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    SizedBox(height: 6.h),
                    RoundedButton(
                      width: double.infinity,
                      buttonColor: primary,
                      onPressed: signUpWithPhoneNumber,
                      child: Text(
                        'Send OTP',
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
                          ) ,
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
                        Auth().signInWithGoogle();
                      },
                      height: 6.h,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 10.h,
                            width: 10.w,
                          ),
                          SizedBox(width: 5.w),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(color: black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
