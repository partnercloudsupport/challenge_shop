// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) {
  return District(
      json['id'] as int,
      json['name'] as String,
      (json['children'] as List)
          ?.map((e) =>
              e == null ? null : District.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'children': instance.children
    };
