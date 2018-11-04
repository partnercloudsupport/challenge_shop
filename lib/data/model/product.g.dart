// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
      json['id'] as int,
      json['title'] as String,
      json['point'] as int,
      json['inStockQuantity'] as int,
      json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'point': instance.point,
      'inStockQuantity': instance.inStockQuantity,
      'cover': instance.cover
    };

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover(
      json['fileType'] as String,
      json['thumb'] as String,
      json['height'] as int,
      json['width'] as int,
      json['url'] as String,
      json['original'] as String);
}

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'fileType': instance.fileType,
      'thumb': instance.thumb,
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
      'original': instance.original
    };
