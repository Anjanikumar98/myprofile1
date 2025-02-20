import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  VideoPlayerScreen(this.videoPath);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  final ScrollController _scrollController = ScrollController();
  bool _videoStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);

    // _controller.initialize().then(() {
    //   setState(() {});
    //   _controller.setLooping(true);
    // });

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    print('Current Scroll Position: ${_scrollController.position.pixels}'); // Debug

    if (_scrollController.position.pixels >= 1200 && !_videoStarted) {
      _videoStarted = true;
      setState(() {
        _controller.play();
      });
      print('hello******'); // Debug confirmation
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: _scrollController, // Attach ScrollController
            child: Column(
              children: [
                Container(height: 500, width: 350, color: Colors.yellowAccent),
                Container(height: 700, width: 350, color: Colors.red),

                Container(height: 700, width: 350, color: Colors.green),
                Container(height: 500, width: 350, color: Colors.black),
                InkWell(
                  // onTap: () {
                  //   if(_controller.play() == true)
                  // },
                  child: SizedBox(
                    height: 178,
                    width: 372,
                    child: Center(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}