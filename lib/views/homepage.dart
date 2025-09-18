import 'package:blogapp/theme_controller.dart';
import 'package:blogapp/utils/text_theme.dart';
import 'package:blogapp/views/postpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homepage extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03256),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        themeController.toggleTheme();
                      },
                      child: Image.asset(
                        themeController.isDark.value
                            ? "assets/images/darkMode.png"
                            : "assets/images/lightMode.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        themeController.isDark.value
                            ? "assets/images/darkMode2.png"
                            : "assets/images/lightMode2.png",
                        width: 88,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Conteúdo diário",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recomendação",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(fontSize: 32),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 230,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(Postpage());
                      },
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage("assets/images/testl.png"),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withValues(alpha: 0.2),
                              BlendMode.darken,
                            ), // darken the image a little
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Passeios em Veneza:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Text(
                                "como gastar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Text(
                                "economizar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "John",
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
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 17,
                        color: themeController.isDark.value
                            ? Color.fromRGBO(244, 244, 244, 1)
                            : Color.fromRGBO(34, 34, 34, 1),
                      ),
                    ),
                    Text(
                      "Popular",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 17,
                        color: Color.fromRGBO(146, 146, 146, 1),
                      ),
                    ),
                    Text(
                      "Trending",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 17,
                        color: Color.fromRGBO(146, 146, 146, 1),
                      ),
                    ),
                    Text(
                      "Favourites",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 17,
                        color: Color.fromRGBO(146, 146, 146, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Bottom vertical list that fills remaining space
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: themeController.isDark.value
                            ? Color.fromRGBO(21, 21, 21, 1)
                            : Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            Postpage(),
                            transition: Transition.rightToLeftWithFade,
                            // choose the animation type
                            duration: Duration(
                              milliseconds: 500,
                            ), // adjust speed
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 74,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/landingPic.png",
                                  ),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.2),
                                    BlendMode.darken,
                                  ), // darken the image a little
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Acampamento na represa:",
                                  style: TextStyle(
                                    color: themeController.isDark.value
                                        ? Color.fromRGBO(244, 244, 244, 1)
                                        : Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                                Text(
                                  "como se proteger!",
                                  style: TextStyle(
                                    color: themeController.isDark.value
                                        ? Color.fromRGBO(244, 244, 244, 1)
                                        : Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),

                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                            217,
                                            217,
                                            217,
                                            1,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "John",
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                            146,
                                            146,
                                            146,
                                            1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Image.asset(
                                        "assets/images/timer.png",
                                        height: 12,
                                        width: 12,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "5 min",
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                            146,
                                            146,
                                            146,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
