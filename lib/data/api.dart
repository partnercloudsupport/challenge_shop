import 'package:challenge_shop/data/model/address_param.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  String baseUrl = "http://challenge.dev.17173.com/api";
  Dio _dio;

  Api(this.baseUrl) {
    Options options =
        Options(baseUrl: baseUrl, connectTimeout: 5000, receiveTimeout: 3000);
    _dio = Dio(options);

    _dio.interceptor.response.onSuccess = (Response response) {
      debugPrint("url: ${response?.request?.baseUrl}${response?.request?.path}\n");
      debugPrint("data: ${response?.request?.data}\n");
      debugPrint("header: ${response?.request?.headers}\n");
      debugPrint("response: ${response?.data?.toString()}\n");
      return response;
    };

    _dio.interceptor.response.onError = (DioError e) {
      debugPrint(e?.toString());
      return e;
    };
  }

  Future<dynamic> getProducts(int pageNum, int pageSize) async {
    Response response = await _dio.get("/v2/store/products",
        data: {"pageNum": pageNum, "pageSize": pageSize});
    return response.data;
  }

  Future<dynamic> getProductDetial(int productId) async {
    Response response = await _dio.get("/v2/store/products/${productId}");
    return response.data;
  }

  Future<dynamic> getScoreHistory(int pageNum, int pageSize) async {
    Response response = await _dio.get("/v2/store/user/point-history",
        data: {"pageNum": pageNum, "pageSize": pageSize});
    return response.data;
  }

  Future<dynamic> getExchangeHistory(int pageNum, int pageSize) async {
    Response response = await _dio.get("/v2/store/user/point-exchange-history",
        data: {"pageNum": pageNum, "pageSize": pageSize});
    return response.data;
  }

  Future<dynamic> getOrderDetail(int orderId) async {
    Response response = await _dio.get("/v2/store/orders/${orderId}");
    return response.data;
  }

  Future<dynamic> getMyPointInfo() async {
    Response response = await _dio.get("/v2/store/user/point-status");
    return response.data;
  }

  Future<dynamic> getDistricts() async {
    Response response = await _dio.get("/v2/store/districts");
    return response.data;
  }

  Future<dynamic> getExchangeForm(int productId) async {
    Response response =
        await _dio.get("/v2/store/products/${productId}/exchange-form");
    return response.data;
  }

  Future<dynamic> doExchange(int productId, AddressParam addressParam) async {
    Response response = await _dio
        .post("/v2/store/products/${productId}/exchange-form", data: addressParam);
    return response.data;
  }
}
