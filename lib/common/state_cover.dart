import 'package:flutter/material.dart';

class StateCover extends StatefulWidget {
  Widget child;
  StateCoverController controller;

  @override
  State<StatefulWidget> createState() {
    return StateCoverState(controller);
  }

  StateCover({@required this.controller, @required this.child});
}

class StateCoverController {
  ValueNotifier<int> status = ValueNotifier(StateCoverStatus.loading);

  showContent() {
    status.value = StateCoverStatus.content;
  }

  showLoadFail() {
    status.value = StateCoverStatus.loadFail;
  }

  showEmpty() {
    status.value = StateCoverStatus.empty;
  }

  showLoading() {
    status.value = StateCoverStatus.loading;
  }
}

class StateCoverState extends State<StateCover> {
  int status = StateCoverStatus.loading;
  StateCoverController controller;

  StateCoverState(this.controller);

  @override
  void initState() {
    controller.status.addListener(() {
      setState(() {
        status = controller.status.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    StateCoverStatus.reload 是给外部监听的
    switch (status) {
      case StateCoverStatus.content:
        {
          return widget.child;
        }
      case StateCoverStatus.loading:
        {
          return getLoadCover();
        }
      case StateCoverStatus.loadFail:
        {
          return getFailCover();
        }
      case StateCoverStatus.empty:
        {
          return getEmptyCover();
        }
    }

    return Container(child: getLoadCover());
  }

  Widget getLoadCover() {
    return Container(
      color: Color(0xfff5f5f5),
      child: Column(children: [
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Expanded(
          child: Container(),
        )
      ]),
    );
  }

  Widget getEmptyCover() {
    return GestureDetector(
        onTap: () {
          setState(() {
            controller.status.value = StateCoverStatus.reload;
          });
        },
        child: Container(
          color: Color(0xfff5f5f5),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          "assets/imgs/3.0x/ic_cover.png",
                          width: 80,
                          height: 71,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "暂无内容",
                          style:
                              TextStyle(color: Color(0xffaaaaaa), fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ));
  }

  Widget getFailCover() {
    return Container(
      color: Color(0xfff5f5f5),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      "assets/imgs/3.0x/ic_cover.png",
                      width: 80,
                      height: 71,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "加载失败",
                      style: TextStyle(color: Color(0xffaaaaaa), fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class StateCoverStatus {
  static const int reload = -1;
  static const int content = 0;
  static const int loading = 1;
  static const int loadFail = 2;
  static const int empty = 3;
}
