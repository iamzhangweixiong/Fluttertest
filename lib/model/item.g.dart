part of 'item.dart';

Item _$ItemFromJson(Map<String, dynamic> json) {
    return Item(
        json['metadata'] as String,
        json['video'] as String,
        json['cover'] as String,
        json['color'] as String,
        json['name'] as String,
        json['desc'] as String,
        json['back'] as String,
        json['size'] as int,
        json['kbps'] as String,
        json['dpi'] as String,
        json['codec'] as String,
        json['purchase'] as bool,
        json['order'] as int,
        json['id'] as int,
        json['cover_daily'] as String,
        json['time_daily'] as int,
        json['time_daily_day'] as String,
        json['time_daily_month'] as String,
        json['time_len'] as int,
        (json['tag'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$ItemToJson(Item instance) =>
    <String, dynamic>{
        'metadata': instance.metadata,
        'video': instance.video,
        'cover': instance.cover,
        'color': instance.color,
        'name': instance.name,
        'desc': instance.desc,
        'back': instance.back,
        'size': instance.size,
        'kbps': instance.kbps,
        'dpi': instance.dpi,
        'codec': instance.codec,
        'purchase': instance.purchase,
        'order': instance.order,
        'id': instance.id,
        'cover_daily': instance.coverDaily,
        'time_daily': instance.timeDaily,
        'time_daily_day': instance.timeDailyDay,
        'time_daily_month': instance.timeDailyMonth,
        'time_len': instance.timeLen,
        'tag': instance.tag
    };