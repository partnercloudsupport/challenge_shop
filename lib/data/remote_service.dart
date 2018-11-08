import 'package:challenge_shop/data/api.dart';
import 'package:challenge_shop/data/converter/shop_banner_converter.dart';
import 'package:challenge_shop/data/mock_service.dart';
import 'package:challenge_shop/data/model/district.dart';
import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/data/model/page_info.dart';
import 'package:challenge_shop/data/model/product.dart';
import 'package:challenge_shop/data/model/product_detail.dart';
import 'package:challenge_shop/data/model/result.dart';
import 'package:challenge_shop/data/viewModel/exchange_form_viewmodel.dart';
import 'package:challenge_shop/data/viewModel/home_page_viewmodel.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:challenge_shop/error/result_error.dart';
import 'package:rxdart/rxdart.dart';

class RemoteService {
  MockService _mockService = MockService();
  Api _api = Api("http://challenge.dev.17173.com/api");

  Observable<ShopBannerViewmodel> getHomeBannerModel() {
//   return Observable<Object>.fromFuture(_api.getMyPointInfo())
//        .map((it) => Result.fromJson(it))
//        .map((result) => MyScoreInfoModel.fromJson(getData(result)))
//        .map(
//            (myScoreInfoModel) => ShopBannerConverter.conver(myScoreInfoModel));

    return _mockService.getHomeBannerModel().map(ShopBannerConverter.conver);
  }

  Observable<PageInfo> getHomeProducts(int pageNum, int pageSize) {
    return Observable<Object>.fromFuture(_api.getProducts(pageNum,pageSize))
        .map((it) => getData(Result.fromJson(it)))
        .map((result) => PageInfo.fromJson(result))
        .doOnData((pageInfo) => pageInfo.listData =
            pageInfo.listData.map((it) => Product.fromJson(it)).toList());

    //return _mockService.getHomeProducts();
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
    return _mockService.getProductDetail();
  }

  Observable<PageInfo> getScoreHistory(int pageNum, int pageSize) {
    return _mockService.getScoreHistory();
  }

  Observable<PageInfo> getOrderList(int pageNum, int pageSize) {
    return _mockService.getOrderList();
  }

  Observable<ExchangeOrder> getOrderDetail(orderId) {
    return _mockService.getOrderDetail();
  }

  Observable<List<District>> getDistricts() {
    return _mockService.getDistricts();
  }

  Observable<ExchangeFormViewmodel> getExchangeForms() {
    return _mockService.getExchangeForms();
  }

  dynamic getData(Result result) {
    if (result.status == 0) {
      return result.data;
    } else {
      throw ResultError(result.status, result.msg);
    }
  }
}
