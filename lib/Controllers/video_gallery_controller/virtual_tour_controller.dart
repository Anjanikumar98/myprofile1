import 'package:get/get.dart';

class VirtualTourController extends GetxController {
  var selectedVideoUrl = "".obs; // Stores the selected video URL
  var thumbnails = <String>[].obs; // Stores video thumbnail URLs

  void selectVideo(String url) {
    selectedVideoUrl.value = url;
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize with dummy data (Replace with API calls)
    thumbnails.value = [
      "https://example.com/video1.jpg",
      "https://example.com/video2.jpg",
      "https://example.com/video3.jpg",
      "https://example.com/video4.jpg"
    ];
    selectedVideoUrl.value = "https://example.com/video1.mp4"; // Default video
  }
}
