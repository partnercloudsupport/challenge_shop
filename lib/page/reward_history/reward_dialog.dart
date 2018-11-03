import 'package:flutter/material.dart';

class RewardDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RewardDialogState();
  }
}

class RewardDialogState extends State {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 15,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "详情",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            getGoodsInfoWidget(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 90,
                  margin: EdgeInsets.only(right: 16, top: 17),
                  child: Text(
                    "收货人",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xffaaaaaa)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 17),
                    child: Text("码农弟弟"),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 90,
                  margin: EdgeInsets.only(right: 16, top: 17),
                  child: Text(
                    "手机号",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xffaaaaaa)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 19),
                    child: Text("18050400657"),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 90,
                  margin: EdgeInsets.only(right: 16, top: 17),
                  child: Text(
                    "配送地址",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xffaaaaaa)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 17, right: 50),
                    child: Text("福州市鼓楼区信和广场四楼17173商场电梯上来,右手边,放在台球桌上"),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 90,
                  margin: EdgeInsets.only(right: 16, top: 17),
                  child: Text(
                    "邮政编码",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xffaaaaaa)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 19),
                    child: Text("350000"),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 11, right: 11),
              child: Divider(),
            ),
            getStatusWidget(),
          ],
        ),
      ),
    );
  }
}

Widget getGoodsInfoWidget() {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xfff5f5f5),
      borderRadius: BorderRadius.circular(5),
    ),
    margin: EdgeInsets.only(left: 11, right: 11),
    height: 95,
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 11,
          left: 8,
          child: Image.network(
              "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
              width: 73,
              height: 73,
              fit: BoxFit.fill),
        ),
        Positioned(
          top: 8,
          left: 94,
          right: 13,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "JBL超级JBL超级JBL超级JBL超级JBL超级JBL超级JBL超级JBL超级JBL超级JBL超级",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text.rich(
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
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 94,
          child: Text(
            "2018-12-25 14:25:12",
            style: TextStyle(fontSize: 12, color: Color(0xffaaaaaa)),
          ),
        )
      ],
    ),
  );
}

Widget getStatusWidget() {
  return getSendedStatusWiget();
}

Widget getCardSendedStatusWiget() {
  return Column(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16),
            child: Text(
              "处理状态",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                "已发货",
                style: TextStyle(
                  color: Color(0xff0CC975),
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16, top: 17),
            child: Text(
              "卡号",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 19),
            child: Text(
              "1213121213",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 17, left: 5),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Text(
                "复制",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16, top: 17, bottom: 20),
            child: Text(
              "运单号",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 19, bottom: 20),
            child: Text(
              "100000000000000000",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 17, left: 5),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Text(
                "复制",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}

Widget getSendedStatusWiget() {
  return Column(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16),
            child: Text(
              "处理状态",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                "已发货",
                style: TextStyle(
                  color: Color(0xff0CC975),
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16, top: 17),
            child: Text(
              "快递公司",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 17),
              child: Text(
                "申通",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16, top: 17, bottom: 20),
            child: Text(
              "运单号",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 19, bottom: 20),
            child: Text(
              "100000000000000000",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 17, left: 5),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Text(
                "复制",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}

Widget getUnSendStatusWidget() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        width: 90,
        margin: EdgeInsets.only(right: 16, bottom: 17),
        child: Text(
          "处理状态",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xffaaaaaa),
            fontSize: 12,
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "待发货",
            style: TextStyle(
              color: Color(0xffE98943),
              fontSize: 12,
            ),
          ),
        ),
      ),
    ],
  );
}
