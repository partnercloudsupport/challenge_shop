import 'dart:async';

import 'package:challenge_shop/data/mock_service.dart';
import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/eventbus/event_bus.dart';
import 'package:challenge_shop/page/reward_history/reward_dialog.dart';
import 'package:flutter/material.dart';

import 'reward_record_cell.dart';

class RewardHistoryPage extends StatefulWidget {
  static const String routePath = "/shop/rewardHistoryPage";

  @override
  State<StatefulWidget> createState() => RewardHistoryPageState();
}

class RewardHistoryPageState extends State<RewardHistoryPage> {
  MockService _mockService = MockService();
  List<ExchangeOrder> orderList;
  StreamSubscription busSubscription;

  @override
  void initState() {
    super.initState();
    _mockService.getOrderList().listen((pageInfo) {
      setState(() {
        orderList = pageInfo.listData;
      });
    }, onError: (error) {});

    busSubscription = eventBus
        .on<ProductOrderClickEvent>()
        .listen((ProductOrderClickEvent event) {
      showDetailDialog(event.orderId);
    });
  }

  void showDetailDialog(int orderId) {
    _mockService.getOrderDetail().listen((order) {
      setState(() {
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
      });
    }, onError: (error) {});
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
      body: ListView.builder(
        itemCount: orderList?.length ?? 0,
        itemBuilder: (context, index) {
          return RewardRecordCell(orderList[index]);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    busSubscription.cancel();
  }
}
