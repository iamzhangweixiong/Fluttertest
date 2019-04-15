import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:livepaper/model/item.dart';
import 'package:livepaper/page/videopage.dart';
import 'package:video_player/video_player.dart';

class VerticalPageView extends StatefulWidget {
  final List<Item> dataList;
  final int initIndex;

  VerticalPageView({Key key, @required this.dataList, this.initIndex = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VerticalPageState(dataList, initIndex);
}

class _VerticalPageState extends State<VerticalPageView> {
  final List<Item> list;
  final int initIndex;

  _VerticalPageState(this.list, this.initIndex);

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
        controller: new PageController(initialPage: initIndex),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) => new _PageItem(list[index]),
        itemCount: list != null && list.length > 0 ? list.length : 0);
  }
}

class _PageItem extends StatefulWidget {
  final Item item;

  _PageItem(this.item);

  @override
  State<StatefulWidget> createState() => _PageItemState(item);
}

class _PageItemState extends State<_PageItem> {
  final Item item;
  VideoPlayerController videoController;
  bool _isPlaying = false;

  _PageItemState(this.item);

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.network(item.video)
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
  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /// Offstage 也可以直接控制 widget 的显示和隐藏
    var cachedNetworkImage = AnimatedOpacity(
        opacity: _isPlaying ? 0 : 1,
        duration: Duration(milliseconds: 100),
        child: CachedNetworkImage(
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            imageUrl: item.back));

    var aspectVideoPlayer = AnimatedOpacity(
        opacity: _isPlaying ? 1 : 0,
        duration: Duration(milliseconds: 100),
        child: AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: VideoPlayer(videoController)));

    return new GestureDetector(
      child: Container(
          child: new Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[cachedNetworkImage, aspectVideoPlayer])),
      onTap: () {
        // 点击事件
        String source = item.video;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPage(sourceUrl: source)));
      },
      // 长按开始，播放视频，隐藏照片
      onLongPressStart: (LongPressStartDetails details) {
        setState(() {
          videoController.seekTo(Duration(milliseconds: 0));
          videoController.play();
        });
      },
      // 长按结束，显示照片，隐藏视频
      onLongPressEnd: (LongPressEndDetails details) {
        setState(() {
          videoController.pause();
        });
      });
  }
}
