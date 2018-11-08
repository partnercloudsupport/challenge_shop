import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';


@JsonSerializable()
class Result extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  dynamic data;

  Result(this.status,this.msg,this.data,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}


  
