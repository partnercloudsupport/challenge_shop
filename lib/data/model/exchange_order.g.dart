// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeOrder _$ExchangeOrderFromJson(Map<String, dynamic> json) {
  return ExchangeOrder(
      json['id'] as int,
      json['createTime'] as int,
      json['updateTime'] as int,
      json['statusLabel'] as String,
      json['processStatusLabel'] as String,
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      (json['contact'] as List)
          ?.map((e) =>
              e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['delivery'] as List)
          ?.map((e) =>
              e == null ? null : Delivery.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ExchangeOrderToJson(ExchangeOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'statusLabel': instance.statusLabel,
      'processStatusLabel': instance.processStatusLabel,
      'product': instance.product,
      'contact': instance.contact,
      'delivery': instance.delivery
    };

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(json['label'] as String, json['value'] as String);
}

Map<String, dynamic> _$ContactToJson(Contact instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};

Delivery _$DeliveryFromJson(Map<String, dynamic> json) {
  return Delivery(json['label'] as String, json['value'] as String,
      json['copyable'] as bool);
}

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'copyable': instance.copyable
    };
