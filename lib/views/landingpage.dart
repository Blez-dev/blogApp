import 'package:blogapp/components/custombutton.dart';
import 'package:blogapp/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image covering the whole screen
          Image.asset("assets/images/landingPic.png", fit: BoxFit.cover),

          // App title and subtitle section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Adding space from the top
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),

                // Subtitle text
                Text(
                  "Novo caminho",
                  style: TextStyle(
                    fontSize: 28,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                  ),
                ),

                // Main title text
                Text(
                  "Blog de Viagem",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "PlayfairDisplay",
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),

          // Buttons section at the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer to push buttons near bottom
                SizedBox(height: MediaQuery.of(context).size.height * 0.73758),

                // First button (light theme)
                CustomButton(
                  text: "ENTRAR",
                  onPressed: () {
                    Get.to(() => Homepage()); // Navigate to Homepage
                  },
                  color: Color.fromRGBO(250, 250, 250, 1),
                  textColor: Color.fromRGBO(28, 28, 28, 1),
                ),

                SizedBox(height: 15),

                // Second button (dark theme)
                CustomButton(
                  text: "ENTRAR",
                  onPressed: () {
                    Get.to(() => Homepage()); // Navigate to Homepage
                  },
                  color: Color.fromRGBO(30, 95, 222, 1),
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
