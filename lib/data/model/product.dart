import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';


@JsonSerializable()
class Product extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'point')
  int point;

  @JsonKey(name: 'inStockQuantity')
  int inStockQuantity;

  @JsonKey(name: 'cover')
  Cover cover;

  Product(this.id,this.title,this.point,this.inStockQuantity,this.cover,);

  factory Product.fromJson(Map<String, dynamic> srcJson) => _$ProductFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}


@JsonSerializable()
class Cover extends Object {

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

  Cover(this.fileType,this.thumb,this.height,this.width,this.url,this.original,);

  factory Cover.fromJson(Map<String, dynamic> srcJson) => _$CoverFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoverToJson(this);

}


