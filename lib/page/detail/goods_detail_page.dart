import 'package:challenge_shop/common/state_cover.dart';
import 'package:challenge_shop/data/model/district.dart';
import 'package:challenge_shop/data/model/product_detail.dart';
import 'package:challenge_shop/data/remote_service.dart';
import 'package:challenge_shop/data/viewModel/product_detail_viewmodel.dart';
import 'package:challenge_shop/page/success/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GoodsDetailPage extends StatefulWidget {
  int _productId;

  GoodsDetailPage(this._productId);

  @override
  State<StatefulWidget> createState() {
    return GoodsDetailPageState();
  }
}

class GoodsDetailPageState extends State<GoodsDetailPage> {
  ProductDetail _productDetail;
  List<District> _districts;
  List<PickerItem> _pickItems;
  RemoteService _dataService = RemoteService();
  StateCoverController _stateCoverController;

  String _districtStr = "配送地址";

  @override
  void initState() {
    _stateCoverController = StateCoverController();
    _stateCoverController.status.addListener(() {
      if (_stateCoverController.status.value == StateCoverStatus.reload) {
        _stateCoverController.status.value = StateCoverStatus.loading;
        getData();
      }
    });
    super.initState();
    getData();
  }

  getData() {
    _dataService
        .getProductDetail(widget._productId)
        .zipWith(_dataService.getDistricts(), (productDetail, districtList) {
      ProductDetailViewmodel viewmodel = ProductDetailViewmodel();
      viewmodel.productDetail = productDetail;
      viewmodel.districts = districtList;
      return viewmodel;
    }).listen((it) {
      setState(() {
        _productDetail = it.productDetail;
        _districts = it.districts;
        _pickItems = [];
        _districts.forEach((district0) {
          PickerItem pi0 = PickerItem(
              text: Text(district0.name), value: district0, children: []);
          district0.children.forEach((district1) {
            PickerItem pi1 = PickerItem(
                text: Text(district1.name), value: district1, children: []);
            pi0.children.add(pi1);

            district1.children.forEach((district2) {
              PickerItem pi2 = PickerItem(
                  text: Text(district2.name), value: district2, children: []);
              pi1.children.add(pi2);
            });
          });
          _pickItems.add(pi0);
        });

        _stateCoverController.status.value = StateCoverStatus.content;
      });
    }, onError: (error) {
      _stateCoverController.status.value = StateCoverStatus.loadFail;
    });
  }

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
        bottomNavigationBar: getButton(),
        body: StateCover(
          controller: _stateCoverController,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getBanner(),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  padding: EdgeInsets.fromLTRB(16, 6, 16, 0),
                  child: Text(
                    "${_productDetail?.title}",
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
                                text: "${_productDetail?.point}",
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
                        "剩余${_productDetail?.inStockQuantity}件",
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
                    enabled:
                        _productDetail?.exchangeStatus?.canExchange ?? false,
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
                    enabled:
                        _productDetail?.exchangeStatus?.canExchange ?? false,
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
                  child: TextField(
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    enabled:
                        _productDetail?.exchangeStatus?.canExchange ?? false,
                    decoration: InputDecoration.collapsed(
                      hintText: '邮编',
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
                    onTap: () {
                      if (_productDetail?.exchangeStatus?.canExchange ??
                          false) {
                        showPicker(context);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        getDistrictText(),
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
                    enabled:
                        _productDetail?.exchangeStatus?.canExchange ?? false,
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
                ),
                Column(
                  children: getOtherFields(),
                ),
              ],
            ),
          ),
        ));
  }

  List<Widget> getOtherFields() {
    List<Widget> list=List();
    return list;
  }

  Widget getButton() {
    if (_stateCoverController.status.value != StateCoverStatus.content) {
      return null;
    }

    if (_productDetail?.exchangeStatus?.canExchange ?? false) {
      return GestureDetector(
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
        onTap: () {
          if (_productDetail?.exchangeStatus?.canExchange ?? false) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return SuccessPage();
            }));
          }
        },
      );
    } else {
      return Container(
        height: 49,
        width: double.infinity,
        color: Color(0xffaaaaaa),
        child: Center(
          child: Text(
            _productDetail?.exchangeStatus?.message ?? "积分不足",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  Widget getBanner() {
    if ((_productDetail?.images?.length ?? 0) == 0) {
      return Container(height: 230);
    } else {
      return Container(
        height: 230,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              "${_productDetail.images[index].url}",
              fit: BoxFit.cover,
            );
          },
          itemCount: _productDetail.images.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  color: Color(0xfff5f5f5), activeColor: Color(0xff0CC975))),
        ),
      );
    }
  }

  showPicker(BuildContext context) {
    Picker picker = new Picker(
        adapter: PickerDataAdapter(data: _pickItems),
        changeToFirst: true,
        hideHeader: true,
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          String districtStr = picker.getSelectedValues().map((district) {
            return (district as District).name;
          }).join(" ");
          setState(() {
            _districtStr = districtStr;
          });

//          print(picker.getSelectedValues().map((district) {
//            return (district as District).id;
//          }));
//          print(value.toString());
//          print(picker.getSelectedValues());
        });
    picker.showDialog(context);
  }

  Text getDistrictText() {
    if (_districtStr == "配送地址") {
      return Text(
        "配送地址",
        style: TextStyle(
          color: Color(0xffaaaaaa),
          fontSize: 15,
        ),
      );
    } else {
      return Text(
        "${_districtStr}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      );
    }
  }
}
