import 'package:blogapp/controllers/comments_controller.dart';
import 'package:blogapp/controllers/photos_controller.dart';
import 'package:blogapp/controllers/posts_controller.dart';
import 'package:blogapp/controllers/theme_controller.dart';
import 'package:blogapp/views/post_page2.dart';
import 'package:blogapp/views/postpage1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// Homepage widget which serves as the main landing screen after splash
class Homepage extends StatelessWidget {
  // Theme controller for handling light/dark mode toggle
  final ThemeController themeController = Get.find<ThemeController>();

  // Controllers for fetching API data
  PhotosController photosController = Get.find<PhotosController>();
  CommentsController commentsController = Get.find<CommentsController>();
  PostsController postsController = Get.find<PostsController>();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background adapts to current theme
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        // Obx ensures reactive UI updates when data changes
        child: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03256),

                // Top bar with theme toggle & logo
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Theme toggle button (switches icons for dark/light mode)
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
                      // App logo (changes with theme)
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

                // Section title: Pick Posts & Recommendations
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pick Posts",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(fontSize: 18),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recommendations",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(fontSize: 32),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Horizontal list of comments (recommendations with overlayed text)
                Container(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 50, // limit items for performance
                    itemBuilder: (context, index) {
                      final comments = commentsController.commentsList[index];

                      return GestureDetector(
                        onTap: () {
                          // Navigate to Postpage on tap
                          Get.to(() => Postpage());
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
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Show first 2 words of name
                                Flexible(
                                  child: Text(
                                    "Name: ${comments.name.split(' ').take(2).join(' ')}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // Show email
                                Text(
                                  "Email: ${comments.email}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                // Show user id
                                Text(
                                  "User Id: ${comments.id.toString()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                SizedBox(height: 8),
                                // Show only the 2nd word of the name if available
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
                                      " ${comments.name.split(' ').length > 1 ? comments.name.split(' ')[1] : comments.name}",
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

                // Row of filter options (Top, Popular, Trending, Favourites)
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

                // Vertical list of posts (main feed)
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 50,
                    // limit items for performance
                    padding: EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (context, index) {
                      final posts = postsController.postsList[index];
                      final comments = commentsController.commentsList[index];

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
                            // Navigate to second post page with animation
                            Get.to(
                              () => SecondPostpage(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 500),
                            );
                          },
                          child: Row(
                            children: [
                              // Thumbnail image for post
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
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),

                              // Post title and body preview
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Title truncation: show first 3 words,
                                  // or last 20 words if too long
                                  Text(
                                    "Title: ${(() {
                                      final words = posts.title.split(' ');
                                      if (words.length > 20) {
                                        return '...${words.sublist(words.length - 20).join(' ')}';
                                      } else {
                                        return words.take(3).join(' ') + (words.length > 3 ? '...' : '');
                                      }
                                    })()}",
                                    style: TextStyle(
                                      color: themeController.isDark.value
                                          ? Color.fromRGBO(244, 244, 244, 1)
                                          : Color.fromRGBO(34, 34, 34, 1),
                                    ),
                                  ),
                                  // Body preview: only first 2 words
                                  Text(
                                    "Body: ${posts.body.split(' ').take(2).join(' ')}${posts.title.split(' ').length > 2 ? '.....' : ''}",
                                    style: TextStyle(
                                      color: themeController.isDark.value
                                          ? Color.fromRGBO(244, 244, 244, 1)
                                          : Color.fromRGBO(34, 34, 34, 1),
                                    ),
                                  ),

                                  SizedBox(height: 5),

                                  // Post meta info (author + time)
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
                                        // Show only the 2nd name word if exists
                                        Text(
                                          "Name: ${comments.name.split(' ').length > 1 ? comments.name.split(' ')[1] : comments.name.split(' ')[0]}",
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
      ),
    );
  }
}
