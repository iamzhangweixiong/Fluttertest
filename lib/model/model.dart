import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// 命令行 flutter packages pub run build_runner build

@JsonSerializable()
class Hot {
  int code;
  @JsonKey(name: 'data')
  List<HotData> hotData;
  String message;
  int stime;

  Hot(this.code, this.hotData, this.message, this.stime);

  factory Hot.fromJson(Map<String, dynamic> json) => _$HotFromJson(json);

  Map<String, dynamic> toJson() => _$HotToJson(this);
}

@JsonSerializable()
class HotData {
  int category;

  @JsonKey(name: 'cover_url')
  String coverUrl;
  String description;

  @JsonKey(name: 'favourite_count')
  String favouriteCount;

  String name;

  @JsonKey(name: 'preview_url')
  String previewUrl;

  @JsonKey(name: 'source_id')
  int sourceId;

  @JsonKey(name: 'source_url')
  String sourceUrl;

  int type;

  HotData(this.category, this.coverUrl, this.description, this.favouriteCount,
      this.name, this.previewUrl, this.sourceId, this.sourceUrl);

  factory HotData.fromJson(Map<String, dynamic> json) =>
      _$HotDataFromJson(json);

  Map<String, dynamic> toJson() => _$HotDataToJson(this);
}
