import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:blogapp/views/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using AnimatedSplashScreen to display an intro animation
    return AnimatedSplashScreen(
      // Lottie animation asset for splash screen
      splash: Center(child: LottieBuilder.asset("assets/images/splash.json")),

      // After splash, navigate to the LandingPage
      nextScreen: const LandingPage(),

      // Size of the splash animation
      splashIconSize: 200,

      // Background color for the splash screen
      backgroundColor: Colors.black,
    );
  }
}
