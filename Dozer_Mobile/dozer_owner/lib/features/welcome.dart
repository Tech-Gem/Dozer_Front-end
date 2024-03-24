import 'package:DozerOwner/core/routes/route_names.dart';
import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/features/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                width: 300.w,
                height: 300.h, // Responsive width based on screen width
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
                height: 100.h,
              ), // Responsive height
              RoundedButton(
                onPressed: () {
                  context.go('/${AppRoutes.signup}');
                },
                height: 50.h, // Responsive height
                width: 300.w, // Responsive width
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
              SizedBox(height: 20.h), // Responsive height

              RoundedButton(
                onPressed: () {
                  context.go('/${AppRoutes.login}');
                },
                height: 50.h, // Responsive height
                width: 300.w, // Responsive width
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
