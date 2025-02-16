import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  var selectedVideoUrl = "assets/videos/gym_video.mp4".obs; // Default video

  void changeVideo(String newVideo) {
    selectedVideoUrl.value = newVideo;
  }
}
