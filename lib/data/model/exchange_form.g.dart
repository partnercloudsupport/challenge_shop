// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeForm _$ExchangeFormFromJson(Map<String, dynamic> json) {
  return ExchangeForm(json['label'] as String, json['required'] as bool,
      json['type'] as String, json['name'] as String, json['value']);
}

Map<String, dynamic> _$ExchangeFormToJson(ExchangeForm instance) =>
    <String, dynamic>{
      'label': instance.label,
      'required': instance.required,
      'type': instance.type,
      'name': instance.name,
      'value': instance.value
    };
