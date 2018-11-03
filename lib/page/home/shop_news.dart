import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ShopNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 11),
            child: Text(
              "兑换专区",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1c1c1c)),
            ),
          ),
          Container(
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 9),
                  child: Image.asset(
                    "assets/imgs/3.0x/ic_news.png",
                    width: 12,
                    height: 10,
                  ),
                ),
                Container(
                  height: 20,
                  width: 220,
                  margin: EdgeInsets.only(right: 11),
                  child: Marquee(
                      scrollAxis: Axis.vertical,
                      velocity: 10,
                      blankSpace: 5.0,
                      child: getMarqueeContent()),
                )
              ],
            ),
          ),
        ],
      ),
      height: 50,
    );
  }
}

Widget getMarqueeContent() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: "码农弟弟 兑换了 ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff717171),
                    )),
                TextSpan(
                    text: '任天堂3ds任天堂3ds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff717171),
                      fontSize: 12,
                    )),
              ],
            ),
            overflow: TextOverflow.ellipsis),
      ),
      Container(
        margin: EdgeInsets.only(left: 20),
        child: Text(
          "12:26",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff717171),
          ),
        ),
      ),
    ],
  );
}
