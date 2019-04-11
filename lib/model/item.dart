import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Object {

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

    Item(this.metadata,this.video,this.cover,this.color,this.name,this.desc,this.back,this.size,this.kbps,this.dpi,this.codec,this.purchase,this.order,this.id,this.coverDaily,this.timeDaily,this.timeDailyDay,this.timeDailyMonth,this.timeLen,this.tag,);

    factory Item.fromJson(Map<String, dynamic> srcJson) => _$ItemFromJson(srcJson);

    Map<String, dynamic> toJson() => _$ItemToJson(this);

}