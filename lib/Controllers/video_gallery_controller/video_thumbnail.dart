import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              controller.selectVideo(imageUrls[index].replaceAll(".jpg", ".mp4"));
            },
            child: _buildThumbnail(imageUrls[index], index),
          ),
        ),
      ),
    ));
  }

  Widget _buildThumbnail(String imageUrl, int index) {
    bool isValid = imageUrl.isNotEmpty && imageUrl.startsWith("http");

    return Obx(() {
      bool isActive = controller.selectedVideoUrl.value == imageUrl.replaceAll(".jpg", ".mp4");

      return AnimatedContainer(
        duration: Duration(milliseconds: 0),
        width: 100,
        height: 80,
        margin: EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          color: isValid ? Colors.grey[700] : Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? Color(0xFFB8FE22) : Colors.transparent,
            width: 0.8,
          ),
          image: isValid
              ? DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
              : null,
        ),
      );
    });
  }
}
