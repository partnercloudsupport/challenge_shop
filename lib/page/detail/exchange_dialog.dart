import 'package:flutter/material.dart';

class ExchangeDialog extends Dialog {
  int point = 0;
  VoidCallback onomfirm;

  ExchangeDialog(this.point, this.onomfirm);

  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        //保证控件居中效果
        child: new SizedBox(
          width: 300.0,
          height: 140.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "本次兑换将扣除${point}积分哦\n是否确定兑换?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff5f5f5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text("取消",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff717171),
                                fontSize: 15,
                              )),
                        ),
                        width: 90,
                        height: 35,
                      ),
                    ),
                    GestureDetector(
                      onTap: onomfirm,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff0cc975),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        margin: EdgeInsets.only(left: 10),
                        child: Center(
                          child: Text("确定",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                        width: 90,
                        height: 35,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
