import 'package:blogapp/controllers/comments_controller.dart';
import 'package:blogapp/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/controllers/theme_controller.dart';
import 'package:get/get.dart';

class Postpage extends StatelessWidget {
  // GetX controllers for theme and comments
  final ThemeController themeController = Get.find<ThemeController>();
  final CommentsController commentsController = Get.find<CommentsController>();

  Postpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Top section with background image
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/testl.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.2), // adds dark overlay
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
                    // Back and trailing icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back(); // go back to previous screen
                          },
                          child: Image.asset(
                            "assets/images/back.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () {}, // placeholder action
                          child: Image.asset(
                            "assets/images/trailing.png",
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 150),

                    // Title text and description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Travellers Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "check them out!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 5),
                          // Small user info row
                          Row(
                            children: [
                              // small circular indicator
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

            // Bottom container with curved top (list of comments)
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
                  // Switch color depending on theme mode
                  color: themeController.isDark.value
                      ? Color.fromRGBO(21, 21, 21, 1)
                      : Color.fromRGBO(244, 244, 244, 1),
                  padding: EdgeInsets.all(16),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      // get each comment from the list
                      final comments = commentsController.commentsList[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                          onTap: () {}, // handle on tap if needed
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              // comment details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Commenter's full name
                                    Text(
                                      "Full Name:   ${comments.name}",
                                      style: TextStyle(
                                        color: themeController.isDark.value
                                            ? Color.fromRGBO(244, 244, 244, 1)
                                            : Color.fromRGBO(34, 34, 34, 1),
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),

                                    SizedBox(height: 10),

                                    // Commenter's email
                                    Text(
                                      "Email:   ${comments.email}",
                                      style: TextStyle(
                                        color: themeController.isDark.value
                                            ? Color.fromRGBO(244, 244, 244, 1)
                                            : Color.fromRGBO(34, 34, 34, 1),
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),

                                    SizedBox(height: 10),

                                    // Comment body
                                    Text(
                                      "Body:   ${comments.body}",
                                      style: TextStyle(
                                        color: themeController.isDark.value
                                            ? Color.fromRGBO(244, 244, 244, 1)
                                            : Color.fromRGBO(34, 34, 34, 1),
                                        fontFamily: "Poppins",
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 30), // spacing between items
                    itemCount: 50, // limit to 50 comments
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
