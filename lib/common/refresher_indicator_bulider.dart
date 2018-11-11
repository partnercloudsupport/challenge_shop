import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefresherIndicatorBuilder {
  static Widget buildHeader(context, mode) {
    return new ClassicIndicator(
      mode: mode,
      releaseText: "释放刷新",
      refreshingText: "正在加载...",
      completeText: "加载完毕",
      noDataText: "下面没有了...",
      failedText: "加载失败",
      idleText: "下拉刷新",
    );
  }
  static Widget buildFooter(context, mode) {
    return new ClassicIndicator(
      mode: mode,
      releaseText: "释放刷新",
      refreshingText: "正在加载...",
      completeText: "加载完毕",
      noDataText: "下面没有了...",
      failedText: "加载失败",
      idleText: "下拉刷新",
    );
  }
}
//
//this.releaseText: 'Refresh when release',
//this.refreshingText: 'Refreshing...',
//this.completeText: 'Refresh complete',
//this.noDataText: 'No more data',
//this.failedText: 'Refresh failed',
//this.idleText: 'Pull down to refresh',
