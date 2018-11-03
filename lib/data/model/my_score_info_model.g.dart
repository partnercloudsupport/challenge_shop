// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_score_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyScoreInfoModel _$MyScoreInfoModelFromJson(Map<String, dynamic> json) {
  return MyScoreInfoModel(
      json['totalPoint'] as int,
      (json['latestExchangeStatus'] as List)
          ?.map((e) => e == null
              ? null
              : LatestExchangeStatus.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['pointExpireNotice'] == null
          ? null
          : PointExpireNotice.fromJson(
              json['pointExpireNotice'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MyScoreInfoModelToJson(MyScoreInfoModel instance) =>
    <String, dynamic>{
      'totalPoint': instance.totalPoint,
      'latestExchangeStatus': instance.latestExchangeStatus,
      'pointExpireNotice': instance.pointExpireNotice
    };

PointExpireNotice _$PointExpireNoticeFromJson(Map<String, dynamic> json) {
  return PointExpireNotice(
      json['point'] as int, json['visible'] as bool, json['date'] as String);
}

Map<String, dynamic> _$PointExpireNoticeToJson(PointExpireNotice instance) =>
    <String, dynamic>{
      'point': instance.point,
      'visible': instance.visible,
      'date': instance.date
    };

LatestExchangeStatus _$LatestExchangeStatusFromJson(Map<String, dynamic> json) {
  return LatestExchangeStatus(
      json['createTime'] as int,
      json['id'] as int,
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LatestExchangeStatusToJson(
        LatestExchangeStatus instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'id': instance.id,
      'product': instance.product,
      'user': instance.user
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as int,
      json['avatar'] as String,
      json['nickname'] as String,
      json['sex'] as String,
      json['verified'] as bool);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'nickname': instance.nickname,
      'sex': instance.sex,
      'verified': instance.verified
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
      json['id'] as int,
      json['inStockQuantity'] as int,
      json['point'] as int,
      json['title'] as String,
      json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'inStockQuantity': instance.inStockQuantity,
      'point': instance.point,
      'title': instance.title,
      'cover': instance.cover
    };

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover(
      json['height'] as int,
      json['width'] as int,
      json['fileType'] as String,
      json['original'] as String,
      json['thumb'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'fileType': instance.fileType,
      'original': instance.original,
      'thumb': instance.thumb,
      'url': instance.url
    };
