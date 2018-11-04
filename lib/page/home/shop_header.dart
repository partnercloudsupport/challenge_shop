import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:challenge_shop/page/home/shop_news.dart';
import 'package:flutter/material.dart';

import 'shop_banner.dart';

class ShopHeader extends StatelessWidget {
  ShopBannerViewmodel shopBannerViewmodel;

  ShopHeader(this.shopBannerViewmodel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ShopBanner(shopBannerViewmodel),
        ShopNews(shopBannerViewmodel),
      ],
    );
  }
}
