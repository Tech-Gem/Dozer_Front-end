import 'package:Dozer/features/authentication/presentation/auth/auth.dart';
import 'package:Dozer/features/authentication/presentation/widget/rounded_button.dart';
import 'package:Dozer/features/authentication/presentation/widget/text_field.dart';
import 'package:Dozer/features/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Dozer/core/utils/colors.dart';
import 'login_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  OtpVerificationScreen({required this.phoneNumber});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String? errorMessage;
  bool isError = false;
  bool isResendEnabled = false;
  int timerValue = 60;

  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start a timer for OTP resend
    startTimer();
  }

  void startTimer() {
    // Start a timer for 60 seconds
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (timerValue > 0) {
          timerValue--;
          startTimer();
        } else {
          isResendEnabled = true;
        }
      });
    });
  }

  void verifyOtp() async {
    String otp = otpController.text.trim();

    if (otp.isEmpty) {
      setState(() {
        isError = true;
        errorMessage = 'Please enter the OTP.';
      });
      return;
    }

    try {
      // Verify the OTP
      await Auth().verifyOtp(widget.phoneNumber, otp);

      // Navigate to the home screen after successful OTP verification
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      setState(() {
        isError = true;
        errorMessage = 'Invalid OTP. Please try again.';
      });
      print(e);
    }
  }

  void resendOtp() async {
    setState(() {
      isResendEnabled = false;
      timerValue = 60;
    });

    try {
      // Resend the OTP
      await Auth().sendOtpToPhoneNumber(widget.phoneNumber);

      // Start the timer for OTP resend
      startTimer();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Verify your OTP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Please enter the OTP sent to ${widget.phoneNumber}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: otpController,
                    hintText: 'OTP',
                    icon: Icons.lock,
                    isError: isError,
                  ),
                  if (isError)
                    Text(
                      errorMessage ?? '',
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(height: 40),
                  // CustomTextField(controller: controller, hintText: 'Full name')
                  RoundedButton(
                    width: double.infinity,
                    buttonColor: primary,
                    onPressed: verifyOtp,
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Didn\'t receive the OTP? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: isResendEnabled ? 'Resend now' : 'Resend in $timerValue seconds',
                          style: TextStyle(
                            fontSize: 16,
                            color: isResendEnabled ? primary : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = isResendEnabled ? resendOtp : null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              fontSize: 16,
                              color: primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  )])
            )
          ],
        ),
      ),
    );
  } 
}


