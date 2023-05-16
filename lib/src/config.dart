import 'dart:convert';
import 'dart:typed_data';

class TerminalConfig {
  String startKey = '0x02';
  String endKey = '0x03';
  String ackKey = '0x06';
  String nackKey = '0x15';

  String padLeftZero(String msg, int space) => msg.padLeft(space, "0");

  String stringToHex(String hex) =>
      (hex.contains('0x') ? hex : '0x${padLeftZero(hex, 2)}').toLowerCase();

  String numberToHex(int number) =>
      '0x${padLeftZero(number.toRadixString(16), 2)}'.toLowerCase();

  List<String> numberListToHexList(List<int> codes) =>
      codes.map((e) => numberToHex(e)).toList();

  int hexToNumber(String hex) => int.parse(stringToHex(hex));

  List<int> hexListToNumberList(List<String> codes) =>
      codes.map((e) => hexToNumber(e)).toList();

  List<String> utfToHexList(String msg) {
    List<int> utf = utf8.encode(msg);
    List<String> hex = utf.map((e) => numberToHex(e)).toList();
    return hex;
  }

  String hexListToUtf(List<String> hex) =>
      utf8.decode(hex.map((e) => int.parse(e)).toList(), allowMalformed: true);

  String generateLrc(List<String> msgs) {
    String lrc = '0x00';
    for (var i = 0; i < msgs.length; i++) {
      lrc = numberToHex(int.parse(lrc) ^ int.parse(msgs[i]));
    }
    return lrc;
  }

  Uint8List ackMessage() {
    return generateMessage([ackKey]);
  }

  Uint8List generateMessage(List<String> msgs) {
    final message = Uint8List(msgs.length);
    final bytedata = ByteData.view(message.buffer);
    for (var i = 0; i < msgs.length; i++) {
      bytedata.setUint8(i, int.parse(msgs[i]));
    }
    return message;
  }
}
