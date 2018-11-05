import 'dart:async' show Future;
import 'dart:convert';

import 'package:challenge_shop/data/converter/shop_banner_converter.dart';
import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/data/model/my_score_info_model.dart';
import 'package:challenge_shop/data/model/page_info.dart';
import 'package:challenge_shop/data/model/product.dart';
import 'package:challenge_shop/data/model/product_detail.dart';
import 'package:challenge_shop/data/model/score_history_info.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rxdart/rxdart.dart';

class MockService {
  Future<String> loadJson(String fileName) async {
    return await rootBundle.loadString("assets/json/${fileName}.json");
  }

  Observable<Object> rxLoadJson(String fileName) {
    return Observable<Object>.fromFuture(loadJson(fileName))
        .map((jsonStr) => json.decode(jsonStr));
  }

  Observable<ShopBannerViewmodel> getHomeBannerModel() {
    return rxLoadJson("my_score_info")
        .map((obj) => MyScoreInfoModel.fromJson(obj))
        .map((it) => ShopBannerConverter.conver(it));
  }

  Observable<PageInfo> getHomeProducts() {
    return rxLoadJson("products").map((it) => PageInfo.fromJson(it)).doOnData(
        (pageInfo) => pageInfo.listData =
            pageInfo.listData.map((it) => Product.fromJson(it)).toList());
  }

  Observable<PageInfo> getScoreHistory() {
    return rxLoadJson("score_history")
        .map((it) => PageInfo.fromJson(it))
        .doOnData((pageInfo) => pageInfo.listData = pageInfo.listData
            .map((it) => ScoreHistoryInfo.fromJson(it))
            .toList());
  }

  Observable<PageInfo> getOrderList() {
    return rxLoadJson("exchange_history")
        .map((it) => PageInfo.fromJson(it))
        .doOnData((pageInfo) => pageInfo.listData =
            pageInfo.listData.map((it) => ExchangeOrder.fromJson(it)).toList());
  }

  Observable<ExchangeOrder> getOrderDetail() {
    return rxLoadJson("order_detail").map((it) => ExchangeOrder.fromJson(it));
  }

  Observable<ProductDetail> getProductDetail() {
    return rxLoadJson("product_detail").map((it) => ProductDetail.fromJson(it));
  }

}
