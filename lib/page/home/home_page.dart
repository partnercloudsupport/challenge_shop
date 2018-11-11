import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:challenge_shop/common/refresher_indicator_bulider.dart';
import 'package:challenge_shop/common/state_cover.dart';
import 'package:challenge_shop/data/model/paging_info.dart';
import 'package:challenge_shop/data/model/product.dart';
import 'package:challenge_shop/data/remote_service.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:challenge_shop/eventbus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

import 'goods_cell.dart';
import 'shop_header.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  ShopBannerViewmodel _shopBannerViewmodel;
  List<Product> _datalist;
  PagingInfo _pagingInfo = PagingInfo(1);
  RemoteService _dataService = RemoteService();
  RefreshController _refreshController;
  StateCoverController _stateCoverController;
  StreamSubscription exchangeSuccessSubscription;
  bool isFinish = true;

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

    exchangeSuccessSubscription = eventBus
        .on<ExchangeSuccessEvent>()
        .listen((ExchangeSuccessEvent event) {
      _dataService.getHomeBannerModel().listen((bannermodel) {
        setState(() { 
          _shopBannerViewmodel = bannermodel;
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    exchangeSuccessSubscription.cancel();
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
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
          headerBuilder: RefresherIndicatorBuilder.buildHeader,
          footerBuilder: RefresherIndicatorBuilder.buildFooter,
          enablePullDown: true,
          enablePullUp: !isFinish,
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
                  children: List.generate(_datalist?.length ?? 0, (index) {
                    return GoodsCell(
                        productId: _datalist[index]?.id,
                        score: _datalist[index]?.point,
                        name: _datalist[index]?.title,
                        imgUrl: _datalist[index]?.cover?.thumb,
                        left: _datalist[index]?.inStockQuantity);
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
          if (homePageViewmodel.shopBannerViewmodel != null) {
            _shopBannerViewmodel = homePageViewmodel.shopBannerViewmodel;
          }
          _datalist = homePageViewmodel.pageInfo.listData;
        });
      } else {
        setState(() {
          homePageViewmodel.pageInfo.listData
              .forEach((product) => _datalist.add(product));
        });
      }
      loadDataSuccess(
          _datalist.length ?? 0, homePageViewmodel.pageInfo.totalNum);
    }, onError: (error) {
      debugPrint("${error.toString()}");
      loadDataFail(error);
    });
  }

  loadDataSuccess(int currentCount, int total) {
    setState(() {
      isFinish = currentCount >= total;
    });
    if (currentCount > 0) {
      _stateCoverController.showContent();
    } else {
      _stateCoverController.showEmpty();
    }
    _refreshController.sendBack(true, RefreshStatus.completed);
    if (total <= _datalist.length) {
      _refreshController.sendBack(false, RefreshStatus.noMore);
    } else {
      _refreshController.sendBack(false, RefreshStatus.idle);
    }
    _pagingInfo.addPageNum();
  }

  loadDataFail(Error error) {
    _stateCoverController.showLoadFail();
    showToast("${error.toString()}", position: ToastPosition.bottom);
    if (_pagingInfo.isFirstPage()) {
      _refreshController.sendBack(true, RefreshStatus.idle);
    } else {
      _refreshController.sendBack(false, RefreshStatus.idle);
    }
  }
}
