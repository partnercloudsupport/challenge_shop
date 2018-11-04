// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_score_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyScoreInfoModel _$MyScoreInfoModelFromJson(Map<String, dynamic> json) {
  return MyScoreInfoModel(
      json['totalPoint'] as int,
      json['pointExpireNotice'] == null
          ? null
          : PointExpireNotice.fromJson(
              json['pointExpireNotice'] as Map<String, dynamic>),
      (json['latestExchangeStatus'] as List)
          ?.map((e) => e == null
              ? null
              : LatestExchangeStatus.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MyScoreInfoModelToJson(MyScoreInfoModel instance) =>
    <String, dynamic>{
      'totalPoint': instance.totalPoint,
      'pointExpireNotice': instance.pointExpireNotice,
      'latestExchangeStatus': instance.latestExchangeStatus
    };

PointExpireNotice _$PointExpireNoticeFromJson(Map<String, dynamic> json) {
  return PointExpireNotice(
      json['point'] as int, json['date'] as String, json['visible'] as bool);
}

Map<String, dynamic> _$PointExpireNoticeToJson(PointExpireNotice instance) =>
    <String, dynamic>{
      'point': instance.point,
      'date': instance.date,
      'visible': instance.visible
    };

LatestExchangeStatus _$LatestExchangeStatusFromJson(Map<String, dynamic> json) {
  return LatestExchangeStatus(
      json['id'] as int,
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['createTime'] as int);
}

Map<String, dynamic> _$LatestExchangeStatusToJson(
        LatestExchangeStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'user': instance.user,
      'createTime': instance.createTime
    };

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover(
      json['fileType'] as String,
      json['thumb'] as String,
      json['height'] as int,
      json['width'] as int,
      json['url'] as String,
      json['original'] as String);
}

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'fileType': instance.fileType,
      'thumb': instance.thumb,
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
      'original': instance.original
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as int,
      json['nickname'] as String,
      json['avatar'] as String,
      json['sex'] as String,
      json['verified'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'sex': instance.sex,
      'verified': instance.verified
    };
