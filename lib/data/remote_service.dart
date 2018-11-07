import 'package:challenge_shop/data/mock_service.dart';
import 'package:challenge_shop/data/model/district.dart';
import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/data/model/page_info.dart';
import 'package:challenge_shop/data/model/product_detail.dart';
import 'package:challenge_shop/data/viewModel/home_page_viewmodel.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class RemoteService {
  MockService _mockService = MockService();

  Observable<ShopBannerViewmodel> getHomeBannerModel() {
    return _mockService.getHomeBannerModel();
  }

  Observable<PageInfo> getHomeProducts(int pageNum, int pageSize) {
    return _mockService.getHomeProducts();
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

  Observable<List<District>> getDistricts(){
    return _mockService.getDistricts();
  }
}
