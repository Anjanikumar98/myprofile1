// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myprofile1/Controllers/video_gallery_controller/video_gallery_controller.dart';
//
// class VideoPlayerWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<VideoGalleryController>();
//
//     return Obx(() {
//       return controller.videoPlayerController.value.isInitialized
//           ? AspectRatio(
//         aspectRatio: controller.videoPlayerController.value.aspectRatio,
//         child: VideoPlayer(controller.videoPlayerController),
//       )
//           : Center(child: CircularProgressIndicator());
//     });
//   }
// }
