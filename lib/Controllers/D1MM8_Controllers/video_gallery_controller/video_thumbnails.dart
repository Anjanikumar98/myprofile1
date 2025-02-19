import 'package:get/get.dart';

class VideoController extends GetxController {
  // List of video thumbnail paths or URLs
  var videoThumbnails = <String>[
    'https://github.com/Anjanikumar98/myprofile1/blob/e427ed36b6bb2e1fdaff721c7decd3cd6cc83e82/assets/videos/gym_video.mp4',
  ].obs; // Observable list for reactivity

  // Currently selected video URL
  var selectedVideoUrl = 'https://github.com/Anjanikumar98/myprofile1/blob/e427ed36b6bb2e1fdaff721c7decd3cd6cc83e82/assets/videos/gym_video.mp4'.obs;

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
