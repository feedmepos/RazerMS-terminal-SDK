import 'package:rms_terminal_sdk/src/field_data/field_data_config.dart';

class FieldData extends FieldDataConfig {
  FieldName name;

  FieldData({
    required this.name,
  });

  String get code {
    final code = fieldList.firstWhere((element) => element.name == name).code;
    return code;
  }

  int? get length {
    final length =
        fieldList.firstWhere((element) => element.name == name).length;
    return length;
  }

  List<String> fieldData(String data) {
    if (data.length != length) throw "Invalid Length";
    return [
      ...utfToHexList(code),
      '0x00',
      stringToHex(length.toString()),
      ...utfToHexList(data),
      separatorKey
    ];
  }
}
