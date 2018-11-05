import 'package:json_annotation/json_annotation.dart';

part 'product_detail.g.dart';


@JsonSerializable()
class ProductDetail extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'point')
  int point;

  @JsonKey(name: 'inStockQuantity')
  int inStockQuantity;

  @JsonKey(name: 'images')
  List<Images> images;

  @JsonKey(name: 'exchangeStatus')
  ExchangeStatus exchangeStatus;

  @JsonKey(name: 'kindLabel')
  String kindLabel;

  ProductDetail(this.id,this.title,this.point,this.inStockQuantity,this.images,this.exchangeStatus,this.kindLabel,);

  factory ProductDetail.fromJson(Map<String, dynamic> srcJson) => _$ProductDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);

}


@JsonSerializable()
class Images extends Object {

  @JsonKey(name: 'fileType')
  String fileType;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'original')
  String original;

  Images(this.fileType,this.thumb,this.height,this.width,this.url,this.original,);

  factory Images.fromJson(Map<String, dynamic> srcJson) => _$ImagesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

}


@JsonSerializable()
class ExchangeStatus extends Object {

  @JsonKey(name: 'canExchange')
  bool canExchange;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'type')
  String type;

  ExchangeStatus(this.canExchange,this.message,this.type,);

  factory ExchangeStatus.fromJson(Map<String, dynamic> srcJson) => _$ExchangeStatusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExchangeStatusToJson(this);

}


