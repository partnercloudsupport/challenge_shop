import 'dart:async';

import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:flutter/material.dart';

class ShopNews extends StatefulWidget {

  ShopBannerViewmodel shopBannerViewmodel;

  ShopNews(this.shopBannerViewmodel);

  @override
  State<StatefulWidget> createState() {
    return ShopNewsState();
  }
}

class ShopNewsState extends State<ShopNews> {
  ScrollController scroController;
  Timer timer;
  double position = 0.0;
  double screenWidth;
  double screenHeight;

  @override
  void initState() {
    super.initState();
    scroController = ScrollController();
    timer = Timer.periodic(new Duration(milliseconds: 100), (timer) {
      double maxScrollExtent = scroController.position.maxScrollExtent;
      double pixels = scroController.position.pixels;
      if (pixels + 3.0 >= maxScrollExtent) {
        position = 0;
        scroController.jumpTo(position);
      }
      position += 3.0;
      scroController.animateTo(
          position, duration: new Duration(milliseconds: 500),
          curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.shopBannerViewmodel == null) {
      return Container();
    }
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
                  child: ListView.builder(
                      controller: scroController,
                      itemCount:
                      (widget.shopBannerViewmodel?.latestExchangeStatus
                          ?.length ??
                          0) > 0 ? double.maxFinite.toInt() : 0,
                      itemBuilder: (context, index) {
                        return getMarqueeContent(
                            widget.shopBannerViewmodel
                                ?.latestExchangeStatus[index %
                                widget.shopBannerViewmodel
                                    ?.latestExchangeStatus?.length]);
                      }),
                )
              ],
            ),
          ),
        ],
      ),
      height: 50,
    );
  }


  Widget getMarqueeContent(BannerNews banerNews) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "${banerNews.userName} 兑换了 ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff717171),
                      )),
                  TextSpan(
                      text: '${banerNews.productName}',
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
            "${banerNews.createTime}",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff717171),
            ),
          ),
        ),
      ],
    );
  }
}

