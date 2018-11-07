import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable()
class District extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'children')
  List<District> children;

  District(
    this.id,
    this.name,
    this.children,
  );

  factory District.fromJson(Map<String, dynamic> srcJson) =>
      _$DistrictFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  static List<District> getDistrictList(List<dynamic> list) {
    List<District> result = [];
    list.forEach((item) {
      result.add(District.fromJson(item));
    });
    return result;
  }
}
