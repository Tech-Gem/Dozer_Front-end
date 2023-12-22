import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Dozer/core/utils/colors.dart';
import '../auth/auth.dart';
import '../widget/rounded_button.dart';
import '../widget/text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
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
              SizedBox(height: 5.h),
              CustomTextField(
                controller: nameController,
                hintText: 'Full Name',
                icon: Icons.person,
              ),
              // SizedBox(height: 1.h),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email,
              ),
              // SizedBox(height: 1.h),
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

                // buttonColor: Colors.red, // Custom button color
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
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
