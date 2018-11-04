import 'package:json_annotation/json_annotation.dart';

part 'score_history_info.g.dart';


@JsonSerializable()
class ScoreHistoryInfo extends Object {

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'point')
  int point;

  @JsonKey(name: 'direct')
  String direct;

  @JsonKey(name: 'productTitle')
  String productTitle;

  @JsonKey(name: 'challengeTitle')
  String challengeTitle;

  ScoreHistoryInfo(this.createTime,this.title,this.point,this.direct,this.productTitle,this.challengeTitle,);

  factory ScoreHistoryInfo.fromJson(Map<String, dynamic> srcJson) => _$ScoreHistoryInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ScoreHistoryInfoToJson(this);

}

@JsonSerializable()
class ScoreHistoryNotice extends Object {

  @JsonKey(name: 'point')
  int point;

  @JsonKey(name: 'date')
  String date;

  ScoreHistoryNotice(this.point,this.date,);

  factory ScoreHistoryNotice.fromJson(Map<String, dynamic> srcJson) => _$ScoreHistoryNoticeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ScoreHistoryNoticeToJson(this);

}

