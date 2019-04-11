import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key, this.sourceUrl}) : super(key: key);

  final String sourceUrl;

  @override
  VideoPageState createState() => VideoPageState(sourceUrl);
}

class VideoPageState extends State<VideoPage> {
  VideoPlayerController videoController;
  bool _isPlaying = false;
  final String sourceUrl;

  VideoPageState(this.sourceUrl);

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.network(sourceUrl)
      ..addListener(() {
        final bool isPlaying = videoController.value.isPlaying;
        print(isPlaying);
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: videoController.value.initialized
              ? AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              videoController.value.isPlaying
                  ? videoController.pause()
                  : videoController.play();
            });
          },
          child: Icon(
            videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }
}
