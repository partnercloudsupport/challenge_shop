// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressField _$AddressFieldFromJson(Map<String, dynamic> json) {
  return AddressField(
      json['userName'] as String,
      json['postalCode'] as String,
      json['provinceName'] as String,
      json['provinceId'] as int,
      json['cityName'] as String,
      json['cityId'] as int,
      json['areaName'] as String,
      json['areaId'] as int,
      json['detailInfo'] as String,
      json['telNumber'] as String);
}

Map<String, dynamic> _$AddressFieldToJson(AddressField instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'postalCode': instance.postalCode,
      'provinceName': instance.provinceName,
      'provinceId': instance.provinceId,
      'cityName': instance.cityName,
      'cityId': instance.cityId,
      'areaName': instance.areaName,
      'areaId': instance.areaId,
      'detailInfo': instance.detailInfo,
      'telNumber': instance.telNumber
    };
