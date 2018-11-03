import 'package:flutter/material.dart';

class ScoreOverdueAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Color(0xffFBF4DC),
      child: Center(
        child: Text(
          "有50积分即将在2018年12月31日24时过期",
          style: TextStyle(color: Color(0xffEC1515)),
        ),
      ),
    );
  }
}
