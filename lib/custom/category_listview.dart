import 'package:flutter/material.dart';


class CategoryListView extends StatefulWidget {
    CategoryListView({Key key}) : super(key: key);

    @override
    State<StatefulWidget> createState() {
        return new _CategoryListState();
    }
}

class _CategoryListState extends State<CategoryListView> {
    @override
    Widget build(BuildContext context) {
        return new ListView.builder(itemBuilder: _itemBuilder);
    }

    Widget _itemBuilder(BuildContext context, int itemIndex) {
        return new Container(
            child: CategoryItemList(null),
        );
    }
}

class CategoryItemList extends StatefulWidget {
    final List<CategoryItemData> itemIndex;

    CategoryItemList(this.itemIndex);

    @override
    State<StatefulWidget> createState() {
        return null;
    }
}

class CategoryItemData {
    final String picUrl;
    final String picDesc;

    CategoryItemData(this.picUrl, this.picDesc);
}
