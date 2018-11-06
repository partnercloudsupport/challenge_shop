import 'package:challenge_shop/common/state_cover.dart';
import 'package:challenge_shop/data/model/paging_info.dart';
import 'package:challenge_shop/data/model/product.dart';
import 'package:challenge_shop/data/remote_service.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

import 'goods_cell.dart';
import 'shop_header.dart';

class HomePage extends StatefulWidget {
  static const String routePath = "/shop/homePage";

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ShopBannerViewmodel _shopBannerViewmodel;
  List<Product> _products;
  PagingInfo _pagingInfo = PagingInfo(1);
  RemoteService _dataService = RemoteService();
  RefreshController _refreshController;
  StateCoverController _stateCoverController;

  @override
  void initState() {
    _refreshController = RefreshController();
    _stateCoverController = StateCoverController();
    _stateCoverController.status.addListener(() {
      if (_stateCoverController.status.value == StateCoverStatus.reload) {
        _stateCoverController.status.value = StateCoverStatus.loading;
        _onRefresh(true);
      }
    });
    super.initState();
    _onRefresh(true);
  }

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
      body: StateCover(
        controller: _stateCoverController,
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          controller: _refreshController,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(child: ShopHeader(_shopBannerViewmodel)),
              SliverSafeArea(
                minimum: const EdgeInsets.all(10.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 0.73,
                  crossAxisSpacing: 4.0,
                  children: List.generate(_products?.length ?? 0, (index) {
                    return GoodsCell(
                        score: _products[index]?.point,
                        name: _products[index]?.title,
                        imgUrl: _products[index]?.cover?.url,
                        left: _products[index]?.inStockQuantity);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRefresh(bool up) {
    if (up) {
      _pagingInfo.resetPageNum();
    }
    loadData();
  }

  loadData() {
    _dataService
        .getHomePageViewmodel(_pagingInfo.pageNum, _pagingInfo.pageSize)
        .listen((homePageViewmodel) {
      if (_pagingInfo.isFirstPage()) {
        setState(() {
          _shopBannerViewmodel = homePageViewmodel.shopBannerViewmodel;
          _products = homePageViewmodel.pageInfo.listData;
        });
      } else {
        setState(() {
          homePageViewmodel.pageInfo.listData
              .forEach((product) => _products.add(product));
        });
      }
      loadDataSuccess(
          _products.length ?? 0, homePageViewmodel.pageInfo.totalNum);
    }, onError: (error) {
      showToast("${error.toString()}", position: ToastPosition.bottom);
    });
  }

  loadDataSuccess(int currentCount, int total) {
    if (currentCount > 0) {
      _stateCoverController.showContent();
    } else {
      _stateCoverController.showEmpty();
    }
    _refreshController.sendBack(true, RefreshStatus.completed);
    if (total <= _products.length) {
      _refreshController.sendBack(false, RefreshStatus.noMore);
    } else {
      _refreshController.sendBack(false, RefreshStatus.idle);
    }
    _pagingInfo.addPageNum();
  }

  loadDataFail(Error error) {
    showToast("${error.toString()}", position: ToastPosition.bottom);
    if (_pagingInfo.isFirstPage()) {
      _refreshController.sendBack(true, RefreshStatus.idle);
    } else {
      _refreshController.sendBack(false, RefreshStatus.idle);
    }
  }
}
