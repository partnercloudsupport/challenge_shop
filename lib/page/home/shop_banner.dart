import 'package:challenge_shop/page/reward_history/reward_history_page.dart';
import 'package:challenge_shop/page/score/score_record_page.dart';
import 'package:flutter/material.dart';

class ShopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "assets/imgs/3.0x/bg_shop_header.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: null,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Image.asset(
                  "assets/imgs/3.0x/ic_question.png",
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 21),
                child: Text(
                  "我的积分",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "12345",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "有60积分即将在2018年12月31日24时过期",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ScoreRecordPage.routePath);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      width: 85,
                      height: 23,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(21)),
                      child: Text(
                        '积分明细',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RewardHistoryPage.routePath);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 10),
                      alignment: AlignmentDirectional.center,
                      width: 85,
                      height: 23,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(21)),
                      child: Text(
                        '兑换记录',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          )),
        ],
      ),
    );
  }
}
