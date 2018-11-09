import 'package:challenge_shop/data/model/address_param.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  String baseUrl = "http://challenge.dev.17173.com/api";
  Dio _dio;

  Api(this.baseUrl) {
    Options options = Options(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
//        "Cookie":"1212"
        "Cookie":
            "_UV=1533807234176958; NUV=1533830400000; SUV=1533805983176220729; OKIDEA_AD_BI_COOKIE_ID=56648b15cfef4ba0b2d360d5540779be; gr_user_id=c4ff57bd-8122-4291-bd0f-0a65530e74c0; IPLOC=CN3501; DIFF=1541556635161; ONLINE_TIME=1541556635143; ued_ping_ssid2=153380723417695815415569209169611541556635143|1; ued_ping_tkwww.17173.com=3,1541556638296; ppinf17173=2|1541556647|1|dWlkOjEzMzk1MDgyMXxuaWNrbmFtZTpkb2l0c3NzMTIxfHZlcmlmaWVkOjB8cmVndGltZToxNDgwMzIwMDE4fHVzZXJuYW1lOmExODA0OTQ3OTgyM0AxNzE3My5jb20|2|1; pprdig17173=YBMcNUw22J-8a7bhppcS3ZjeUc2mbnnRRiVyYt0XpdjiY_KIoP15RV7bZ3LOVqTXIYtSn-kPQXO_fJQN0Q0zK7spJdOep4IH06TSPZFnKIlOdruObFY9e_BriTWCnGH4hRSTIaI8iZd_c7z8q5oXF6nR_IdltUuNzBqPCdEQv0k; lastdomain17173=1542766247|MTgwNTA0MDA2NTc=|17173.com; lastuser17173=1542766247|MTMzOTUwODIx|17173.com; ppmdig17173=f6002c5f32b698110eef22017b9703f1; laravel_session=p0lgjffNc2GNkQFIVryC6DNmUYbjdbraSjFrK369"
      },
    );
    _dio = Dio(options);

    _dio.interceptor.response.onSuccess = (Response response) {
      debugPrint(
          "url: ${response?.request?.baseUrl}${response?.request?.path}");
      debugPrint("data: ${response?.request?.data}");
      debugPrint("header: ${response?.request?.headers}");
      debugPrint("response: ${response?.data?.toString()}");
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

  Future<dynamic> doExchange(int productId, Map param) async {
    Response response = await _dio.post(
        "/v2/store/products/${productId}/exchange",
        data: param);
    return response.data;
  }
}
