import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../Controllers/video_gallery_controller/virtual_tour_controller.dart';

class VideoThumbnailList extends StatelessWidget {
  final List<String> imageUrls;
  final VirtualTourController controller = Get.find(); // ✅ GetX Controller

  VideoThumbnailList({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imageUrls.length,
              (index) => GestureDetector(
                onTap: () {
                  // ✅ Select video from assets
                  String videoPath =
                      "assets/videos/gym_video.mp4"; // Replace with correct video name
                  controller.selectVideo(videoPath);
                },
                child: _buildThumbnail(imageUrls[index], index),
              ),
            ),
          ),
        ));
  }

  Widget _buildThumbnail(String imageUrl, int index) {
    return Obx(() {
      bool isActive = controller.selectedVideoUrl.value ==
          "assets/videos/gym_video.mp4"; // ✅ Check active state

      return LayoutBuilder(
        builder: (context, constraints) {
          double deviceWidth = MediaQuery.of(context).size.width;
          double deviceHeight = MediaQuery.of(context).size.height;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 200), // ✅ Smooth animation
            width: (100 / 360) * deviceWidth, // ✅ Scales dynamically
            height: (80 / 800) * deviceHeight, // ✅ Scales dynamically
            margin: EdgeInsets.only(
                right: (4 / 360) * deviceWidth), // ✅ Responsive margin
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(
                  (8 / 360) * deviceWidth), // ✅ Scaled border radius
              border: Border.all(
                color: isActive ? const Color(0xFFB8FE22) : Colors.transparent,
                width: (0.8 / 360) * deviceWidth, // ✅ Scaled border width
              ),
              image: DecorationImage(
                  image: AssetImage("assets/images/thumbnail.jpg"),
                  fit: BoxFit.cover),
            ),
          );
        },
      );
    });
  }
}
