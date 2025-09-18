import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/comments_model.dart';



class CommentsController extends GetxController {
  // Observable list of comments
  var commentsList = <Comments>[].obs;

  // Loading indicator
  var isLoading = false.obs;

  // API endpoint
  final String apiUrl = "https://jsonplaceholder.typicode.com/comments";

  @override
  void onInit() {
    super.onInit();
    fetchComments();
  }

  // Fetch comments from API
  Future<void> fetchComments() async {
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
        final List<Comments> loadedComments = commentsFromJson(response.body);
        commentsList.assignAll(loadedComments);
        
      } else {
        Get.snackbar('Error', 'Failed to load comments. Status: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading(false);
    }
  }
}
