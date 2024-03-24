import 'package:dozer_owner/core/utils/colors.dart';
import 'package:dozer_owner/features/authentication/auth/auth.dart';
import 'package:dozer_owner/features/authentication/presentation/widget/rounded_button.dart';
import 'package:dozer_owner/features/authentication/presentation/widget/text_field.dart';
import 'package:dozer_owner/features/equipment/presentation/screens/equipment_info_filling_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String? otpCode;

  OtpVerificationScreen({required this.phoneNumber, required this.otpCode});

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
    String code = otpController.text.trim();

    if (code.isEmpty) {
      setState(() {
        isError = true;
        errorMessage = 'Please enter the OTP.';
      });
      return;
    }

    try {
      // Verify the OTP

      bool isOtpValid =
          await Auth().verifyOtp(widget.phoneNumber, code, widget.otpCode!);
      print(widget.phoneNumber);
      print(code);

      if (isOtpValid) {
        // Navigate to the home screen after successful OTP verification
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoFillingPage()),
        );
      } else {
        setState(() {
          isError = true;
          errorMessage = 'Invalid OTP. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        errorMessage = 'An error occurred. Please try again.';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(children: [
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
                      buttonColor: primaryColor,
                      onPressed: verifyOtp,
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                            text: isResendEnabled
                                ? 'Resend now'
                                : 'Resend in $timerValue seconds',
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  isResendEnabled ? primaryColor : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = isResendEnabled ? resendOtp : null,
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
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
