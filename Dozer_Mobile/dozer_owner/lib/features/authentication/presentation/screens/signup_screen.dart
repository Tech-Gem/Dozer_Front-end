import 'package:DozerOwner/core/routes/route_names.dart';
import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/core/validation/validation.dart';
import 'package:DozerOwner/features/authentication/auth/auth.dart';
import 'package:DozerOwner/features/authentication/presentation/widget/rounded_button.dart';
import 'package:DozerOwner/features/authentication/presentation/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

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
      final otpCode =
          await Auth().sendOtpToPhoneNumber(phoneNumberController.text.trim());

      // ignore: use_build_context_synchronously
      context.go(
          '/${AppRoutes.otpVerfication}?phoneNumber=${phoneNumberController.text.trim()}&otpCode=$otpCode');
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await Auth().signInWithGoogle();
      context.go('/${AppRoutes.form}');
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
                  'assets/images/logo.jpg',
                  width: 200.w,
                  height: 200.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Column(
                  children: [
                    Text(
                      'Welcome to our app!',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Create your Dozer account as a construction materilal owner',
                      style: TextStyle(
                        fontSize:
                            14.sp, // Responsive font size based on screen width
                        color: greyTextColor,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: fullNameController,
                      hintText: 'Full Name',
                      icon: Icons.person,
                      isError: isFullNameError,
                    ),
                    if (isFullNameError)
                      Text(
                        errorMessage ?? '',
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: 15.h),
                    CustomTextField(
                      controller: phoneNumberController,
                      hintText: 'Phone Number',
                      icon: Icons.phone,
                      isError: isPhoneNumberError,
                      validator: Validator.validatePhoneNumber,
                    ),
                    if (isPhoneNumberError)
                      Text(
                        errorMessage ?? '',
                        style: const TextStyle(color: Colors.red),
                      ),
                    if (isFieldEmpty)
                      const Text(
                        'All fields must be filled.',
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: 150.h),
                    RoundedButton(
                      width: double.infinity,
                      buttonColor: primaryColor,
                      onPressed: signUpWithPhoneNumber,
                      child: Text(
                        'Send OTP',
                        style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    ),
                    SizedBox(height: 30.h),
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
                              fontSize: 14.h,
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
                    SizedBox(height: 20.h),
                    RoundedButton(
                      onPressed: () {
                        Auth().signInWithGoogle();
                      },
                      height: 50.h,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 45.h,
                            width: 45.w,
                          ),
                          SizedBox(width: 5.w),
                           Text(
                            'Continue with Google',
                            style: TextStyle(color: black, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go('/${AppRoutes.login}');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: primaryColor,
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
