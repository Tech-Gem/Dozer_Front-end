import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Dozer/core/utils/colors.dart';
import 'package:Dozer/features/authentication/presentation/screens/signup_screen.dart';
import 'package:Dozer/features/home.dart';
import '../auth/auth.dart';
import '../widget/rounded_button.dart';
import '../widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: emailController.text.toString().trim(),
          password: passwordController.text);
      // Navigate to the home page after successful login
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        print(e);
      }
      // Update the UI to show the error message
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 4.h, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email,
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
                onPressed: signInWithEmailAndPassword,
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
                child: const Text(
                  'Continue with Google',
                  style: TextStyle(color: black),
                ),

                // buttonColor: Colors.red, // Custom button color
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
                                builder: (context) => SignUpScreen()),
                            (route) => false);
                      },
                      child: const Text(
                        "Sign up",
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
