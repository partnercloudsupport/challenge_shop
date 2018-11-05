import 'package:challenge_shop/data/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exchange_order.g.dart';


@JsonSerializable()
class ExchangeOrder extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'updateTime')
  int updateTime;

  @JsonKey(name: 'statusLabel')
  String statusLabel;

  @JsonKey(name: 'processStatusLabel')
  String processStatusLabel;

  @JsonKey(name: 'product')
  Product product;

  @JsonKey(name: 'contact')
  List<Contact> contact;

  @JsonKey(name: 'delivery')
  List<Delivery> delivery;

  ExchangeOrder(this.id,this.createTime,this.updateTime,this.statusLabel,this.processStatusLabel,this.product,this.contact,this.delivery,);

  factory ExchangeOrder.fromJson(Map<String, dynamic> srcJson) => _$ExchangeOrderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExchangeOrderToJson(this);

}




@JsonSerializable()
class Contact extends Object {

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'value')
  String value;

  Contact(this.label,this.value,);

  factory Contact.fromJson(Map<String, dynamic> srcJson) => _$ContactFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

}


@JsonSerializable()
class Delivery extends Object {

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'copyable')
  bool copyable;

  Delivery(this.label,this.value,this.copyable,);

  factory Delivery.fromJson(Map<String, dynamic> srcJson) => _$DeliveryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);

}


