import 'package:Dozer/core/app_pages.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/home_screen.dart';
import 'package:Dozer/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Rent House APP',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: backgroundColor,
            primaryColor: primaryColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: accentColor,
            ),
            textTheme: TextTheme(
              headline1: TextStyle(color: headline1Color),
              bodyText1: TextStyle(color: bodyText1Color),
            ),
          ),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes
        );
      },
    );
  }
}
