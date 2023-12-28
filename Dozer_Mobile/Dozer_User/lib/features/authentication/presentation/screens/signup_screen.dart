import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Dozer/core/utils/colors.dart';
import '../auth/auth.dart';
import '../widget/rounded_button.dart';
import '../widget/text_field.dart';
import 'login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Dozer/features/home.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? errorMessage = '';
  bool isEmailError = false;
  bool isEmailInUse = false;
  bool isPasswordWeak = false;
  bool isPasswordShort = false;
  bool isLogin = true;
  bool isFieldEmpty = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    // Validate input fields
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
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
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'Password should be at least 6 characters';
        isPasswordWeak = true; // Reset isEmailError for other types of errors
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
        isEmailInUse = true;
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email address.';
        isEmailError = true;
      } else {
        errorMessage = 'An error occurred: ${e.message}';
        isEmailError = false; // Reset isEmailError for other types of errors
      }
    } catch (e) {
      errorMessage = 'An unexpected error occurred.';
      isEmailError = false; // Reset isEmailError for other types of errors
      print(e);
    }
    setState(() {});
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
                child: 
                Image.asset(
                  'assets/images/logo.png',
                  width: 40.w,
                  height: 23.h,
                ),
                // SvgPicture.asset(
                //   'assets/images/logo.svg',
                //   width: 20.w,
                //   height: 20.h,
                // ),
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
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Full Name',
                      icon: Icons.person,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      icon: Icons.email,
                      isError: isEmailError,
                    ),
                    if (isEmailError)
                      Text(
                        errorMessage ?? '',
                        style: TextStyle(color: Colors.red),
                      ),
                    if (isEmailInUse)
                      Text(
                        errorMessage ?? '',
                        style: TextStyle(color: Colors.red),
                      ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      icon: Icons.lock,
                    ),
                    if (isPasswordWeak)
                      Text(
                        errorMessage ?? '',
                        style: TextStyle(color: Colors.red),
                      ),
                    if (isPasswordShort)
                      Text(
                        errorMessage ?? '',
                        style: TextStyle(color: Colors.red),
                      ),
                    if (isFieldEmpty)
                      Text(
                        'All fields must be filled.',
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: 6.h),
                    RoundedButton(
                      width: double.infinity,
                      buttonColor: primary,
                      onPressed: createUserWithEmailAndPassword,
                      child: Text(
                        'Sign Up',
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
