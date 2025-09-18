import 'package:blogapp/theme_controller.dart';
import 'package:blogapp/utils/theme.dart';
import 'package:blogapp/views/custom_splash_screen.dart';
import 'package:blogapp/views/homepage.dart';
import 'package:blogapp/views/landingpage.dart';
import 'package:blogapp/views/postpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      home: CustomSplashScreen(),
    );
  }
}
