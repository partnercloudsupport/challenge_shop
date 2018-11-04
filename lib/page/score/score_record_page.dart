import 'package:challenge_shop/data/mock_service.dart';
import 'package:challenge_shop/data/model/score_history_info.dart';
import 'package:challenge_shop/page/score/score_overdue_alarm.dart';
import 'package:flutter/material.dart';

import 'score_record_cell.dart';

class ScoreRecordPage extends StatefulWidget {
  static const String routePath = "/shop/scoreRecordPage";

  @override
  State<StatefulWidget> createState() => ScoreRecordPageState();
}

class ScoreRecordPageState extends State<ScoreRecordPage> {
  MockService _mockService = MockService();
  List<ScoreHistoryInfo> scoreList;

  @override
  void initState() {
    super.initState();

    _mockService.getScoreHistory().listen((pageInfo) {
      setState(() {
        scoreList = pageInfo.listData;
      });
    }, onError: (error) {
      print("error");
    });
  }

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
                itemCount: scoreList.length,
                itemBuilder: (context, index) {
                  return ScoreRecordCell(scoreList[index]);
                },
              ),
            ),
          ],
        ));
  }
}
