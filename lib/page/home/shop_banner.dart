import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:challenge_shop/page/reward_history/reward_history_page.dart';
import 'package:challenge_shop/page/score/score_record_page.dart';
import 'package:flutter/material.dart';

class ShopBanner extends StatelessWidget {
  ShopBannerViewmodel shopBannerViewmodel;

  ShopBanner(this.shopBannerViewmodel);

  @override
  Widget build(BuildContext context) {
    if (shopBannerViewmodel == null) {
      return getUnLogin();
    }

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
                  "${shopBannerViewmodel.score}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "${shopBannerViewmodel.pointExpireNotice ?? ""}",
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
                          .push(MaterialPageRoute(builder: (_) {
                        return ScoreRecordPage();
                      }));
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
                          .push(MaterialPageRoute(builder: (_) {
                        return RewardHistoryPage();
                      }));
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

Widget getUnLogin() {
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
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  "您还没有登录哦!",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  "登录后可以查看积分信息",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              Container(
                width: 100,
                height: 33,
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(21)),
                child: Text(
                  "立即登录",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
