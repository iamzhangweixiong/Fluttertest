// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hot _$HotFromJson(Map<String, dynamic> json) {
  return Hot(
      json['code'] as int,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : HotData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['message'] as String,
      json['stime'] as int);
}

Map<String, dynamic> _$HotToJson(Hot instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.hotData,
      'message': instance.message,
      'stime': instance.stime
    };

HotData _$HotDataFromJson(Map<String, dynamic> json) {
  return HotData(
      json['category'] as int,
      json['cover_url'] as String,
      json['description'] as String,
      json['favourite_count'] as String,
      json['name'] as String,
      json['preview_url'] as String,
      json['source_id'] as int,
      json['source_url'] as String)
    ..type = json['type'] as int;
}

Map<String, dynamic> _$HotDataToJson(HotData instance) => <String, dynamic>{
      'category': instance.category,
      'cover_url': instance.coverUrl,
      'description': instance.description,
      'favourite_count': instance.favouriteCount,
      'name': instance.name,
      'preview_url': instance.previewUrl,
      'source_id': instance.sourceId,
      'source_url': instance.sourceUrl,
      'type': instance.type
    };
