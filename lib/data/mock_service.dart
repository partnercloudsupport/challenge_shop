import 'dart:async' show Future;
import 'dart:convert';

import 'package:challenge_shop/data/converter/shop_banner_converter.dart';
import 'package:challenge_shop/data/model/address_field.dart';
import 'package:challenge_shop/data/model/district.dart';
import 'package:challenge_shop/data/model/exchange_form.dart';
import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/data/model/my_score_info_model.dart';
import 'package:challenge_shop/data/model/page_info.dart';
import 'package:challenge_shop/data/model/product.dart';
import 'package:challenge_shop/data/model/product_detail.dart';
import 'package:challenge_shop/data/model/score_history_info.dart';
import 'package:challenge_shop/data/viewModel/exchange_form_viewmodel.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rxdart/rxdart.dart';

class MockService {
  Future<String> loadJson(String fileName) async {
    return await rootBundle.loadString("assets/json/${fileName}.json");
  }

  Observable<Object> rxLoadJson(String fileName) {
    return Observable.timer(Object, Duration(seconds: 2)).flatMap((_) {
      return Observable<Object>.fromFuture(loadJson(fileName));
    }).map((jsonStr) => json.decode(jsonStr));

//    Observable<Object>.fromFuture(loadJson(fileName))
//        .map((jsonStr) => json.decode(jsonStr));
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

  Observable<List<District>> getDistricts() {
    return rxLoadJson("district").map((it) => District.getDistrictList(it));
  }

  Observable<ExchangeFormViewmodel> getExchangeForms() {
    return rxLoadJson("exchange_form").map((it) {
      return ExchangeForm.getExchangeFormList(it);
    }).map((exchangeFormList) {
      ExchangeFormViewmodel viewmodel = ExchangeFormViewmodel();
      viewmodel.valueForms = List();
      exchangeFormList.forEach((exchangeForm) {
        if (exchangeForm.type == "address") {
          AddressField addressField = AddressField.fromJson(exchangeForm.value);
          AddressForm addressForm = AddressForm();
          addressForm.value = addressField;
          addressForm.type = exchangeForm.type;
          addressForm.required = exchangeForm.required;
          addressForm.label = exchangeForm.label;
          addressForm.name = exchangeForm.name;
          viewmodel.addressForm = addressForm;
        } else {
          ValueForm valueForm = ValueForm();
          String value = exchangeForm.value.toString();
          valueForm.value = value;
          valueForm.type = exchangeForm.type;
          valueForm.required = exchangeForm.required;
          valueForm.label = exchangeForm.label;
          valueForm.name = exchangeForm.name;
          viewmodel.valueForms.add(valueForm);
        }
      });
      return viewmodel;
    });
  }
}
