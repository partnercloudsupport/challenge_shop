// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressParam _$AddressParamFromJson(Map<String, dynamic> json) {
  return AddressParam(
      userName: json['userName'] as String,
      postalCode: json['postalCode'] as String,
      provinceId: json['provinceId'] as int,
      cityId: json['cityId'] as int,
      areaId: json['areaId'] as int,
      detailInfo: json['detailInfo'] as String,
      telNumber: json['telNumber'] as String);
}

Map<String, dynamic> _$AddressParamToJson(AddressParam instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'postalCode': instance.postalCode,
      'provinceId': instance.provinceId,
      'cityId': instance.cityId,
      'areaId': instance.areaId,
      'detailInfo': instance.detailInfo,
      'telNumber': instance.telNumber
    };
