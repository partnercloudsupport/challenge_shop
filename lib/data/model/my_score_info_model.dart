import 'package:json_annotation/json_annotation.dart';

part 'my_score_info_model.g.dart';

@JsonSerializable()
class MyScoreInfoModel {
  int totalPoint;
  List<LatestExchangeStatus> latestExchangeStatus;
  PointExpireNotice pointExpireNotice;

  MyScoreInfoModel(
      this.totalPoint, this.latestExchangeStatus, this.pointExpireNotice);

  factory MyScoreInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MyScoreInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyScoreInfoModelToJson(this);
}

@JsonSerializable()
class PointExpireNotice {
  int point;
  bool visible;
  String date;

  PointExpireNotice(this.point, this.visible, this.date);

  factory PointExpireNotice.fromJson(Map<String, dynamic> json) =>
      _$PointExpireNoticeFromJson(json);

  Map<String, dynamic> toJson() => _$PointExpireNoticeToJson(this);
}

@JsonSerializable()
class LatestExchangeStatus {
  int createTime;
  int id;
  Product product;
  User user;

  LatestExchangeStatus(this.createTime, this.id, this.product, this.user);

  factory LatestExchangeStatus.fromJson(Map<String, dynamic> json) =>
      _$LatestExchangeStatusFromJson(json);

  Map<String, dynamic> toJson() => _$LatestExchangeStatusToJson(this);
}

@JsonSerializable()
class User {
  int id;
  String avatar;
  String nickname;
  String sex;
  bool verified;

  User(this.id, this.avatar, this.nickname, this.sex, this.verified);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  int inStockQuantity;
  int point;
  String title;
  Cover cover;

  Product(this.id, this.inStockQuantity, this.point, this.title, this.cover);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Cover {
  int height;
  int width;
  String fileType;
  String original;
  String thumb;
  String url;

  Cover(this.height, this.width, this.fileType, this.original, this.thumb,
      this.url);

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);

  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
