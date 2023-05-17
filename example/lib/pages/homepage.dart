import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rms_terminal_sdk/main.dart';

class HomePage extends StatefulWidget {
  final Socket socket;

  const HomePage({super.key, required this.socket});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final razer = TerminalEncode();

  @override
  void initState() {
    widget.socket.listen((List<int> event) {
      final razerDecode = TerminalDecode(codes: event);
      if (razerDecode.ackKey == razerDecode.numberListToHexList(event)[0]) {
        print("Acknowledge");
      } else if (razerDecode.nackKey ==
          razerDecode.numberListToHexList(event)[0]) {
        print("Not Acknowledge");
      } else {
        // final reponses = razerDecode.fieldDatas.reponses;
        final format = razerDecode.fieldDatas.format;
        print(format);
        // reponses.forEach((element) {
        //   if(element.name == FieldName.receiptData){

        //   }else{
        //     print('${element.name} - ${element.message}');
        //   }
        // });
        sendAckMessage();
      }
    });
    super.initState();
  }

  void sendMessage(List<String> msgs) {
    Uint8List compileMsgs = razer.generateMessage(msgs);
    widget.socket.add(compileMsgs);
  }

  void sendAckMessage() {
    Uint8List compileMsgs = razer.ackMessage();
    widget.socket.add(compileMsgs);
  }

  void sendStringMessage() {
    final List<String> msgs = [];
    const String raw =
        "02037736303030303030303030313039393030301C3030002030303030353661666136353135333036643230341C414103290147600123012403010038000000C400820004131438281703073130303030303031313030303030303030303030303031001545583831302D323132363130313032002359490548BDC8B299C6AC48D0511D1A1E91A0C8F0F46C6F023600EA600115000002003020078020C0020400300000000000010000041300510001011500375400697001474905D2105201000007750001003130303030303031313030303030303030303030303031014782023800950500000880009A031703079C01009F02060000000001009F03060000000000009F090200029F10120110A080012200008CA200000000000000FF9F1A0204589F1E0831323334353637389F2608C26C75347845F4069F2701809F3303E0F8C89F34031E03009F3501229F360201E29F3704BB43FF6C9F4104000003439F5301525F2A0204588407A000000004101000063030303335331C0367";
    for (var i = 0; i < raw.length; i += 2) {
      msgs.add('0x${raw[i]}${raw[i + 1]}');
    }
    Uint8List compileMsgs = razer.generateMessage(msgs);
    widget.socket.add(compileMsgs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TCP Client Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => sendStringMessage(),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => sendMessage(razer.verifyPayAccountID()),
              child:
                  const Text("3.1 TRANSACTION CODE '00' VERIFY PAY ACCOUNT ID"),
            ),
            TextButton(
              onPressed: () => sendMessage(razer.cardDetailInquiry()),
              child:
                  const Text("3.2 TRANSACTION CODE '10' CARD DETAIL INQUIRY"),
            ),
            TextButton(
              onPressed: () => sendMessage(razer.balanceInquiry()),
              child: const Text("3.3 TRANSACTION CODE '11' BALANCE INQUIRY"),
            ),
            TextButton(
              onPressed: () => sendMessage(
                  razer.lastTransactionInquiry("00000000000000000123")),
              child: const Text(
                  "3.4 TRANSACTION CODE '12' LAST TRANSACTION INQUIRY"),
            ),
            TextButton(
              onPressed: () => sendMessage(razer.purchase(
                  "00000000000000001000", 100, 0,
                  by: PaymentBy.eWallet)),
              child: const Text("3.7 TRANSACTION CODE '20' PURCHASE"),
            ),
            TextButton(
              onPressed: () => sendMessage(razer.salesVoid(
                "00000000000000000123",
                "000025",
                by: PaymentBy.creditCard
              )),
              child: const Text("3.11TRANSACTION CODE '40' VOID"),
            ),
            TextButton(
              onPressed: () =>
                  sendMessage(razer.refund("00000000000000001000", 450)),
              child: const Text("3.12TRANSACTION CODE '41' REFUND"),
            ),
            TextButton(
              onPressed: () =>
                  sendMessage(razer.settlement("00000000000000000123")),
              child: const Text("3.13 TRANSACTION CODE '50' SETTLEMENT"),
            ),
            TextButton(
              onPressed: () =>
                  sendMessage(razer.printReport("123456712345671234567")),
              child: const Text("3.15 TRANSACTION CODE '60' PRINT RECEIPT"),
            ),
            TextButton(
              onPressed: () =>
                  sendMessage(razer.displayScreen("This is Testing")),
              child: const Text("3.16 TRANSACTION CODE '61' DISPLAY SCREEN"),
            ),
            TextButton(
              onPressed: () =>
                  sendMessage(razer.cancel("00000000000000000123")),
              child: const Text("3.19 TRANSACTION CODE 'XX' CANCEL"),
            ),
          ],
        ),
      ),
    );
  }
}
