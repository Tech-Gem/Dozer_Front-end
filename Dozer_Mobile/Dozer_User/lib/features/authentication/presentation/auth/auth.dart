import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> sendOtpToPhoneNumber(String phoneNumber) async {
    final url =
        'https://dozer-backend-tech-gem.onrender.com/api/v1/otp/sendOtp';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'phoneNumber': phoneNumber});
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(phoneNumber);
    print('***************************************');
    if (response.statusCode == 200) {
      print('hbkjkuhk');
      print('OTP sent successfully');
      // You can navigate to the OTP verification screen
      // and pass the necessary data if needed.
    } else {
      // Handle error case
      print('Failed to send OTP. Status code: ${response.statusCode}');
    }
  }

  Future<void> verifyOtp(String phoneNumber, String otp) async {
    final url =
        'https://dozer-backend-tech-gem.onrender.com/api/v1/otp/verifyOtp';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'code': otp,
    });
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // OTP verification successful
      // You can proceed with the desired action, e.g., sign in the user.
    } else {
      // Handle error case
      print('Failed to verify OTP. Status code: ${response.statusCode}');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the authentication credentials from the Google user
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the Google user's ID token and access token
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        // Sign in to Firebase with the Google credential
        await _firebaseAuth.signInWithCredential(credential);
      }
    } catch (e) {
      print(e);
      print('Error in sign in with google');
    }
  }
}
