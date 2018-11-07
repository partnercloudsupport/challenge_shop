import 'package:json_annotation/json_annotation.dart';

part 'exchange_form.g.dart';


@JsonSerializable()
class ExchangeForm extends Object {

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'required')
  bool required;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'value')
  dynamic value;

  ExchangeForm(this.label,this.required,this.type,this.name,this.value,);

  factory ExchangeForm.fromJson(Map<String, dynamic> srcJson) => _$ExchangeFormFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExchangeFormToJson(this);

  static List<ExchangeForm> getExchangeFormList(List<dynamic> list) {
    List<ExchangeForm> result = [];
    list.forEach((item) {
      result.add(ExchangeForm.fromJson(item));
    });
    return result;
  }

}
