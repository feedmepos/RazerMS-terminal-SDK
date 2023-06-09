import 'package:rms_terminal_sdk/src/config.dart';
import 'package:rms_terminal_sdk/src/field_data/field_data_decode.dart';
import 'package:rms_terminal_sdk/src/presentation_header/presentation_header.dart';

class TerminalDecode extends TerminalConfig {
  List<int> codes;

  TerminalDecode({
    required this.codes,
  });

  // Format
  List<String> get codesHex => codes.map((e) => numberToHex(e)).toList();

  bool get isAck {
    return codes.length == 1 && codesHex.first == ackKey;
  }

   bool get isNack {
    return codesHex.length == 1 && codesHex.first == nackKey;
  }

  // Basic
  String get codesStartKey => codesHex[0];
  String get codesEndKey => codesHex[codesHex.length - 2];
  String get codesLrcKey => codesHex[codesHex.length - 1];
  int get codesLength => hexLength([codesHex[1], codesHex[2]]);
  // Validation
  bool get startKeyVal => startKey == codesStartKey;
  bool get endKeyVal => endKey == codesEndKey;
  bool get lengthVal => codesLength == (codesHex.length - 5);
  List<String> get codesLrcMessage => codesHex.sublist(1, codesHex.length - 1);
  bool get lrcVal => generateLrc(codesLrcMessage) == codesLrcKey;

  PresentationHeaderDecode get presentationHeader => PresentationHeaderDecode(codes: codesHex);

  FieldDataDecode get fieldDatas => FieldDataDecode(codes: codesHex);

  FieldDateResponseFormat get response => fieldDatas.format;

  bool validation() {
    if (startKeyVal && endKeyVal && lengthVal && lrcVal) {
      return true;
    }
    return false;
  }
}
