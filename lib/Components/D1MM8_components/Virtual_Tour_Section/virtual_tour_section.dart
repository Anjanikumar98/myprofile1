import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../Controllers/D1MM8_Controllers/video_tour_controller.dart';
import '../../../Controllers/video_gallery_controller/video_player_widget.dart';

class VirtualTourSection extends StatelessWidget {
  final VirtualTourController controller = Get.put(VirtualTourController());

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Positioned(
              top: 10,
              left: deviceWidth * 0.3,
              child: Text(
                "Tour",
                style: TextStyle(
                  fontSize: (80 / 800) * deviceHeight,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Text(
              "Have a Virtual Tour",
              style: TextStyle(
                fontSize: (24 / 800) * deviceHeight,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: (20 / 800) * deviceHeight),
        Obx(() => Container(
          width: (320 / 360) * deviceWidth,
          height: (180 / 800) * deviceHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: VideoPlayerWidget(videoPath: controller.selectedVideoUrl.value, videoUrl: '',),
          ),
        )),
        SizedBox(height: (20 / 800) * deviceHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(controller.videoThumbnails.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.selectedVideoUrl.value = controller.videoPaths[index];
              },
              child: Obx(() => Container(
                width: (70 / 360) * deviceWidth,
                height: (70 / 800) * deviceHeight,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: controller.selectedVideoUrl.value ==
                        controller.videoPaths[index]
                        ? Colors.blue
                        : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        controller.videoThumbnails[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (controller.selectedVideoUrl.value ==
                        controller.videoPaths[index])
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.green,
                        size: 30,
                      ),
                  ],
                ),
              )),
            );
          }),
        ),
      ],
    );
  }
}
