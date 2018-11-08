import 'package:challenge_shop/common/state_cover.dart';
import 'package:challenge_shop/data/model/address_param.dart';
import 'package:challenge_shop/data/model/district.dart';
import 'package:challenge_shop/data/model/product_detail.dart';
import 'package:challenge_shop/data/remote_service.dart';
import 'package:challenge_shop/data/viewModel/exchange_form_viewmodel.dart';
import 'package:challenge_shop/data/viewModel/product_detail_viewmodel.dart';
import 'package:challenge_shop/page/detail/exchange_dialog.dart';
import 'package:challenge_shop/page/success/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';

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
  ExchangeFormViewmodel _exchangeFormViewmodel;
  int _provinceId = 0;
  int _cityId = 0;
  int _areaId = 0;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  List<TextEditingController> otherControllers = List();
  Picker _picker;

//  List<>

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
    }).zipWith(_dataService.getExchangeForms(),
            (productDetailViewmodel, exchangeFormViewmodel) {
      productDetailViewmodel.exchangeFormViewmodel = exchangeFormViewmodel;
      return productDetailViewmodel;
    }).listen((it) {
      setState(() {
        _exchangeFormViewmodel = it.exchangeFormViewmodel;
        initForms();
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

        _picker = new Picker(
            adapter: PickerDataAdapter(data: _pickItems),
            changeToFirst: true,
            hideHeader: true,
            textAlign: TextAlign.left,
            columnPadding: const EdgeInsets.all(8.0),
            onConfirm: (Picker picker, List value) {
              String districtStr = picker.getSelectedValues().map((district) {
                return (district as District).name;
              }).join(" ");

              List<int> ids = picker.getSelectedValues().map((district) {
                return (district as District).id;
              }).toList();

              _provinceId = ids[0];
              _cityId = ids[1];
              _areaId = ids[2];

              setState(() {
                _districtStr = districtStr;
              });
            });
      });
    }, onError: (error) {
      debugPrint("${error.toString()}");
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
                    controller: _userNameController,
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
                    controller: _telController,
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
                    controller: _postalCodeController,
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
                    controller: _addressController,
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
                Column(
                  children: getOtherFields(),
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
              ],
            ),
          ),
        ));
  }

  List<Widget> getOtherFields() {
    List<Widget> list = List();
    _exchangeFormViewmodel?.valueForms?.forEach((valueForm) {
      int index = _exchangeFormViewmodel.valueForms.indexOf(valueForm);
      list.add(getField(valueForm, otherControllers[index]));
    });
    return list;
  }

  Widget getField(ValueForm valueForm, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 15, color: Colors.black),
        enabled: _productDetail?.exchangeStatus?.canExchange ?? false,
        decoration: InputDecoration.collapsed(
          hintText: '${valueForm.label}',
          hintStyle: TextStyle(
            fontSize: 15,
            color: Color(0xffaaaaaa),
          ),
        ),
      ),
    );
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
            submit();
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

  checkCanSubmit() {
    if (_userNameController.text.isEmpty) {
      showToast("收货人不可为空", position: ToastPosition.bottom);
      return false;
    }
    if (_telController.text.isEmpty) {
      showToast("手机号不可为空", position: ToastPosition.bottom);
      return false;
    }
    if (_postalCodeController.text.isEmpty) {
      showToast("邮政编码不可为空", position: ToastPosition.bottom);
      return false;
    }
    if (_addressController.text.isEmpty) {
      showToast("详细地址不可为空", position: ToastPosition.bottom);
      return false;
    }
    if (_districtStr.replaceAll(" ", "").isEmpty) {
      showToast("必须选择配送地址", position: ToastPosition.bottom);
      return false;
    }
    bool b = !_exchangeFormViewmodel?.valueForms?.any((valueForm) {
      int index = _exchangeFormViewmodel.valueForms.indexOf(valueForm);
      TextEditingController controller = otherControllers[index];
      if (controller.text.isEmpty && valueForm.required) {
        showToast("${valueForm.label}不可为空", position: ToastPosition.bottom);
        return true;
      }
      return false;
    });

    return b;
  }

  submit() {
    if (!checkCanSubmit()) {
      return;
    }
    AddressParam addressParam = AddressParam();
    addressParam.detailInfo = _addressController.text;
    addressParam.postalCode = _postalCodeController.text;
    addressParam.telNumber = _telController.text;
    addressParam.userName = _userNameController.text;
    addressParam.provinceId = _provinceId;
    addressParam.cityId = _cityId;
    addressParam.areaId = _areaId;

    Map params = Map();
    params["address"] = addressParam.toJson();
    _exchangeFormViewmodel.valueForms.forEach((valueForm) {
      int index = _exchangeFormViewmodel.valueForms.indexOf(valueForm);
      TextEditingController controller = otherControllers[index];
      params["${valueForm.name}"] = controller.text;
    });
    print(params.toString());

    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ExchangeDialog(_productDetail.point, () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) {
                  return SuccessPage(_productDetail.point);
                },
              ),
            );
          });
        });
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
    _picker.showDialog(context);
  }

  Text getDistrictText() {
    if (_districtStr == "配送地址" || _districtStr.replaceAll(" ", "") == "") {
      _districtStr = "";
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

  void initForms() {
    _provinceId = _exchangeFormViewmodel?.addressForm?.value?.provinceId;
    _cityId = _exchangeFormViewmodel?.addressForm?.value?.cityId;
    _areaId = _exchangeFormViewmodel?.addressForm?.value?.areaId;

    _userNameController.text =
        _exchangeFormViewmodel?.addressForm?.value?.userName ?? "";
    _telController.text =
        _exchangeFormViewmodel?.addressForm?.value?.telNumber ?? "";
    _postalCodeController.text =
        _exchangeFormViewmodel?.addressForm?.value?.postalCode ?? "";
    _addressController.text =
        _exchangeFormViewmodel?.addressForm?.value?.detailInfo ?? "";
    _districtStr =
        "${_exchangeFormViewmodel?.addressForm?.value?.provinceName ?? ""} ${_exchangeFormViewmodel?.addressForm?.value?.cityName ?? ""} ${_exchangeFormViewmodel?.addressForm?.value?.areaName ?? ""} ";

    otherControllers.clear();
    _exchangeFormViewmodel?.valueForms?.forEach((valueForm) {
      TextEditingController controller = TextEditingController();
      controller.text = valueForm.value ?? "";
      otherControllers.add(controller);
    });
  }
}
