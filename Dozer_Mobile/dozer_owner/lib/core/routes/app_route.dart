import 'package:DozerOwner/core/routes/route_names.dart';
import 'package:DozerOwner/features/authentication/presentation/screens/login_screen.dart';
import 'package:DozerOwner/features/authentication/presentation/screens/otp_verification.dart';
import 'package:DozerOwner/features/authentication/presentation/screens/signup_screen.dart';
import 'package:DozerOwner/features/equipment/presentation/screens/confirm_page.dart';
import 'package:DozerOwner/features/equipment/presentation/screens/equipment_info_filling_page.dart';
import 'package:DozerOwner/features/owner_profile/presentation/screens/profile_page.dart';
import 'package:DozerOwner/features/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  final GoRouter router = GoRouter(
    // redirect: (context, state) {
    //   final sharedPreferences = sl<SharedPreferences>();
    //   final String token = sharedPreferences.getString("token") ?? "";
    //   if (token.isNotEmpty) {
    //     return "${AppRoutes.homeMain}";
    //   }
    // },
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  LoginScreen();
        },
      ),

      GoRoute(
        path: '/${AppRoutes.signup}',
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),

      GoRoute(
        path: '/${AppRoutes.login}',
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
      ),

      GoRoute(
        path: '/${AppRoutes.profile}',
        builder: (BuildContext context, GoRouterState state) {
          return ProfilePage();
        },
      ),

      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          final phoneNumber = state.queryParameters['phoneNumber'] ?? '';
          final otpCode = state.queryParameters['otpCode'] ?? '';

          return OtpVerificationScreen(
            phoneNumber: phoneNumber,
            otpCode: otpCode,
          );
        },
      ),

      GoRoute(
        path: '/${AppRoutes.form}',
        builder: (BuildContext context, GoRouterState state) {
          return InfoFillingPage();
        },
      ),

      GoRoute(
        path: '/${AppRoutes.form}',
        builder: (BuildContext context, GoRouterState state) {
          return ConfirmationPage();
        },
      ),

    ],
  );
}
