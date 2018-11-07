
import 'package:challenge_shop/data/model/address_field.dart';

class ExchangeFormViewmodel {
  AddressForm addressForm;
  List<ValueForm> valueForms;
}

class ValueForm {
  String label;
  bool required;
  String type;
  String name;
  String value;
}

class AddressForm {
  String label;
  bool required;
  String type;
  String name;
  AddressField value;
}
