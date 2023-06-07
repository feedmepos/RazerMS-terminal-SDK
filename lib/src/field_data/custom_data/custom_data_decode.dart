import '../field_data.dart';

class CustomDecode extends CustomDataConfig {
  List<String> codes;

  CustomDecode({
    required this.codes,
  });

  Tag get tag {
    try {
      final key = '0x${codes.sublist(0, 2).map((e) => hexToString(e)).join()}';
      return byKey(key);
    } catch (err) {
      return Tag(key: "Unknown", remark: "Unknown");
    }
  }

  String get key => tag.key;

  String get remark => tag.remark;

  String get message {
    try {
      final messageList = codes.sublist(3, codes.length);
      return hexListToUtf(messageList);
    } catch (err) {
      return "";
    }
  }

  String get response => '$key: $remark - $message';
}

class CustomDataDecode extends CustomDataConfig {
  List<String> codes;

  CustomDataDecode({
    required this.codes,
  });

  List<List<String>> get grouped => splitCustomData(codes);

  String get reponses =>
      grouped.map((e) => CustomDecode(codes: e).response).toList().join(" | ");

  List<List<String>> splitCustomData(List<String> data) {
    List<List<String>> result = [];
    var i = 0;
    while (i < data.length) {
      int length = hexLength([data[i + 2]]) + 3;
      result.add(data.sublist(i, i + length));
      i += length;
    }
    return result;
  }
}
