import 'dart:convert';
import 'package:rms_terminal_sdk/src/presentation_header/presentation_header_config.dart';


class PresentationHeaderDecode extends PresentationHeaderConfig {
  List<String> codes;

  PresentationHeaderDecode({
    required this.codes,
  });

  List<String> get presentationHeader => codes.sublist(13, 21);
  String get transactionCode => utf8.decode([
        presentationHeader[2],
        presentationHeader[3]
      ].map((e) => int.parse(e)).toList());

  TransactionName get transactionName => byCode(transactionCode);
}