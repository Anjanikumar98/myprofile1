import 'package:get/get.dart';

class VideoController extends GetxController {
  // List of video thumbnail paths or URLs
  var videoThumbnails = <String>[
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
  ].obs; // Observable list for reactivity

  // Currently selected video URL
  var selectedVideoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (videoThumbnails.isNotEmpty) {
      selectedVideoUrl.value = videoThumbnails[0]; // Set first video as default
    }
  }

  // Method to select a video
  void selectVideo(String videoUrl) {
    selectedVideoUrl.value = videoUrl;
  }
}
