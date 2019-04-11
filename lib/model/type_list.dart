import 'package:json_annotation/json_annotation.dart';
import 'package:livepaper/model/item.dart';

part 'type_list.g.dart';


@JsonSerializable()
class TypeList extends Object {

    @JsonKey(name: 'data')
    Data data;

    @JsonKey(name: 'header')
    Header header;

    @JsonKey(name: 'pageInfo')
    PageInfo pageInfo;

    TypeList(this.data,this.header,this.pageInfo,);

    factory TypeList.fromJson(Map<String, dynamic> srcJson) => _$TypeListFromJson(srcJson);

    Map<String, dynamic> toJson() => _$TypeListToJson(this);

}


@JsonSerializable()
class Data extends Object {

    @JsonKey(name: 'list')
    List<Item> list;

    Data(this.list,);

    factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$DataToJson(this);

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


