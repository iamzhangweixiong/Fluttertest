import 'package:json_annotation/json_annotation.dart';
import 'package:livepaper/model/item.dart';

part 'category_list.g.dart';


@JsonSerializable()
class CategoryList extends Object {

    @JsonKey(name: 'data')
    Data data;

    @JsonKey(name: 'header')
    Header header;

    @JsonKey(name: 'pageInfo')
    PageInfo pageInfo;

    CategoryList(this.data,this.header,this.pageInfo,);

    factory CategoryList.fromJson(Map<String, dynamic> srcJson) => _$CategoryListFromJson(srcJson);

    Map<String, dynamic> toJson() => _$CategoryListToJson(this);

}


@JsonSerializable()
class Data extends Object {

    @JsonKey(name: 'category')
    List<Category> category;

    @JsonKey(name: 'tab')
    List<CategoryTab> tab;

    Data(this.category,this.tab,);

    factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Category extends Object {

    @JsonKey(name: 'tag')
    Tag tag;

    @JsonKey(name: 'list')
    List<Item> list;

    Category(this.tag,this.list,);

    factory Category.fromJson(Map<String, dynamic> srcJson) => _$CategoryFromJson(srcJson);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);

}


@JsonSerializable()
class Tag extends Object {

    @JsonKey(name: 'id')
    int id;

    @JsonKey(name: 'name')
    String name;

    Tag(this.id,this.name,);

    factory Tag.fromJson(Map<String, dynamic> srcJson) => _$TagFromJson(srcJson);

    Map<String, dynamic> toJson() => _$TagToJson(this);

}





@JsonSerializable()
class CategoryTab extends Object {

    @JsonKey(name: 'cover')
    String cover;

    @JsonKey(name: 'color')
    String color;

    @JsonKey(name: 'id')
    int id;

    @JsonKey(name: 'name')
    String name;

    CategoryTab(this.cover,this.color,this.id,this.name,);

    factory CategoryTab.fromJson(Map<String, dynamic> srcJson) => _$CategoryTabFromJson(srcJson);

    Map<String, dynamic> toJson() => _$CategoryTabToJson(this);

}


@JsonSerializable()
class Header extends Object {

    @JsonKey(name: 'code')
    int code;

    @JsonKey(name: 'msg')
    String msg;

    @JsonKey(name: 'time')
    int time;

    Header(this.code,this.msg,this.time,);

    factory Header.fromJson(Map<String, dynamic> srcJson) => _$HeaderFromJson(srcJson);

    Map<String, dynamic> toJson() => _$HeaderToJson(this);

}


@JsonSerializable()
class PageInfo extends Object {

    @JsonKey(name: 'total')
    int total;

    @JsonKey(name: 'pn')
    int pn;

    @JsonKey(name: 'rn')
    int rn;

    @JsonKey(name: 'total_pn')
    int totalPn;

    @JsonKey(name: 'prev_pn')
    int prevPn;

    @JsonKey(name: 'next_pn')
    int nextPn;

    PageInfo(this.total,this.pn,this.rn,this.totalPn,this.prevPn,this.nextPn,);

    factory PageInfo.fromJson(Map<String, dynamic> srcJson) => _$PageInfoFromJson(srcJson);

    Map<String, dynamic> toJson() => _$PageInfoToJson(this);

}


