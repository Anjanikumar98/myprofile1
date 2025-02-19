import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    )..initialize().then((_) {
        setState(() {}); // Update UI after video initializes
        _controller.setLooping(true); // Loop video
        _controller.play(); // Auto-play video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: (372 / 360) * deviceWidth,
        height: (278.14 / 800) * deviceHeight,
        padding: EdgeInsets.only(top: (10 / 800) * deviceHeight), // Gap
        child: ClipRRect(
          borderRadius: BorderRadius.circular((6.48 / 360) * deviceWidth),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF376C7F), // Border Color Dark Blue
                width: (0.65 / 360) * deviceWidth,
              ),
            ),
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const Center(
                    child:
                        CircularProgressIndicator()), // Show loader until video loads
          ),
        ),
      ),
    );
  }
}
