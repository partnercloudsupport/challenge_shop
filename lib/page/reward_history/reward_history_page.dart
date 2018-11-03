import 'package:flutter/material.dart';
import 'reward_record_cell.dart';
class RewardHistoryPage extends StatefulWidget {
  static const String routePath = "/shop/rewardHistoryPage";

  @override
  State<StatefulWidget> createState() => RewardHistoryPageState();
}

class RewardHistoryPageState extends State<RewardHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "兑换记录",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 120,
        itemBuilder: (context, index) {
          return RewardRecordCell();
        },
      ),
    );
  }
}
