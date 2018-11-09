import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/eventbus/event_bus.dart';
import 'package:challenge_shop/util/time_util.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class RewardRecordCell extends StatelessWidget {
  ExchangeOrder order;

  RewardRecordCell(this.order);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        eventBus.fire(ProductOrderClickEvent(order.id));
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 28,
            color: Color(0xfff5f5f5),
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${TimeUtil.getFormatTime1(DateTime.fromMillisecondsSinceEpoch(order?.createTime * 1000))}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffaaaaaa),
                  ),
                ),
                Text(
                  "${order.statusLabel ?? ""}",
                  style: TextStyle(
                    fontSize: 12,
                    color: getStatusColor(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 104,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Image.network(
                    "${order?.product?.cover?.thumb ?? ""}",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${order?.product?.title ?? ""}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${order?.product?.point ?? 0}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0CC975),
                                    fontSize: 21,
                                  )),
                              TextSpan(
                                  text: '积分',
                                  style: TextStyle(
                                    color: Color(0xff0CC975),
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Icon(
                    Icons.navigate_next,
                    color: Color(0xffc3c3c3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getStatusColor() {
    if (order.statusLabel == "未发货") {
      return Color(0xffE98943);
    } else {
      return Colors.black;
    }
  }
}
