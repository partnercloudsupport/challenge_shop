import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';


@JsonSerializable()
class PageInfo extends Object {

  @JsonKey(name: 'totalNum')
  int totalNum;

  @JsonKey(name: 'pageNo')
  int pageNo;

  @JsonKey(name: 'pageSize')
  int pageSize;

  @JsonKey(name: 'listData')
  List<dynamic> listData;

  PageInfo(this.totalNum,this.pageNo,this.pageSize,this.listData,);

  factory PageInfo.fromJson(Map<String, dynamic> srcJson) => _$PageInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);

}

  
