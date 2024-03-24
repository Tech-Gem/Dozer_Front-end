import 'package:DozerOwner/core/routes/app_route.dart';
import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:DozerOwner/features/dependency_injection/dependency_injection_container.dart'
    as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initDepInj();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRoute = AppRoute();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 829),
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<ProfileBloc>(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: appRoute.router,
          debugShowCheckedModeBanner: false,
          title: 'RideShare',
          theme: ThemeData(
            fontFamily: 'poppins',
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(),
              bodyMedium: TextStyle(),
            ).apply(
              bodyColor: primaryColor,
              displayColor: greyTextColor,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
