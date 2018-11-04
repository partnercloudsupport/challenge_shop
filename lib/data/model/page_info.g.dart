// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return PageInfo(
      json['totalNum'] as int,
      json['pageNo'] as int,
      json['pageSize'] as int,
      json['listData'] as List,
      json['extras'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      'totalNum': instance.totalNum,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'listData': instance.listData,
      'extras': instance.extras
    };
