import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:livepaper/model/http_api.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:livepaper/model/type_list.dart';

class GridPage extends StatefulWidget {
  final int source;

  GridPage({Key key, @required this.source}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState(source);
}

class _GridPageState extends State<GridPage>
    with AutomaticKeepAliveClientMixin {
  List<TypeListItem> list = <TypeListItem>[];

  int source;

  _GridPageState(this.source);

  @override
  void initState() {
    super.initState();
    getTypeList();
  }

  void getTypeList() async {
    try {
      Response response;
      response = await Dio().get(HttpApi.idPaperList + source.toString());
      final decodeJson = json.decode(json.encode(response.data));
      TypeList typeList = TypeList.fromJson(decodeJson);
      setState(() {
        list = typeList.data.list;
      });
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.white
      ),
      home: GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 每行的 item 个数
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.5),
        itemBuilder: (BuildContext context, int index) {
          return new GridItemWidget(list[index]);
        },
        itemCount: list != null && list.length > 0 ? list.length : 0,
      ));

  @override
  bool get wantKeepAlive => true;
}

class GridItemWidget extends StatelessWidget {
  final TypeListItem item;

  GridItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Container(
          child: CachedNetworkImage(
              // 图片缓存库
              placeholder: (context, url) =>
                  new CircularProgressIndicator(), // 菊花
              errorWidget: (context, url, error) => new Icon(Icons.error),
              imageUrl: item.back)),
      onTap: () {
        // 点击事件
      },
    );
  }
}
