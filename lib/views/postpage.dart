import 'package:blogapp/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/theme_controller.dart';
import 'package:get/get.dart';

class Postpage extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();

  Postpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Top image container (extends under curved bottom)
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/testl.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Back and Trailing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.off(Homepage());
                          },
                          child: Image.asset(
                            "assets/images/back.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/trailing.png",
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 150),

                    // Post title & author info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Acampamento na represa:",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "como se proteger!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "John",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              SizedBox(width: 5),
                              Image.asset(
                                "assets/images/timer.png",
                                height: 12,
                                width: 12,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "5 min",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom curved container
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.55,
                  // fills rest
                  color: themeController.isDark.value
                      ? Color.fromRGBO(21, 21, 21, 1)
                      : Color.fromRGBO(244, 244, 244, 1),
                  padding: EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Here goes the content of the post. You can add multiple lines of text here. This container will expand to fill the remaining screen. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: themeController.isDark.value
                                  ? Color.fromRGBO(244, 244, 244, 1)
                                  : Color.fromRGBO(54, 54, 54, 1),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Add more texts or widgets as needed
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
