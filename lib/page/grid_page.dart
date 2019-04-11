import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:livepaper/model/http_api.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:livepaper/model/http_service.dart';
import 'package:livepaper/model/item.dart';
import 'package:livepaper/model/type_list.dart';
import 'package:livepaper/page/vertical_pageview.dart';

class GridPage extends StatefulWidget {
  final int source;

  GridPage({Key key, this.source}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState(source);
}

class _GridPageState extends State<GridPage>
    with AutomaticKeepAliveClientMixin {
  List<Item> list = <Item>[];

  int source;

  _GridPageState(this.source);

  @override
  void initState() {
    super.initState();
    getTypeList();
  }

  void getTypeList() {
    HttpService().getData(HttpApi.idPaperList + source.toString()).then((json) {
      final TypeList typeList = TypeList.fromJson(json);
      setState(() {
        list = typeList.data.list;
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 每行的 item 个数
            mainAxisSpacing: 0,
            crossAxisSpacing: 8,
            childAspectRatio: 0.55),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: Container(
                child: CachedNetworkImage(
                    placeholder: (context, url) => new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    imageUrl: list[index].back)),
            onTap: () {
              // 点击事件
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new VerticalPageView(
                    dataList: list, initIndex: index);
              }));
            },
          );
        },
        itemCount: list != null && list.length > 0 ? list.length : 0,
      ));

  @override
  bool get wantKeepAlive => true;
}
