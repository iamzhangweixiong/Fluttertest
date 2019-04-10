import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:livepaper/model/category_list.dart';
import 'package:livepaper/model/http_api.dart';

class CategoryListView extends StatefulWidget {
  CategoryListView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryListView> {
  List<Category> categoryListData = <Category>[];
  List<CategoryTab> tabListData = <CategoryTab>[];

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  void getCategory() async {
    try {
      Response response;
      response = await Dio().get(HttpApi.basePaperList);
      final decodeJson = json.decode(json.encode(response.data));
      final CategoryList categoryList = CategoryList.fromJson(decodeJson);
      print(categoryList.data.category);
      setState(() {
        categoryListData = categoryList.data.category;
        tabListData = categoryList.data.tab;
      });
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: categoryListData.length,
        itemBuilder: (context, itemIndex) {
          return new Column(children: <Widget>[
            new Text(categoryListData[itemIndex].tag.name,
                textAlign: TextAlign.center),
            new SizedBox(
                // 嵌套的 ListView 需要给定高度，否则无法显示
                height: 500,
                child: CategoryItemList(categoryListData[itemIndex].list))
          ]);
        });
  }
}

class CategoryItemList extends StatefulWidget {
  final List<Item> list;

  CategoryItemList(this.list);

  @override
  State<StatefulWidget> createState() {
    return new _ListItemState(list);
  }
}

class _ListItemState extends State<CategoryItemList> {
  final List<Item> list;

  _ListItemState(this.list);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, itemIndex) {
          return new GestureDetector(
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: CachedNetworkImage(
                    // 图片缓存库
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(), // 菊花
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    imageUrl: list[itemIndex].cover)),
            onTap: () {
              // 点击事件
            },
          );
        });
  }
}
