import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:livepaper/model/model.dart';
import 'package:livepaper/page/videopage.dart';

class VerticalPageView extends StatefulWidget {
  VerticalPageView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _VerticalPageState();
  }
}

class _VerticalPageState extends State<VerticalPageView> {
  List<HotData> list = <HotData>[];

  @override
  void initState() {
    super.initState();
    getHot();
  }

  void getHot() async {
    try {
      Response response;
      response = await Dio()
          .get("http://api-cmshow-ios.cmcm.com/v1/get_source?cate=hot");
      final hotJson = json.decode(json.encode(response.data));
      Hot hot = Hot.fromJson(hotJson);
      setState(() {
        list = hot.hotData;
      });
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
      controller: new PageController(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return new _PageItem(list[index]);
      },
      itemCount: list != null && list.length > 0 ? list.length : 0,
    );
  }
}

class _PageItem extends StatelessWidget {
  final HotData hotData;

  _PageItem(this.hotData);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Container(
          // 图片缓存库
          child: CachedNetworkImage(
              placeholder: (context, url) =>
                  new CircularProgressIndicator(), // 菊花
              errorWidget: (context, url, error) => new Icon(Icons.error),
              imageUrl: hotData.previewUrl)),
      onTap: () {
        // 点击事件
        int videoId = hotData.sourceId;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPage(sourceId: videoId)));
      },
    );
  }
}
