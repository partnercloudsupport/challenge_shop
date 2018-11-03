import 'package:challenge_shop/page/home/shop_news.dart';
import 'package:flutter/material.dart';

import 'shop_banner.dart';

class ShopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ShopBanner(),
        ShopNews(),
      ],
    );
  }
}
