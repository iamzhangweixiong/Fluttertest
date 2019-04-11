// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeList _$TypeListFromJson(Map<String, dynamic> json) {
  return TypeList(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TypeListToJson(TypeList instance) => <String, dynamic>{
      'data': instance.data,
      'header': instance.header,
      'pageInfo': instance.pageInfo
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data((json['list'] as List)
      ?.map((e) =>
          e == null ? null : TypeListItem.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'list': instance.list};

TypeListItem _$TypeListItemFromJson(Map<String, dynamic> json) {
  return TypeListItem(
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

Map<String, dynamic> _$TypeListItemToJson(TypeListItem instance) =>
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

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return Header(
      json['code'] as int, json['msg'] as String, json['time'] as int);
}

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'time': instance.time
    };

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return PageInfo(json['total'] as int, json['pn'] as int, json['rn'] as int,
      json['total_pn'] as int, json['prev_pn'] as int, json['next_pn'] as int);
}

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      'total': instance.total,
      'pn': instance.pn,
      'rn': instance.rn,
      'total_pn': instance.totalPn,
      'prev_pn': instance.prevPn,
      'next_pn': instance.nextPn
    };
