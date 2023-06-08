library rms_terminal_sdk;

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:rms_terminal_sdk/src/decode.dart';
import 'package:rms_terminal_sdk/src/encode.dart';
import 'package:rms_terminal_sdk/src/field_data/field_data.dart';

export 'package:rms_terminal_sdk/src/field_data/field_data.dart';
export 'package:rms_terminal_sdk/src/field_data/payment_type.dart';

class RMSTerminalSDK {
  Socket? _socket;
  StreamSubscription<Uint8List>? _listener;
  String _ipAddress = "";
  final StreamController<TerminalDecode> _stream = StreamController.broadcast();

  Future<void> _reset() async {
    await _listener?.cancel();
    await _socket?.close();
    _listener = null;
    _socket = null;
  }

  Future<void> connect(String ipAddress) async {
    if (_ipAddress == ipAddress) throw "Already connected to $ipAddress";
    await _reset();
    _ipAddress = ipAddress;
    _socket = await Socket.connect(_ipAddress, 8800);
    _listener = _socket!
        .listen((List<int> codes) => _stream.add(TerminalDecode(codes: codes)));
  }

  Future<void> disconnect() async {
    await _reset();
    _ipAddress = "";
  }

  bool checkConnection() {
    return _socket != null;
  }

  void _send(List<String> msg) {
    if (_socket == null) {
      throw "Not connected to terminal, please call Terminal.connect()";
    }
    final data = Uint8List(msg.length);
    final bytedata = ByteData.view(data.buffer);
    for (var i = 0; i < msg.length; i++) {
      bytedata.setUint8(i, int.parse(msg[i]));
    }
    _socket!.add(data);
  }

  Future<FieldDateResponseFormat> _sendWithResponse(List<String> msg) async {
    _send(msg);
    final listener = _stream.stream.listen((event) {});
    final completer = Completer<FieldDateResponseFormat>();
    listener.onData((data) async {
      if (!data.isAck && !data.isNack) {
        _send([data.ackKey]);
        await listener.cancel();
        completer.complete(data.response);
      }
    });
    return completer.future;
  }

  Future<FieldDateResponseFormat?> getCardInfo() async {
    return await _sendWithResponse(TerminalEncode().cardDetailInquiry());
  }

  Future<FieldDateResponseFormat?> purchase(int amount,
      {PaymentBy by = PaymentBy.creditCard, bool receipt = true}) async {
    return await _sendWithResponse(TerminalEncode()
        .purchase("00000000000000000001", amount, 0, by: by, receipt: receipt));
  }

  Future<FieldDateResponseFormat?> refund(String invoiceNo,
      {PaymentBy by = PaymentBy.creditCard, bool receipt = true}) async {
    return await _sendWithResponse(TerminalEncode().salesVoid(
        "00000000000000000001", invoiceNo,
        by: by, receipt: receipt));
  }

  Future<FieldDateResponseFormat?> settlement(
      {bool receipt = true, bool forseSettlement = true}) async {
    return await _sendWithResponse(
        TerminalEncode().settlement("00000000000000000001", receipt: receipt));
  }

  Future<FieldDateResponseFormat?> cancel() async {
    return await _sendWithResponse(
        TerminalEncode().cancel("00000000000000000001"));
  }
}
