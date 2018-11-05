// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return ProductDetail(
      json['id'] as int,
      json['title'] as String,
      json['point'] as int,
      json['inStockQuantity'] as int,
      (json['images'] as List)
          ?.map((e) =>
              e == null ? null : Images.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['exchangeStatus'] == null
          ? null
          : ExchangeStatus.fromJson(
              json['exchangeStatus'] as Map<String, dynamic>),
      json['kindLabel'] as String);
}

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'point': instance.point,
      'inStockQuantity': instance.inStockQuantity,
      'images': instance.images,
      'exchangeStatus': instance.exchangeStatus,
      'kindLabel': instance.kindLabel
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
      json['fileType'] as String,
      json['thumb'] as String,
      json['height'] as int,
      json['width'] as int,
      json['url'] as String,
      json['original'] as String);
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'fileType': instance.fileType,
      'thumb': instance.thumb,
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
      'original': instance.original
    };

ExchangeStatus _$ExchangeStatusFromJson(Map<String, dynamic> json) {
  return ExchangeStatus(json['canExchange'] as bool, json['message'] as String,
      json['type'] as String);
}

Map<String, dynamic> _$ExchangeStatusToJson(ExchangeStatus instance) =>
    <String, dynamic>{
      'canExchange': instance.canExchange,
      'message': instance.message,
      'type': instance.type
    };
