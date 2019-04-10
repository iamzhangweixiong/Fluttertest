import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key, this.sourceId}) : super(key: key);

  final int sourceId;

  @override
  VideoPageState createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
//  VideoPlayerController videoController;
  bool _isPlaying = false;
  String url = 'https://dl-cmshow.cmcm.com/video/upload_3f9e7b015fb5aec69c11dd7d47b641a9.mp4';

  @override
  void initState() {
    super.initState();
//    videoController = VideoPlayerController.network(url)
//      ..addListener(() {
//        final bool isPlaying = videoController.value.isPlaying;
//        print(isPlaying);
//        if (isPlaying != _isPlaying) {
//          setState(() { _isPlaying = isPlaying; });
//        }
//      })
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
//        body: Center(
//          child: videoController.value.initialized
//              ? AspectRatio(
//                  aspectRatio: videoController.value.aspectRatio,
//                  child: VideoPlayer(videoController),
//                )
//              : Container(),
//        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            setState(() {
//              videoController.value.isPlaying
//                  ? videoController.pause()
//                  : videoController.play();
//            });
//          },
//          child: Icon(
//            videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
//          ),
//        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
//    videoController.dispose();
  }
}
