import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {

  static const String routePath="/shop/successPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
//        backgroundColor: Colors.white,
        title: Text(
          "兑换",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: Image.asset(
                "assets/imgs/3.0x/ic_success.png",
                width: 150,
                height: 125,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "兑换成功!!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 14),
            child: Text(
              "-100",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(top: 32, left: 25, right: 25),
            color: Color(0xffe5e5e5),
          ),
          Container(
            padding: EdgeInsets.only(top: 21),
            child: Text(
              "商品将在7个工作日内发货\n可在商城-兑换记录中查看兑换详情\n如有疑问，请联系客服",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffAAAAAA),
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 48),
            width: 125,
            height: 42,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0CC975), width: 1),
                borderRadius: BorderRadius.circular(21)),
            child: MaterialButton(
              onPressed: ()=>Navigator.pop(context),
              splashColor: Colors.transparent,
              child: const Text(
                '返回商城',
                style: TextStyle(
                  color: Color(0xff0CC975),
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
