import 'package:json_annotation/json_annotation.dart';

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
    List<TypeListItem> list;

    Data(this.list,);

    factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class TypeListItem extends Object {

    @JsonKey(name: 'metadata')
    String metadata;

    @JsonKey(name: 'video')
    String video;

    @JsonKey(name: 'cover')
    String cover;

    @JsonKey(name: 'color')
    String color;

    @JsonKey(name: 'name')
    String name;

    @JsonKey(name: 'desc')
    String desc;

    @JsonKey(name: 'back')
    String back;

    @JsonKey(name: 'size')
    int size;

    @JsonKey(name: 'kbps')
    String kbps;

    @JsonKey(name: 'dpi')
    String dpi;

    @JsonKey(name: 'codec')
    String codec;

    @JsonKey(name: 'purchase')
    bool purchase;

    @JsonKey(name: 'order')
    int order;

    @JsonKey(name: 'id')
    int id;

    @JsonKey(name: 'cover_daily')
    String coverDaily;

    @JsonKey(name: 'time_daily')
    int timeDaily;

    @JsonKey(name: 'time_daily_day')
    String timeDailyDay;

    @JsonKey(name: 'time_daily_month')
    String timeDailyMonth;

    @JsonKey(name: 'time_len')
    int timeLen;

    @JsonKey(name: 'tag')
    List<int> tag;

    TypeListItem(this.metadata,this.video,this.cover,this.color,this.name,this.desc,this.back,this.size,this.kbps,this.dpi,this.codec,this.purchase,this.order,this.id,this.coverDaily,this.timeDaily,this.timeDailyDay,this.timeDailyMonth,this.timeLen,this.tag,);

    factory TypeListItem.fromJson(Map<String, dynamic> srcJson) => _$TypeListItemFromJson(srcJson);

    Map<String, dynamic> toJson() => _$TypeListItemToJson(this);

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


