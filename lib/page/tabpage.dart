/**
 * AutomaticKeepAliveClientMixin:保持 Tab 的状态，当切换的时候不会重新加载
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:livepaper/custom/category_listview.dart';
import 'package:livepaper/custom/vertical_pageview.dart';
import 'package:livepaper/model/http_api.dart';
import 'dart:convert';
import 'package:livepaper/model/model.dart';
import 'package:livepaper/page/videopage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TabPage extends StatefulWidget {
  TabPage({Key key, this.source}) : super(key: key);

  final String source;

  @override
  _TabPageState createState() => _TabPageState(source);
}

class _TabPageState extends State<TabPage> with AutomaticKeepAliveClientMixin {
  List<HotData> list = <HotData>[];

  String source;

  _TabPageState(this.source);

  @override
  void initState() {
    super.initState();
    getHot();
  }

  void getHot() async {
    try {
      Response response;
      response = await Dio().get(HttpApi.baseList + source);
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
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 每行的 item 个数
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.5),
        itemBuilder: (BuildContext context, int index) {
          return new GridItemWidget(list[index], source);
        },
        itemCount: list != null && list.length > 0 ? list.length : 0,
      );

  @override
  bool get wantKeepAlive => true;
}

class GridItemWidget extends StatelessWidget {
  final HotData hotData;
  final String source;

  GridItemWidget(this.hotData, this.source);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Container(
          child: CachedNetworkImage(
              // 图片缓存库
              placeholder: (context, url) =>
                  new CircularProgressIndicator(), // 菊花
              errorWidget: (context, url, error) => new Icon(Icons.error),
              imageUrl: hotData.previewUrl)),
      onTap: () {
        // 点击事件
        int videoId = hotData.sourceId;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (source == "hot") {
            return CategoryListView();
//            return VideoPage(sourceId: videoId);
          } else {
            return VerticalPageView();
          }
        }));
      },
    );
  }
}
