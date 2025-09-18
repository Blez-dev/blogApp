import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:blogapp/views/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: LottieBuilder.asset("assets/images/splash.json")),
      nextScreen: const LandingPage(),
      splashIconSize: 200,
      backgroundColor: Colors.black,
    );
  }
}
