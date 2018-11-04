import 'package:challenge_shop/page/detail/goods_detail_page.dart';
import 'package:flutter/material.dart';

class GoodsCell extends StatelessWidget {
  final String imgUrl;
  final String name;
  final int score;
  final int left;

  const GoodsCell({this.score, this.name, this.imgUrl, this.left});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(GoodsDetailPage.routePath);
        },
        child: Card(
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(imgUrl ?? "", fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  this.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "${this.score}",
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
                    Text(
                      "剩余${this.left}件",
                      style: TextStyle(color: Color(0xffAAAAAA), fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

//Center(
//child: Card(
//child: AspectRatio(
//aspectRatio: 0.73,
//child: Image.network(imgUrl, fit: BoxFit.fill),
//),
//),
//);
