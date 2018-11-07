import 'package:json_annotation/json_annotation.dart';

part 'address_param.g.dart';

@JsonSerializable()
class AddressParam extends Object {
  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'postalCode')
  String postalCode;

  @JsonKey(name: 'provinceId')
  int provinceId;

  @JsonKey(name: 'cityId')
  int cityId;

  @JsonKey(name: 'areaId')
  int areaId;

  @JsonKey(name: 'detailInfo')
  String detailInfo;

  @JsonKey(name: 'telNumber')
  String telNumber;

  AddressParam({
    this.userName,
    this.postalCode,
    this.provinceId,
    this.cityId,
    this.areaId,
    this.detailInfo,
    this.telNumber,
  });

  factory AddressParam.fromJson(Map<String, dynamic> srcJson) =>
      _$AddressParamFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddressParamToJson(this);
}
