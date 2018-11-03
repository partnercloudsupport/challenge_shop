import 'package:challenge_shop/page/score/score_overdue_alarm.dart';
import 'package:flutter/material.dart';

import 'score_record_cell.dart';

class ScoreRecordPage extends StatefulWidget {
  static const String routePath = "/shop/scoreRecordPage";

  @override
  State<StatefulWidget> createState() => ScoreRecordPageState();
}

class ScoreRecordPageState extends State<ScoreRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "积分明细",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: Column(
          children: <Widget>[
            ScoreOverdueAlarm(),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ScoreRecordCell();
                },
              ),
            ),
          ],
        ));
  }
}
