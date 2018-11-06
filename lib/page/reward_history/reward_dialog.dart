import 'package:challenge_shop/data/model/exchange_order.dart';
import 'package:challenge_shop/common/common_tool.dart';
import 'package:challenge_shop/util/time_util.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class RewardDialog extends StatelessWidget {
  ExchangeOrder _exchangeOrder;

  RewardDialog(this._exchangeOrder);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 15,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "详情",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            getGoodsInfoWidget(),
            getContactWidget(),
            Container(
              margin: EdgeInsets.only(top: 20, left: 11, right: 11),
              child: Divider(),
            ),
            getDeliveryWidget(),
            Container(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget getGoodsInfoWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(left: 11, right: 11),
      height: 95,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 11,
            left: 8,
            child: Image.network("${_exchangeOrder?.product?.cover?.url ?? ""}",
                width: 73, height: 73, fit: BoxFit.fill),
          ),
          Positioned(
            top: 8,
            left: 94,
            right: 13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${_exchangeOrder.product.title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "${_exchangeOrder?.product?.point ?? 0}",
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
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 94,
            child: Text(
              "${TimeUtil.getFormatTime1(DateTime.fromMillisecondsSinceEpoch(_exchangeOrder.createTime * 1000))}",
              style: TextStyle(fontSize: 12, color: Color(0xffaaaaaa)),
            ),
          )
        ],
      ),
    );
  }

  Widget getContactWidget() {
    Column column = Column(
      children: <Widget>[],
    );
    _exchangeOrder.contact.forEach((contact) {
      Row r = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16, top: 17),
            child: Text(
              "${contact.label}",
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 17),
              child: Text(
                "${contact.value}",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      );
      column.children.add(r);
    });
    return column;
  }

  Color getSendStatusColor(String status) {
    if (status == "已发货") {
      return Color(0xff0CC975);
    } else if (status == "待发货") {
      return Color(0xffE98943);
    } else {
      return Colors.black;
    }
  }

  Widget getDeliveryWidget() {
    Column column = Column(
      children: <Widget>[],
    );

    Row r = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 90,
          margin: EdgeInsets.only(right: 16, top: 17),
          child: Text(
            "处理状态",
            textAlign: TextAlign.right,
            style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 17),
            child: Text(
              "${_exchangeOrder.statusLabel}",
              style: TextStyle(
                  fontSize: 12,
                  color: getSendStatusColor(_exchangeOrder.statusLabel)),
            ),
          ),
        )
      ],
    );
    column.children.add(r);

    _exchangeOrder.delivery.forEach((delivery) {
      Row r = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 16, top: 17),
            child: Text(
              "${delivery.label}",
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xffaaaaaa), fontSize: 12),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 17),
            child: Text(
              "${delivery.value}",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
          GestureDetector(
            onTap: () {
              showToast("${delivery.label}已经复制到剪贴板",
                  position: ToastPosition.bottom);
              CommonTool.copyToClipboard("${delivery.value}");
            },
            child: Container(
              margin: EdgeInsets.only(top: 16, left: 5),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Text(
                "复制",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      );
      column.children.add(r);
    });
    return column;
  }
}
