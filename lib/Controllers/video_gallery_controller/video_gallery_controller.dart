// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myprofile1/Controllers/video_gallery_controller/video_player_widget.dart';
//
// class VideoGalleryController extends GetxController {
//   var selectedIndex = 0.obs;
//   late VideoPlayerController videoPlayerController;
//
//   List<String> videoUrls = [
//     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
//     'https://www.w3schools.com/html/mov_bbb.mp4',
//     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
//   ];
//
//   @override
//   void onInit() {
//     super.onInit();
//     initializeVideo(videoUrls[selectedIndex.value]);
//   }
//
//   void initializeVideo(String url) {
//     videoPlayerController = VideoPlayerController.network(url)
//       ..initialize().then((_) {
//         update(); // Update UI when the video is ready
//       });
//   }
//
//   void changeVideo(int index) {
//     selectedIndex.value = index;
//     videoPlayerController.dispose(); // Dispose old controller
//     initializeVideo(videoUrls[index]); // Load new video
//   }
//
//   @override
//   void onClose() {
//     videoPlayerController.dispose();
//     super.onClose();
//   }
// }
//
// class VideoGallery extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(VideoGalleryController());
//
//     return Column(
//       children: [
//         // Video Player
//         VideoPlayerWidget(),
//
//         SizedBox(height: 10),
//
//         // Thumbnails for selecting video
//         Obx(() => Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             controller.videoUrls.length,
//                 (index) => GestureDetector(
//               onTap: () => controller.changeVideo(index),
//               child: Container(
//                 width: 100,
//                 height: 80,
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: index == controller.selectedIndex.value
//                         ? Colors.green
//                         : Colors.transparent,
//                     width: 2,
//                   ),
//                 ),
//                 child: Center(
//                   child: Icon(Icons.play_circle_fill,
//                       color: Colors.white, size: 30),
//                 ),
//               ),
//             ),
//           ),
//         )),
//       ],
//     );
//   }
// }
