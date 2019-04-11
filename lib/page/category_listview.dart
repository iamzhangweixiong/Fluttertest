import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:livepaper/model/item.dart';
import 'package:livepaper/page/gridpage.dart';
import 'package:livepaper/page/vertical_pageview.dart';
import 'package:livepaper/model/category_list.dart';
import 'package:livepaper/model/http_api.dart';

class CategoryListView extends StatefulWidget {
  CategoryListView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryListView>  with AutomaticKeepAliveClientMixin {
  List<Category> categoryListData = <Category>[];
  List<CategoryTab> tabListData = <CategoryTab>[];

  @override
  bool get wantKeepAlive => true;

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
          tabListData = categoryList.data.tab;
          categoryListData = categoryList.data.category;
      });
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: categoryListData.length + 1,
        itemBuilder: (context, itemIndex) {
          if (itemIndex == 0) {
            return new SizedBox(
                height: 80,
                child: _TabItemList(tabListData));
          }
          return new Column(children: <Widget>[
            new SizedBox(
                height: 50,
                child: new Row(children: <Widget>[
                  // 占用剩余空间
                  new Expanded(
                      child: new Container(
                          child: new Text(categoryListData[itemIndex - 1].tag.name),
                          padding: EdgeInsets.only(left: 10))),
                  new Icon(Icons.chevron_right)
                ])),
            new SizedBox(
                // 嵌套的 ListView 需要给定高度，否则无法显示
                height: 250,
                child: _CategoryItemList(categoryListData[itemIndex - 1].list))
          ]);
        });
  }
}

class _TabItemList extends StatefulWidget {
  final List<CategoryTab> _list;

  _TabItemList(this._list);

  @override
  State<StatefulWidget> createState() => _TabItemListState(_list);
}

class _TabItemListState extends State<_TabItemList>{
  final List<CategoryTab> _tabListData;

  _TabItemListState(this._tabListData);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tabListData.length,
        itemBuilder: (context, itemIndex) {
            return new GestureDetector(
                child: new Container(
                    padding: EdgeInsets.only(left: 10),
                    child: new Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                            new CachedNetworkImage(
                                placeholder: (context, url) => new CircularProgressIndicator(),
                                errorWidget: (context, url, error) => new Icon(Icons.error),
                                imageUrl: _tabListData[itemIndex].cover),
                            new Text(_tabListData[itemIndex].name,
                                style: TextStyle(color: Colors.white),)
                        ])),
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return new GridPage(source: _tabListData[itemIndex].id);
                    }));
            });
        });
  }
}

class _CategoryItemList extends StatefulWidget {
  final List<Item> list;

  _CategoryItemList(this.list);

  @override
  State<StatefulWidget> createState() {
    return new _ListItemState(list);
  }
}

class _ListItemState extends State<_CategoryItemList> {
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
                padding: EdgeInsets.only(left: 10),
                // 图片缓存库
                child: CachedNetworkImage(
                    placeholder: (context, url) => new CircularProgressIndicator(), // 菊花
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    imageUrl: list[itemIndex].cover)),
            onTap: () {
              // 点击事件
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new VerticalPageView(
                    dataList: list, initIndex: itemIndex);
              }));
            },
          );
        });
  }
}
