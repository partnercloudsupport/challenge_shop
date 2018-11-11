
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
class MockApi {
  Future<String> loadJson(String fileName) async {
    return await rootBundle.loadString("assets/json/${fileName}.json");
  }


  Future<dynamic> getProducts(int pageNum, int pageSize) async {
    String jsonStr=await loadJson("products");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getProductDetial(int productId) async {
    String jsonStr=await loadJson("product_detail");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getScoreHistory(int pageNum, int pageSize) async {
    String jsonStr=await loadJson("score_history");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getExchangeHistory(int pageNum, int pageSize) async {
    String jsonStr=await loadJson("exchange_history");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getOrderDetail(int orderId) async {
    String jsonStr=await loadJson("order_detail");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getMyPointInfo() async {
    String jsonStr=await loadJson("my_score_info");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getDistricts() async {
    String jsonStr=await loadJson("district");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getExchangeForm(int productId) async {
    String jsonStr=await loadJson("exchange_form");
    return  json.decode(jsonStr);
  }

  Future<dynamic> getLatestExchangeStatus() async {
    String jsonStr=await loadJson("latest_exchange_status");
    return  json.decode(jsonStr);
  }

  Future<dynamic> doExchange(int productId, Map param) async {
    String jsonStr=await loadJson("do_post_example");
    return  json.decode(jsonStr);
  }
}