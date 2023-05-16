import 'package:rms_terminal_sdk/src/config.dart';
import 'package:rms_terminal_sdk/src/field_data/field_data_decode.dart';

class TerminalDecode extends TerminalConfig {
  List<int> codes;

  TerminalDecode({
    required this.codes,
  });
  // Format
  List<String> get codesHex => codes.map((e) => numberToHex(e)).toList();
  // Basic
  String get codesStartKey => codesHex[0];
  String get codesEndKey => codesHex[codesHex.length - 2];
  String get codesLrcKey => codesHex[codesHex.length - 1];
  int get codesLength => int.parse(([codesHex[1], codesHex[2]].map((e) => e.replaceAll('0x', '')).join("")));
  // Validation
  List<String> get codesLrcMessage => codesHex.sublist(1, codesHex.length - 1);
  bool get startKeyVal => startKey == codesStartKey;
  bool get endKeyVal => endKey == codesEndKey;
  bool get lengthVal => codesLength == (codesHex.length - 5);

  bool get lrcVal => generateLrc(codesLrcMessage) == codesLrcKey;

  FieldDatasDecode get fieldDatas => FieldDatasDecode(code: codesHex);

  bool validation() {
    if (startKeyVal && endKeyVal && lengthVal && lrcVal) {
      return true;
    }
    return false;
  }
}
