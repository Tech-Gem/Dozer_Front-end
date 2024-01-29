import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/features/welcome.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';

void main() {
    CloudinaryContext.cloudinary = 
        Cloudinary.fromCloudName(cloudName: "dvzsaa0eo");
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(),
              bodyMedium: TextStyle(),
            ).apply(
              bodyColor: greyTextColor,
              displayColor: greyTextColor2,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
