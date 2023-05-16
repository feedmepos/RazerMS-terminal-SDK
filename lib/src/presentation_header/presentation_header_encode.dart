import 'package:rms_terminal_sdk/src/presentation_header/presentation_header_config.dart';

class PresentationHeader extends PresentationHeaderConfig {

  TransactionName transactionName;

  PresentationHeader({
    required this.transactionName,
  });

  String get transactionCode => transactionList
      .firstWhere((element) => element.name == transactionName)
      .code;

  List<String> get presentationHeader {
    const String requestResponseIndicator =
        "0"; // '0' – Request message requiring response | '1' – Response message | '2' – Request message, no response required
    return [
      ...utfToHexList("1"),
      ...utfToHexList(requestResponseIndicator),
      ...utfToHexList(transactionCode),
      ...utfToHexList("00"),
      ...utfToHexList("0"),
      separatorKey
    ];
  }
}
