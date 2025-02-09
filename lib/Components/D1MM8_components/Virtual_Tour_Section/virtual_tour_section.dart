import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/video_gallery_controller/video_thumbnail.dart';
import '../../../Controllers/video_gallery_controller/virtual_tour_controller.dart';

class VirtualTourSection extends StatelessWidget {
  final VirtualTourController controller = Get.put(VirtualTourController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6.48),
            border: Border.all(color: Color(0xFF376C7F), width: 0.65),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildDivider(),
              const SizedBox(height: 10),
              _buildFullView(),
              const SizedBox(height: 10),
              _buildThumbnails(), // ✅ Uses VideoThumbnailList now
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Tours",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.1),
            letterSpacing: 2,
            decoration: TextDecoration.none,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Have a ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Urbanist",
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              TextSpan(
                text: "Virtual Tour",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Urbanist",
                  color: Color(0xFF7ED957),
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 2.29,
      color: Colors.white.withOpacity(0.3),
    );
  }

  Widget _buildFullView() {
    return Obx(() {
      String videoUrl = controller.selectedVideoUrl.value;
      bool isValid = videoUrl.isNotEmpty && videoUrl.startsWith("http");

      return Container(
        width: MediaQuery.of(Get.context!).size.width * 0.85,
        height: 180,
        decoration: BoxDecoration(
          color: isValid ? Colors.grey[800] : Colors.black,
          borderRadius: BorderRadius.circular(6.48),
          border: Border.all(color: Color(0xFF376C7F), width: 0.65),
        ),
        child: Center(
          child: isValid
              ? Icon(Icons.play_circle_fill, color: Colors.white, size: 50)
              : Icon(Icons.error, color: Colors.white),
        ),
      );
    });
  }

  Widget _buildThumbnails() {
    return VideoThumbnailList(imageUrls: controller.thumbnails);
  }
}
