import 'package:rms_terminal_sdk/src/field_data/field_data_config.dart';

class FieldDateResponse {
  FieldName name;
  String message;

  FieldDateResponse({
    required this.name,
    required this.message,
  });
}

class FieldDataDecode extends FieldDataConfig {
  List<String> code;

  FieldDataDecode({
    required this.code,
  });

  FieldName get fieldName {
    final nameList = hexListToUtf(code.sublist(0, 2));
    return byCode(nameList);
  }

  String get fieldMessage {
    try {
      if (fieldName == FieldName.unknown) {
        return "";
      } else {
        final messageList = code.sublist(4, code.length - 1);
        return hexListToUtf(messageList);
      }
    } catch (err) {
      return "";
    }
  }

  FieldDateResponse get response =>
      FieldDateResponse(name: fieldName, message: fieldMessage);
}

class FieldDatasDecode extends FieldDataConfig {
  List<String> code;

  FieldDatasDecode({
    required this.code,
  });

  List<String> get fieldData => code.sublist(21, code.length - 2);
  List<List<String>> get grouped => splitFieldDatas(fieldData);
  List<FieldDateResponse> get reponses =>
      grouped.map((e) => FieldDataDecode(code: e).response).toList();

  List<List<String>> splitFieldDatas(List<String> data) {
    List<List<String>> result = [];
    List<String> temp = [];
    for (var i = 0; i < data.length; i++) {
      temp.add(data[i]);
      if (data[i] == separatorKey) {
        result.add(temp);
        temp = [];
      }
    }
    return result;
  }
}
