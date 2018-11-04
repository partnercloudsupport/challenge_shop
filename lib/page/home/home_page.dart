import 'package:challenge_shop/data/mock_service.dart';
import 'package:challenge_shop/data/model/product.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:flutter/material.dart';

import 'goods_cell.dart';
import 'shop_header.dart';

class HomePage extends StatefulWidget {
  static const String routePath = "/shop/homePage";

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ShopBannerViewmodel _shopBannerViewmodel;
  List<Product> products;

  MockService _mockService = MockService();

  @override
  void initState() {
    super.initState();

    _mockService.getHomeBannerModel().listen((shopBannerViewmodel) {
      setState(() {
        _shopBannerViewmodel = shopBannerViewmodel;
      });
    }, onError: (error) {
      print("error");
    });

    _mockService.getHomeProducts().listen((pageInfo) {
      setState(() {
        products = pageInfo.listData;
      });
    }, onError: (error) {
      print("error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          "商城",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: ShopHeader(_shopBannerViewmodel)),
          SliverSafeArea(
            minimum: const EdgeInsets.all(10.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.73,
              crossAxisSpacing: 4.0,
              children: getItems(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getItems() {
    return (products ?? []).map((product) {
      return GoodsCell(
          score: product?.point,
          name: product?.title,
          imgUrl: product?.cover?.url,
          left: product?.inStockQuantity);
    }).toList();
  }
}
