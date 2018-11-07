import 'package:json_annotation/json_annotation.dart';

part 'address_field.g.dart';


@JsonSerializable()
class AddressField extends Object {

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'postalCode')
  String postalCode;

  @JsonKey(name: 'provinceName')
  String provinceName;

  @JsonKey(name: 'provinceId')
  int provinceId;

  @JsonKey(name: 'cityName')
  String cityName;

  @JsonKey(name: 'cityId')
  int cityId;

  @JsonKey(name: 'areaName')
  String areaName;

  @JsonKey(name: 'areaId')
  int areaId;

  @JsonKey(name: 'detailInfo')
  String detailInfo;

  @JsonKey(name: 'telNumber')
  String telNumber;

  AddressField(this.userName,this.postalCode,this.provinceName,this.provinceId,this.cityName,this.cityId,this.areaName,this.areaId,this.detailInfo,this.telNumber,);

  factory AddressField.fromJson(Map<String, dynamic> srcJson) => _$AddressFieldFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddressFieldToJson(this);

}


