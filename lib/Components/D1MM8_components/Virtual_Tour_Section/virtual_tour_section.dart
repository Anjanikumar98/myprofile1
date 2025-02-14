import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../Controllers/video_gallery_controller/virtual_tour_controller.dart';

class VirtualTourSection extends StatelessWidget {
  VirtualTourSection({Key? key}) : super(key: key);

  final VirtualTourController controller = Get.put(VirtualTourController());

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 0.9 * deviceWidth, // Responsive width
          padding: EdgeInsets.symmetric(vertical: (10 / 800) * deviceHeight),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular((6.48 / 800) * deviceHeight),
            border: Border.all(color: const Color(0xFF376C7F), width: 0.65),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(deviceHeight),
              SizedBox(height: (10 / 800) * deviceHeight),
              _buildFullView(deviceWidth, deviceHeight),
              SizedBox(height: (10 / 800) * deviceHeight),
              _buildThumbnails(deviceWidth, deviceHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double deviceHeight) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              "Tour",
              style: TextStyle(
                fontSize: (48 / 800) * deviceHeight,
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
                      fontSize: (24 / 800) * deviceHeight,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Urbanist",
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  TextSpan(
                    text: "Virtual Tour",
                    style: TextStyle(
                      fontSize: (24 / 800) * deviceHeight,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Urbanist",
                      color: const Color(0xFF7ED957), // Green color
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFullView(double deviceWidth, double deviceHeight) {
    return Obx(() {
      return Container(
        width: 0.85 * deviceWidth,
        height: (200 / 800) * deviceHeight, // Adjusted height for full video
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((12 / 800) * deviceHeight),
          border: Border.all(color: const Color(0xFF376C7F), width: 0.65),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular((12 / 800) * deviceHeight),
          child: VideoPlayerWidget(videoPath: "assets/videos/gym_video.mp4"),
        ),
      );
    });
  }

  Widget _buildThumbnails(double deviceWidth, double deviceHeight) {
    List<String> thumbnails = [
      "assets/images/Property 1=Video Active.png",
      "assets/images/Property 1=Video Default.png",
      "assets/images/Property 1=Image Active.png",
      "assets/images/Property 1=Image Default.png"
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        thumbnails.length,
        (index) => GestureDetector(
          onTap: () {
            controller.selectVideo(
                "assets/videos/gym_video.mp4"); // Update with correct video mapping
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: (80 / 360) * deviceWidth,
                height: (80 / 800) * deviceHeight,
                margin:
                    EdgeInsets.symmetric(horizontal: (5 / 360) * deviceWidth),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((8 / 360) * deviceWidth),
                  border: Border.all(
                    color: controller.selectedVideoUrl.value ==
                            "assets/videos/gym_video.mp4"
                        ? const Color(0xFF7ED957)
                        : Colors.transparent,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(thumbnails[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (index == 0) // Add play icon overlay on first thumbnail
                Container(
                  width: (80 / 360) * deviceWidth,
                  height: (80 / 800) * deviceHeight,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius:
                        BorderRadius.circular((8 / 360) * deviceWidth),
                  ),
                  child: const Icon(
                    Icons.play_circle_fill,
                    color: Color(0xFF7ED957),
                    size: 30,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  const VideoPlayerWidget({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? VideoPlayer(_controller)
        : const Center(child: CircularProgressIndicator());
  }
}
