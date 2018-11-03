import 'dart:async' show Future;
import 'dart:convert';

import 'package:challenge_shop/data/model/my_score_info_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rxdart/rxdart.dart';

Future<String> loadJson(String fileName) async {
  return await rootBundle.loadString("assets/json/${fileName}");
}

Observable<Object> rxLoadJson(String fileName) {
  return Observable<Object>.fromFuture(loadJson(fileName)).map((jsonStr) {
    json.decode(jsonStr);
  });
}

//Observable<HomeBannerModel> getHomeBannerModel() {
//  return rxLoadJson("my_score_info").map((obj) {
//    HomeBannerModel.fromJson(obj);
//  });
//}
