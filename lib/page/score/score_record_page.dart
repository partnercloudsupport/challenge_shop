import 'package:after_layout/after_layout.dart';
import 'package:challenge_shop/common/state_cover.dart';
import 'package:challenge_shop/data/model/paging_info.dart';
import 'package:challenge_shop/data/model/score_history_info.dart';
import 'package:challenge_shop/data/remote_service.dart';
import 'package:challenge_shop/page/score/score_overdue_alarm.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'score_record_cell.dart';

class ScoreRecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScoreRecordPageState();
}

class ScoreRecordPageState extends State<ScoreRecordPage>
    with AfterLayoutMixin<ScoreRecordPage> {
  List<ScoreHistoryInfo> _datalist;
  ScoreHistoryNotice scoreHistoryNotice;

  PagingInfo _pagingInfo = PagingInfo(1);
  RemoteService _dataService = RemoteService();
  RefreshController _refreshController;
  StateCoverController _stateCoverController;
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
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _onRefresh(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "积分明细",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: getBody());
  }

  Widget getBody() {
    if (scoreHistoryNotice != null) {
      return StateCover(
          controller: _stateCoverController,
          child: Column(
            children: <Widget>[
              ScoreOverdueAlarm(scoreHistoryNotice),
              Expanded(
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: !isFinish,
                  onRefresh: _onRefresh,
                  controller: _refreshController,
                  child: ListView.builder(
                      itemCount: _datalist?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ScoreRecordCell(_datalist[index]);
                      }),
                ),
              ),
            ],
          ));
    } else {
      return StateCover(
          controller: _stateCoverController,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: !isFinish,
            onRefresh: _onRefresh,
            controller: _refreshController,
            child: ListView.builder(
                itemCount: _datalist?.length ?? 0,
                itemBuilder: (context, index) {
                  return ScoreRecordCell(_datalist[index]);
                }),
          ));
    }
  }

  void _onRefresh(bool up) {
    if (up) {
      _pagingInfo.resetPageNum();
    }
    loadData();
  }

  loadData() {
    _dataService
        .getScoreHistory(_pagingInfo.pageNum, _pagingInfo.pageSize)
        .listen((pageInfo) {
      setState(() {
        if (_pagingInfo.isFirstPage()) {
          _datalist = pageInfo.listData;
          if(pageInfo.extras!=null){
            scoreHistoryNotice=ScoreHistoryNotice(pageInfo.extras["point"],pageInfo.extras["date"]);
          }
        } else {
          pageInfo.listData.forEach((order) => _datalist.add(order));
        }
      });
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
    if (total <= currentCount) {
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
