import 'package:blogapp/controllers/posts_controller.dart';
import 'package:blogapp/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/controllers/theme_controller.dart';
import 'package:get/get.dart';

class SecondPostpage extends StatelessWidget {
  // Accessing theme and posts controllers using GetX
  final ThemeController themeController = Get.find<ThemeController>();
  final PostsController postsController = Get.find<PostsController>();

  SecondPostpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Top section with background image and overlay content
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/lastpic.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.2),
                    BlendMode.darken, // Darken effect for text readability
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row with back button and trailing icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back(); // Navigate back
                          },
                          child: Image.asset(
                            "assets/images/back.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () {}, // Placeholder for trailing action
                          child: Image.asset(
                            "assets/images/trailing.png",
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 150),

                    // Post title and author info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Main heading
                          Text(
                            "Travellers Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              fontFamily: "Poppins",
                            ),
                          ),
                          // Subheading
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
                          // Author and time info row
                          Row(
                            children: [
                              // Small circular icon
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5),
                              // Author name
                              Text(
                                "John",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              SizedBox(width: 5),
                              // Timer icon
                              Image.asset(
                                "assets/images/timer.png",
                                height: 12,
                                width: 12,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              // Time text
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

            // Bottom section: Curved container with list of posts
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
                  color: themeController.isDark.value
                      ? Color.fromRGBO(21, 21, 21, 1) // Dark mode background
                      : Color.fromRGBO(244, 244, 244, 1), // Light mode background
                  padding: EdgeInsets.all(16),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final posts = postsController.postsList[index]; // Access post data
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        decoration: BoxDecoration(
                          color: themeController.isDark.value
                              ? Color.fromRGBO(21, 21, 21, 1) // Dark card
                              : Color.fromRGBO(255, 255, 255, 1), // Light card
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
                          onTap: () {}, // Add onTap action for post
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),

                              // Expanded column for post details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // User ID
                                    Text(
                                      "User Id:   ${posts.id.toString()}",
                                      style: TextStyle(
                                        color: themeController.isDark.value
                                            ? Color.fromRGBO(244, 244, 244, 1)
                                            : Color.fromRGBO(34, 34, 34, 1),
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),

                                    SizedBox(height: 10),

                                    // Post title
                                    Text(
                                      "Title:   ${posts.title}",
                                      style: TextStyle(
                                        color: themeController.isDark.value
                                            ? Color.fromRGBO(244, 244, 244, 1)
                                            : Color.fromRGBO(34, 34, 34, 1),
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),

                                    SizedBox(height: 10),

                                    // Post body
                                    Text(
                                      "Body:   ${posts.body}",
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
                    separatorBuilder: (context, index) => SizedBox(height: 30), // Space between posts
                    itemCount: 50, // Limiting to 50 posts
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
