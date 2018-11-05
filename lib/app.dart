import 'package:challenge_shop/page/detail/goods_detail_page.dart';
import 'package:challenge_shop/page/home/home_page.dart';
import 'package:challenge_shop/page/reward_history/reward_history_page.dart';
import 'package:challenge_shop/page/score/score_record_page.dart';
import 'package:challenge_shop/page/success/success_page.dart';
import 'package:flutter/material.dart';

class ShopApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  HomePage _homePage = new HomePage();

  Map<String, WidgetBuilder> _routes = {
    HomePage.routePath: (_) => new HomePage(),
    GoodsDetailPage.routePath: (_) => new GoodsDetailPage(),
    RewardHistoryPage.routePath: (_) => new RewardHistoryPage(),
    ScoreRecordPage.routePath: (_) => new ScoreRecordPage(),
    SuccessPage.routePath: (_) => new SuccessPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xffF5F5F5),
      routes: _routes,
      theme: new ThemeData(
//        brightness: Brightness.dark,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: _homePage,
    );
  }
}
