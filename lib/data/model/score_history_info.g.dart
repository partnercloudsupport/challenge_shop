// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_history_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreHistoryInfo _$ScoreHistoryInfoFromJson(Map<String, dynamic> json) {
  return ScoreHistoryInfo(
      json['createTime'] as int,
      json['title'] as String,
      json['point'] as int,
      json['direct'] as String,
      json['productTitle'] as String,
      json['challengeTitle'] as String);
}

Map<String, dynamic> _$ScoreHistoryInfoToJson(ScoreHistoryInfo instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'title': instance.title,
      'point': instance.point,
      'direct': instance.direct,
      'productTitle': instance.productTitle,
      'challengeTitle': instance.challengeTitle
    };

ScoreHistoryNotice _$ScoreHistoryNoticeFromJson(Map<String, dynamic> json) {
  return ScoreHistoryNotice(json['point'] as int, json['date'] as String);
}

Map<String, dynamic> _$ScoreHistoryNoticeToJson(ScoreHistoryNotice instance) =>
    <String, dynamic>{'point': instance.point, 'date': instance.date};
