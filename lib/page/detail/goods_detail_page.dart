import 'package:challenge_shop/page/success/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GoodsDetailPage extends StatefulWidget {
  static const String routePath = "/shop/goodsDetailPage";

  @override
  State<StatefulWidget> createState() {
    return GoodsDetailPageState();
  }
}

class GoodsDetailPageState extends State<GoodsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        title: Text(
          "兑换",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          height: 49,
          width: double.infinity,
          color: Color(0xff0cc975),
          child: Center(
            child: Text(
              "确认兑换",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: (){

          Navigator.of(context)
              .pushNamed(SuccessPage.routePath);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 230,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    "https://gd2.alicdn.com/imgextra/i1/43828490/O1CN012CaT3zEhKKQrCkR_!!43828490.jpg_400x400.jpg",
                    fit: BoxFit.cover,
                  );
                },
                itemCount: 3,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Color(0xfff5f5f5),
                        activeColor: Color(0xff0CC975))),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 6, 16, 0),
              child: Text(
                "HEROCROSS 蝙超 Q版超合金超人公仔 高14cm可发光可动",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff1C1C1C),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "1000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0CC975),
                              fontSize: 25,
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
                  Text(
                    "剩余335件",
                    style: TextStyle(
                      color: Color(0xffaaaaaa),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 9, bottom: 9),
              child: Text(
                "请填写兑换信息",
                style: TextStyle(fontSize: 12, color: Color(0xff717171)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: TextField(
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration.collapsed(
                  hintText: '收货人',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xffaaaaaa),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 1,
              ),
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: TextField(
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration.collapsed(
                  hintText: '手机号',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xffaaaaaa),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 1,
              ),
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "配送地址",
                      style: TextStyle(
                        color: Color(0xffaaaaaa),
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Color(0xffaaaaaa),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1),
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: TextField(
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration.collapsed(
                  hintText: '详细地址:如街道,小区,门号等',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xffaaaaaa),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "确认兑换后信息将不可以更改\n请核对后兑换哦~",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffaaaaaa),
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
