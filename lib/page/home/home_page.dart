import 'package:flutter/material.dart';

import 'goods_cell.dart';
import 'shop_header.dart';

class HomePage extends StatefulWidget {
  static const String routePath="/shop/homePage";



  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          SliverToBoxAdapter(child: ShopHeader()),
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
}

List<Widget> getItems() {
  List<Widget> list = new List();
  list.add(GoodsCell(
      score: 11,
      name: "商品名称",
      imgUrl:
          "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
      left: 22));
  list.add(GoodsCell(
      score: 11,
      name: "商品名称",
      imgUrl:
          "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
      left: 22));
  list.add(GoodsCell(
      score: 11,
      name: "商品名称",
      imgUrl:
          "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
      left: 22));
  list.add(GoodsCell(
      score: 11,
      name: "商品名称",
      imgUrl:
          "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
      left: 22));
  list.add(GoodsCell(
      score: 11,
      name: "商品名称",
      imgUrl:
          "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
      left: 22));
  list.add(GoodsCell(
      score: 11,
      name: "商品名称",
      imgUrl:
          "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
      left: 22));
  list.add(GoodsCell(
      score: 11,
      name: "商品名称",
      imgUrl:
          "http://t00img.yangkeduo.com/goods/images/2018-10-18/1599c1d43a1a0fa2c9b3c442a08f9709.jpeg@750w_1l_50Q.src",
      left: 22));
  return list;
}
