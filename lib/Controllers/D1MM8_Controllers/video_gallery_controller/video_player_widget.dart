import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  late Future<void> _initializeVideoFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoFuture = _controller.initialize().then((_) {
      _controller.setLooping(true);
      setState(() {}); // Update UI after initialization
    }).catchError((e) {
      debugPrint('Error initializing video: $e');
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
        height: (178.14 / 800) * deviceHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((6.48 / 360) * deviceWidth),
          border: Border.all(
            color: const Color(0xFF376C7F),
            width: (0.65 / 360) * deviceWidth,
          ),
        ),
        child: FutureBuilder(
          future: _initializeVideoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show loader until video loads
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading video'));
            } else {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular((6.48 / 360) * deviceWidth),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),

                  // Play/Pause button overlay
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlaying = !_controller.value.isPlaying;
                        _isPlaying ? _controller.play() : _controller.pause();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
