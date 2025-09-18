import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/posts_model.dart';

class PostsController extends GetxController {
  // Observable list of posts
  var postsList = <Posts>[].obs;

  // Loading indicator
  var isLoading = false.obs;

  // API endpoint
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  // Fetch posts from API
  Future<void> fetchPosts() async {
    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'FlutterApp/1.0',
        },
      );

      if (response.statusCode == 200) {
        final List<Posts> loadedPosts = postsFromJson(response.body);
        postsList.assignAll(loadedPosts);
      } else {
        Get.snackbar(
          'Error',
          'Failed to load posts. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading(false);
    }
  }
}
