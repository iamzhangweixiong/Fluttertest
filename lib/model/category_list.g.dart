// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) {
  return CategoryList(
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

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'header': instance.header,
      'pageInfo': instance.pageInfo
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      (json['category'] as List)
          ?.map((e) =>
              e == null ? null : Category.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['tab'] as List)
          ?.map(
              (e) => e == null ? null : CategoryTab.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'category': instance.category, 'tab': instance.tab};

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      json['tag'] == null
          ? null
          : Tag.fromJson(json['tag'] as Map<String, dynamic>),
      (json['list'] as List)
          ?.map((e) =>
              e == null ? null : Item.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CategoryToJson(Category instance) =>
    <String, dynamic>{'tag': instance.tag, 'list': instance.list};

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(json['id'] as int, json['name'] as String);
}

Map<String, dynamic> _$TagToJson(Tag instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

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

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
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

CategoryTab _$TabFromJson(Map<String, dynamic> json) {
  return CategoryTab(json['cover'] as String, json['color'] as String,
      json['id'] as int, json['name'] as String);
}

Map<String, dynamic> _$TabToJson(CategoryTab instance) => <String, dynamic>{
      'cover': instance.cover,
      'color': instance.color,
      'id': instance.id,
      'name': instance.name
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
