import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/features/authentication/presentation/pages/login_page.dart';
import 'package:DozerOwner/features/authentication/presentation/pages/signup_page.dart';
import 'package:DozerOwner/features/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.jpg',
                width: 60.w,
                height: 45.h, // Responsive width based on screen width
              ),
              Text(
                'Welcome to Dozer',
                style: TextStyle(
                  fontSize: 20.sp, // Responsive font size based on screen width
                  fontWeight: FontWeight.bold,
                  color: greyTextColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ), // Responsive height
              RoundedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                  // Handle Signup button press
                },
                height: 6.h, // Responsive height
                width: 80.w, // Responsive width
                buttonColor: primaryColor,
                child: Text(
                  "Signup",
                  style: TextStyle(
                    fontSize:
                        18.sp, // Responsive font size based on screen width
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ), // Custom button color
              ),
              SizedBox(height: 4.h), // Responsive height

              RoundedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                  // Handle Login button press
                },
                height: 6.h, // Responsive height
                width: 80.w, // Responsive width
                buttonColor: primaryColor,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize:
                        18.sp, // Responsive font size based on screen width
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ), // Custom button color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
