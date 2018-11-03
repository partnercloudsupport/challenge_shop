import 'package:challenge_shop/page/reward_history/reward_dialog.dart';
import 'package:flutter/material.dart';

class RewardRecordCell extends StatelessWidget {
  RewardDialog dialog=RewardDialog();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, state) {
                return dialog;
              },
            );
          },
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 28,
            color: Color(0xfff5f5f5),
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "2018-10-12 15:02:23",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffaaaaaa),
                  ),
                ),
                Text(
                  "待发货",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 104,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Image.network(
                    "https://img.alicdn.com/imgextra/i4/14120949/TB2PTCdcAvoK1RjSZFDXXXY3pXa_!!0-saturn_solar.jpg_240x240.jpg",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "商品名称商",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "1000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0CC975),
                                    fontSize: 21,
                                  )),
                              TextSpan(
                                  text: '积分',
                                  style: TextStyle(
                                    color: Color(0xff0CC975),
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Icon(
                    Icons.navigate_next,
                    color: Color(0xffc3c3c3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
