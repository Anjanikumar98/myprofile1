import 'package:get/get.dart';

class VirtualTourController extends GetxController {
  RxString selectedVideoUrl = 'assets/videos/gym_video.mp4'.obs;

  List<String> videoThumbnails = [
    'assets/images/thumb1.jpg',
    'assets/images/thumb2.jpg',
    'assets/images/thumb3.jpg',
    'assets/images/thumb4.jpg',
  ];

  List<String> videoPaths = [
    'assets/videos/gym_video.mp4',
    'assets/videos/workout1.mp4',
    'assets/videos/workout2.mp4',
    'assets/videos/workout3.mp4',
  ];
}
