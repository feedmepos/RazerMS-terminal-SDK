import 'package:rms_terminal_sdk/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cases.dart';

void main() {
  group("'00 VERIFY ID", () {
    final razerDecode = TerminalDecode(codes: verifyId00);
    test("Start key validation", () {
      expect(razerDecode.startKeyVal, true);
    });
    test("End key validation", () {
      expect(razerDecode.endKeyVal, true);
    });
    test("Length validation", () {
      expect(razerDecode.lengthVal, true);
    });
    test("LRC key validation", () {
      expect(razerDecode.lrcVal, true);
    });

    test("All validation", () {
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x30', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '00');
      expect(presentationHeader.transactionName,
          TransactionName.verifyPayAccountID);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'10' CARD DETAIL INQUIRY", () {
    final razerDecode = TerminalDecode(codes: cardDetailInquiry10);
    test("Start key validation", () {
      expect(razerDecode.startKeyVal, true);
    });
    test("End key validation", () {
      expect(razerDecode.endKeyVal, true);
    });
    test("Length validation", () {
      expect(razerDecode.lengthVal, true);
    });
    test("LRC key validation", () {
      expect(razerDecode.lrcVal, true);
    });

    test("All validation", () {
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x31', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '10');
      expect(presentationHeader.transactionName,
          TransactionName.cardDetailInquiry);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'11' BALANCE INQUIRY", () {
    final razerDecode = TerminalDecode(codes: balanceInquiry11);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x31', '0x31', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '11');
      expect(
          presentationHeader.transactionName, TransactionName.balanceInquiry);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'12' LAST TRANSACTION INQUIRY", () {
    final razerDecode = TerminalDecode(codes: lastTransactionInquiry12);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x31', '0x32', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '12');
      expect(presentationHeader.transactionName,
          TransactionName.lastTransactionInquiry);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'12' LAST TRANSACTION INQUIRY", () {
    final razerDecode = TerminalDecode(codes: lastTransactionInquiry12);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x31', '0x32', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '12');
      expect(presentationHeader.transactionName,
          TransactionName.lastTransactionInquiry);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'20' PURCHASE", () {
    final razerDecodeCard = TerminalDecode(codes: purchase20cardPayment);
    final razerDecodeEwallet = TerminalDecode(codes: purchase20Ewallet);
    test("basic", () {
      expect(razerDecodeCard.startKeyVal, true);
      expect(razerDecodeCard.endKeyVal, true);
      expect(razerDecodeCard.lengthVal, true);
      expect(razerDecodeCard.lrcVal, true);
      expect(razerDecodeCard.validation(), true);

      expect(razerDecodeEwallet.startKeyVal, true);
      expect(razerDecodeEwallet.endKeyVal, true);
      expect(razerDecodeEwallet.lengthVal, true);
      expect(razerDecodeEwallet.lrcVal, true);
      expect(razerDecodeEwallet.validation(), true);
    });
    test("transport header", () {
      final transportHeaderCard =
          TransportHeaderDecode(codes: razerDecodeCard.codesHex);
      expect(transportHeaderCard.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
      final transportHeaderEwallet =
          TransportHeaderDecode(codes: razerDecodeEwallet.codesHex);
      expect(transportHeaderEwallet.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeaderCard =
          PresentationHeaderDecode(codes: razerDecodeCard.codesHex);
      expect(presentationHeaderCard.presentationHeader,
          ['0x31', '0x31', '0x32', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeaderCard.transactionCode, '20');
      expect(presentationHeaderCard.transactionName, TransactionName.purchase);

      final presentationHeaderEwallet =
          PresentationHeaderDecode(codes: razerDecodeCard.codesHex);
      expect(presentationHeaderEwallet.presentationHeader,
          ['0x31', '0x31', '0x32', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeaderEwallet.transactionCode, '20');
      expect(
          presentationHeaderEwallet.transactionName, TransactionName.purchase);
    });
    test("field data", () {
      final fieldDatasCard = FieldDataDecode(code: razerDecodeCard.codesHex);
      fieldDatasCard.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });

      final fieldDatasEwallet =
          FieldDataDecode(code: razerDecodeCard.codesHex);
      fieldDatasEwallet.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'21' TOP UP", () {
    final razerDecode = TerminalDecode(codes: lastTransactionInquiry12);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x31', '0x32', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '12');
      expect(presentationHeader.transactionName,
          TransactionName.lastTransactionInquiry);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'22' PREAUTH", () {
    final razerDecode = TerminalDecode(codes: preAuth22);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x32', '0x32', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '22');
      expect(presentationHeader.transactionName, TransactionName.preAuth);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'23' PREAUTH COMPLETION", () {
    final razerDecode = TerminalDecode(codes: preAuthCompletion23);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x32', '0x33', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '23');
      expect(presentationHeader.transactionName,
          TransactionName.preAuthCompletion);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'40' VOID", () {
    final razerDecodeCard = TerminalDecode(codes: void40Card);
    final razerDecodeEwallet = TerminalDecode(codes: void40Ewallet);
    test("basic", () {
      expect(razerDecodeCard.startKeyVal, true);
      expect(razerDecodeCard.endKeyVal, true);
      expect(razerDecodeCard.lengthVal, true);
      expect(razerDecodeCard.lrcVal, true);
      expect(razerDecodeCard.validation(), true);

      expect(razerDecodeEwallet.startKeyVal, true);
      expect(razerDecodeEwallet.endKeyVal, true);
      expect(razerDecodeEwallet.lengthVal, true);
      expect(razerDecodeEwallet.lrcVal, true);
      expect(razerDecodeEwallet.validation(), true);
    });
    test("transport header", () {
      final transportHeaderCard =
          TransportHeaderDecode(codes: razerDecodeCard.codesHex);
      expect(transportHeaderCard.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);

      final transportHeaderEwallet =
          TransportHeaderDecode(codes: razerDecodeEwallet.codesHex);
      expect(transportHeaderEwallet.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeaderCard =
          PresentationHeaderDecode(codes: razerDecodeCard.codesHex);
      expect(presentationHeaderCard.presentationHeader,
          ['0x31', '0x31', '0x34', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeaderCard.transactionCode, '40');
      expect(presentationHeaderCard.transactionName, TransactionName.salesVoid);

      final presentationHeaderEwallet =
          PresentationHeaderDecode(codes: razerDecodeCard.codesHex);
      expect(presentationHeaderEwallet.presentationHeader,
          ['0x31', '0x31', '0x34', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeaderEwallet.transactionCode, '40');
      expect(
          presentationHeaderEwallet.transactionName, TransactionName.salesVoid);
    });
    test("field data", () {
      final fieldDatasCard = FieldDataDecode(code: razerDecodeCard.codesHex);
      fieldDatasCard.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
      final fieldDatasEwallet =
          FieldDataDecode(code: razerDecodeEwallet.codesHex);
      fieldDatasEwallet.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'51' GET BATCH DETAIL", () {
    final razerDecode = TerminalDecode(codes: getBatchDetail51);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x35', '0x31', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '51');
      expect(
          presentationHeader.transactionName, TransactionName.getBatchDetail);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'90' CARDHOLDER INQUIRY", () {
    final razerDecode = TerminalDecode(codes: cardholderInquiry90);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x39', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '90');
      expect(presentationHeader.transactionName,
          TransactionName.cardholderInquiry);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'99' FORAWRDING MESSAGE", () {
    final razerDecode = TerminalDecode(codes: forwardingMessage99);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x39', '0x30', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, '99');
      expect(presentationHeader.transactionName,
          TransactionName.forwardingMessage);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'FF' PING TRANSACTION", () {
    final razerDecode = TerminalDecode(codes: pingTransactionFF);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x46', '0x46', '0x43', '0x50', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, 'FF');
      expect(presentationHeader.transactionName, TransactionName.ping);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("'XX' CANCEL TRANSACTION", () {
    final razerDecode = TerminalDecode(codes: cancelTransactionXX);
    test("basic", () {
      expect(razerDecode.startKeyVal, true);
      expect(razerDecode.endKeyVal, true);
      expect(razerDecode.lengthVal, true);
      expect(razerDecode.lrcVal, true);
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x31', '0x32', '0x30', '0x30', '0x30', '0x1c']);
      expect(presentationHeader.transactionCode, 'XX');
      expect(presentationHeader.transactionName, TransactionName.cancel);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("Purchase 000012", () {
    final razerDecode = TerminalDecode(codes: purchase000012);
    test("Start key validation", () {
      expect(razerDecode.startKeyVal, true);
    });
    test("End key validation", () {
      expect(razerDecode.endKeyVal, true);
    });
    test("Length validation", () {
      expect(razerDecode.lengthVal, true);
    });
    test("LRC key validation", () {
      expect(razerDecode.lrcVal, true);
    });

    test("All validation", () {
      expect(razerDecode.validation(), true);
    });
    test("transport header", () {
      final transportHeader =
          TransportHeaderDecode(codes: razerDecode.codesHex);
      expect(transportHeader.transportHeader, [
        '0x36',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30',
        '0x30'
      ]);
    });
    test("presentation header", () {
      final presentationHeader =
          PresentationHeaderDecode(codes: razerDecode.codesHex);
      expect(presentationHeader.presentationHeader,
          ['0x31', '0x31', '0x32', '0x30', '0x30', '0x30', '0x31', '0x1c']);
      expect(presentationHeader.transactionCode, '20');
      expect(presentationHeader.transactionName, TransactionName.purchase);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
  group("Settlement 1", () {
    final razerDecode = TerminalDecode(codes: settlement1);
    test("Start key validation", () {
      expect(razerDecode.startKeyVal, true);
    });
    test("End key validation", () {
      expect(razerDecode.endKeyVal, true);
    });
    test("Length validation", () {
      expect(razerDecode.lengthVal, true);
    });
    test("LRC key validation", () {
      expect(razerDecode.lrcVal, true);
    });

    test("All validation", () {
      expect(razerDecode.validation(), true);
    });
    test("field data", () {
      final fieldDatas = FieldDataDecode(code: razerDecode.codesHex);
      fieldDatas.responses.forEach((element) {
        print('${element.name} - ${element.message}');
      });
    });
  });
}
