import 'package:challenge_shop/data/api.dart';
import 'package:challenge_shop/data/converter/shop_banner_converter.dart';
import 'package:challenge_shop/data/mock_service.dart';
import 'package:challenge_shop/data/model/address_field.dart';
import 'package:challenge_shop/data/model/district.dart';
import 'package:challenge_shop/data/model/exchange_form.dart';
import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/data/model/my_score_info_model.dart';
import 'package:challenge_shop/data/model/page_info.dart';
import 'package:challenge_shop/data/model/product.dart';
import 'package:challenge_shop/data/model/product_detail.dart';
import 'package:challenge_shop/data/model/result.dart';
import 'package:challenge_shop/data/model/score_history_info.dart';
import 'package:challenge_shop/data/viewModel/exchange_form_viewmodel.dart';
import 'package:challenge_shop/data/viewModel/home_page_viewmodel.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:challenge_shop/error/result_error.dart';
import 'package:challenge_shop/error/unlogin_result_error.dart';
import 'package:rxdart/rxdart.dart';

class RemoteService {
  MockService _mockService = MockService();
  Api _api = Api("http://challenge.dev.17173.com/api");

  Observable<ShopBannerViewmodel> getHomeBannerModel() {
    return getMyPoint().zipWith(getLatestExchangeStatus(),
        (myScoreInfoModel, latestExchangeStatusList) {
      return ShopBannerConverter.conver(
          myScoreInfoModel, latestExchangeStatusList);
    });
  }

  Observable<MyScoreInfoModel> getMyPoint() {
    return Observable<Object>.fromFuture(_api.getMyPointInfo()).map((it) {
      return getData(Result.fromJson(it));
    }).map((result) {
      return MyScoreInfoModel.fromJson(result);
    });
  }

  Observable<List<LatestExchangeStatus>> getLatestExchangeStatus() {
    return Observable<Object>.fromFuture(_api.getLatestExchangeStatus())
        .map((it) {
      return getData(Result.fromJson(it));
    }).map((data) {
      return LatestExchangeStatus.getLatestExchangeStatusList(data);
    });
  }

  Observable<PageInfo> getHomeProducts(int pageNum, int pageSize) {
    return Observable<Object>.fromFuture(_api.getProducts(pageNum, pageSize))
        .map((it) => getData(Result.fromJson(it)))
        .map((result) => PageInfo.fromJson(result))
        .doOnData((pageInfo) => pageInfo.listData =
            pageInfo.listData.map((it) => Product.fromJson(it)).toList());
  }

  Observable<HomePageViewmodel> getHomePageViewmodel(
      int pageNum, int pageSize) {
    if (pageNum == 1) {
      return getHomeBannerModel().zipWith(getHomeProducts(pageNum, pageSize),
          (bannermodel, pageInfo) {
        HomePageViewmodel viewmodel = HomePageViewmodel();
        viewmodel.shopBannerViewmodel = bannermodel;
        viewmodel.pageInfo = pageInfo;
        return viewmodel;
      });
    } else {
      return getHomeProducts(pageNum, pageSize).map((pageInfo) {
        HomePageViewmodel viewmodel = HomePageViewmodel();
        viewmodel.pageInfo = pageInfo;
        return viewmodel;
      });
    }
  }

  Observable<ProductDetail> getProductDetail(int productId) {
    return Observable<Object>.fromFuture(_api.getProductDetial(productId))
        .map((it) {
      return getData(Result.fromJson(it));
    }).map((result) {
      return ProductDetail.fromJson(result);
    });
  }

  Observable<PageInfo> getScoreHistory(int pageNum, int pageSize) {
    return Observable<Object>.fromFuture(
            _api.getScoreHistory(pageNum, pageSize))
        .map((it) => getData(Result.fromJson(it)))
        .map((result) => PageInfo.fromJson(result))
        .doOnData((pageInfo) => pageInfo.listData = pageInfo.listData
            .map((it) => ScoreHistoryInfo.fromJson(it))
            .toList());
//    return _mockService.getScoreHistory();
  }

  Observable<PageInfo> getOrderList(int pageNum, int pageSize) {
    return Observable<Object>.fromFuture(
            _api.getExchangeHistory(pageNum, pageSize))
        .map((it) => getData(Result.fromJson(it)))
        .map((result) => PageInfo.fromJson(result))
        .doOnData((pageInfo) => pageInfo.listData =
            pageInfo.listData.map((it) => ExchangeOrder.fromJson(it)).toList());
  }

  Observable<ExchangeOrder> getOrderDetail(orderId) {
    return Observable<Object>.fromFuture(_api.getOrderDetail(orderId))
        .map((it) {
      return getData(Result.fromJson(it));
    }).map((result) {
      return ExchangeOrder.fromJson(result);
    });
  }

  Observable<List<District>> getDistricts() {
    return Observable<Object>.fromFuture(_api.getDistricts())
        .map((it) => getData(Result.fromJson(it)))
        .map((list) => District.getDistrictList(list));
  }

  Observable<ExchangeFormViewmodel> getExchangeForms(int productId) {
    return Observable<Object>.fromFuture(_api.getExchangeForm(productId))
        .map((it) => getData(Result.fromJson(it)))
        .map((list) => ExchangeForm.getExchangeFormList(list))
        .map((exchangeFormList) {
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
    }).onErrorReturn(null);
  }

  Observable<Null> doExchange(int productId, Map param) {
    return Observable<Object>.fromFuture(_api.doExchange(productId, param))
        .map((it) {
      checkSuccess(Result.fromJson(it));
    });
  }

  dynamic getData(Result result) {
    checkSuccess(result);
    return result.data;
  }

  checkSuccess(Result result) {
    if (result.status == 0) {
      return;
    }
    if (result.status == 1002) {
      throw UnLoginResultError(result.status, result.msg);
    } else {
      throw ResultError(result.status, result.msg);
    }
  }
}
