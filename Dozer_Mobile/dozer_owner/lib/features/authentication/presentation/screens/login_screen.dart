import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/core/validation/validation.dart';
import 'package:DozerOwner/features/authentication/auth/auth.dart';
import 'package:DozerOwner/features/authentication/presentation/screens/signup_screen.dart';
import 'package:DozerOwner/features/authentication/presentation/widget/rounded_button.dart';
import 'package:DozerOwner/features/authentication/presentation/widget/text_field.dart';
import 'package:DozerOwner/features/equipment/presentation/screens/equipment_info_filling_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage;
  bool isLogin = true;
  bool isEmailError = false;
  bool isPasswordError = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Future<void> signInWithEmailAndPassword() async {
  //   try {
  //     await Auth().(
  //       email: emailController.text.trim(),
  //       password: passwordController.text,
  //     );
  //     // Navigate to the home page after successful login
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => Home()),
  //       (route) => false,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       errorMessage = 'No user found for that email.';
  //       isEmailError = true;
  //       isPasswordError = false;
  //     } else if (e.code == 'invalid-email') {
  //       errorMessage = 'Invalid email address.';
  //       isEmailError = true;
  //       isPasswordError = false;
  //     } else if (e.code == 'wrong-password') {
  //       errorMessage = 'Wrong password provided for that user.';
  //       isEmailError = false;
  //       isPasswordError = true;
  //     } else {
  //       errorMessage = 'All fields must be filled.';
  //       isEmailError = false;
  //       isPasswordError = false;
  //     }
  //     // Update the UI to show the error message
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await Auth().signInWithGoogle();

      // Navigate to the home screen after successful sign-in
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoFillingPage()),
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
          child: Container(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: greyTextColor,
                      fontSize: 4.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                if (isEmailError)
                  Text(
                    errorMessage ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    icon: Icons.lock,
                    validator: Validator.validatePassword),
                if (isPasswordError)
                  Text(
                    errorMessage ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 10.h),
                if (errorMessage != null &&
                    errorMessage!.isNotEmpty &&
                    !isEmailError &&
                    !isPasswordError)
                  Text(
                    errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                    ),
                  ),
                // RoundedButton(
                //   width: double.infinity,
                //   buttonColor: primary,
                //   onPressed: signInWithEmailAndPassword,
                //   child: Text(
                //     'Login',
                //     style: TextStyle(
                //       fontSize: 2.h,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
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
                    signInWithGoogle(context);
                  },
                  height: 6.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        height: 4.h,
                        width: 4.h,
                      ),
                      const Text(
                        'Continue with Google',
                        style: TextStyle(color: black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Create new account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
