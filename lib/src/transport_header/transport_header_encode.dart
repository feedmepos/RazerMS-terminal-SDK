import 'package:rms_terminal_sdk/src/transport_header/transport_header_config.dart';


class TransportHeader extends TransportHeaderConfig{

  List<String> get transportHeader =>
      [...utfToHexList("60"), ...utfToHexList("0000"), ...utfToHexList("0000")];
}