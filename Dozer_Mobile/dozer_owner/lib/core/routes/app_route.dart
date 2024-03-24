import 'package:dozer_owner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:dozer_owner/features/owner_profile/presentation/screens/profile_page.dart';
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
          final dummyUser = UserEntity(
            id: 'dummyId',
            firstName: 'John',
            middleName: 'Doe',
            lastName: 'Smith',
            address: '123 Main St',
            phoneNumber: '555-1234',
            email: 'john.doe@example.com',
            profilePictureUrl: 'https://picsum.photos/250?image=9',
          );

          return ProfilePage();
        },
      ),
    ],
  );
}
