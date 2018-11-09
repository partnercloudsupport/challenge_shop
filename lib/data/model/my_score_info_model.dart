import 'package:challenge_shop/data/model/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'my_score_info_model.g.dart';


@JsonSerializable()
class MyScoreInfoModel extends Object {

  @JsonKey(name: 'totalPoint')
  int totalPoint;

  @JsonKey(name: 'pointExpireNotice')
  PointExpireNotice pointExpireNotice;


  MyScoreInfoModel(this.totalPoint,this.pointExpireNotice);

  factory MyScoreInfoModel.fromJson(Map<String, dynamic> srcJson) => _$MyScoreInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyScoreInfoModelToJson(this);

}


@JsonSerializable()
class PointExpireNotice extends Object {

  @JsonKey(name: 'point')
  int point;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'visible')
  bool visible;

  PointExpireNotice(this.point,this.date,this.visible,);

  factory PointExpireNotice.fromJson(Map<String, dynamic> srcJson) => _$PointExpireNoticeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PointExpireNoticeToJson(this);

}


@JsonSerializable()
class LatestExchangeStatus extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'product')
  Product product;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'createTime')
  int createTime;

  LatestExchangeStatus(this.id,this.product,this.user,this.createTime,);

  factory LatestExchangeStatus.fromJson(Map<String, dynamic> srcJson) => _$LatestExchangeStatusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LatestExchangeStatusToJson(this);


  static List<LatestExchangeStatus> getLatestExchangeStatusList(List<dynamic> list){
    List<LatestExchangeStatus> result = [];
    list.forEach((item){
      result.add(LatestExchangeStatus.fromJson(item));
    });
    return result;
  }

}




@JsonSerializable()
class Cover extends Object {

  @JsonKey(name: 'fileType')
  String fileType;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'original')
  String original;

  Cover(this.fileType,this.thumb,this.height,this.width,this.url,this.original,);

  factory Cover.fromJson(Map<String, dynamic> srcJson) => _$CoverFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoverToJson(this);

}


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'sex')
  String sex;

  @JsonKey(name: 'verified')
  String verified;

  User(this.id,this.nickname,this.avatar,this.sex,this.verified,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


