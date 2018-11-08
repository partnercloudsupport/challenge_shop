import 'dart:async';

import 'package:challenge_shop/common/loading_dialog.dart';
import 'package:challenge_shop/common/state_cover.dart';
import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/data/model/paging_info.dart';
import 'package:challenge_shop/data/remote_service.dart';
import 'package:challenge_shop/eventbus/event_bus.dart';
import 'package:challenge_shop/page/reward_history/reward_dialog.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:after_layout/after_layout.dart';
import 'reward_record_cell.dart';

class RewardHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RewardHistoryPageState();
}

class RewardHistoryPageState extends State<RewardHistoryPage> with AfterLayoutMixin<RewardHistoryPage> {
  PagingInfo _pagingInfo = PagingInfo(1);
  RemoteService _dataService = RemoteService();
  RefreshController _refreshController;
  StateCoverController _stateCoverController;
  List<ExchangeOrder> _datalist;
  StreamSubscription busSubscription;
  bool isFinish = true;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _stateCoverController = StateCoverController();
    _stateCoverController.status.addListener(() {
      if (_stateCoverController.status.value == StateCoverStatus.reload) {
        _stateCoverController.status.value = StateCoverStatus.loading;
        _onRefresh(true);
      }
    });

    busSubscription = eventBus
        .on<ProductOrderClickEvent>()
        .listen((ProductOrderClickEvent event) {
      showDetailDialog(event.orderId);
    });
  }


  @override
  void afterFirstLayout(BuildContext context) {
    _onRefresh(true);
  }


  void showDetailDialog(int orderId) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog();
        });

    _dataService.getOrderDetail(orderId).listen((order) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, state) {
              return RewardDialog(order);
            },
          );
        },
      );
    }, onError: (error) {
      Navigator.pop(context);
      debugPrint("${error.toString()}");
      showToast("${error.toString()}", position: ToastPosition.bottom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: Text(
            "兑换记录",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: StateCover(
            controller: _stateCoverController,
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: !isFinish,
              onRefresh: _onRefresh,
              controller: _refreshController,
              child: ListView.builder(
                itemCount: _datalist?.length ?? 0,
                itemBuilder: (context, index) {
                  return RewardRecordCell(_datalist[index]);
                },
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    busSubscription.cancel();
  }

  void _onRefresh(bool up) {
    if (up) {
      _pagingInfo.resetPageNum();
    }
    loadData();
  }

  loadData() {
    _dataService.getOrderList(_pagingInfo.pageNum, _pagingInfo.pageSize).listen(
        (pageInfo) {
      if (_pagingInfo.isFirstPage()) {
        setState(() {
          _datalist = pageInfo.listData;
        });
      } else {
        setState(() {
          pageInfo.listData.forEach((order) => _datalist.add(order));
        });
      }
      loadDataSuccess(_datalist.length ?? 0, pageInfo.totalNum);
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
