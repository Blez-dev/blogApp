import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/photos_model.dart';

class PhotosController extends GetxController {
  // Observable list of photos
  var photosList = <Photos>[].obs;

  // Loading indicator
  var isLoading = false.obs;

  // API endpoint
  final String apiUrl = "https://jsonplaceholder.typicode.com/photos";

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  // Fetch photos from API
  Future<void> fetchPhotos() async {
    try {
      isLoading(true);

      // Add headers to avoid 403
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'FlutterApp/1.0',
        },
      );

      if (response.statusCode == 200) {
        final List<Photos> loadedPhotos = photosFromJson(response.body);
        photosList.assignAll(loadedPhotos);

      } else {
        Get.snackbar('Error', 'Failed to load photos. Status: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading(false);
    }
  }
}
