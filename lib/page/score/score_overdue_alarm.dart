import 'package:challenge_shop/data/model/score_history_info.dart';
import 'package:flutter/material.dart';

class ScoreOverdueAlarm extends StatelessWidget {
  ScoreHistoryNotice scoreHistoryNotice;
  ScoreOverdueAlarm(this.scoreHistoryNotice);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Color(0xffFBF4DC),
      child: Center(
        child: Text(
          "有${scoreHistoryNotice.point}积分即将在${scoreHistoryNotice.date}过期",
          style: TextStyle(color: Color(0xffEC1515)),
        ),
      ),
    );
  }
}
