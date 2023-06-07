import 'config.dart';
import 'field_data/field_data.dart';
import 'presentation_header/presentation_header.dart';
import 'transport_header/transport_header.dart';

class TerminalEncode extends TerminalConfig {
  List<String> completionKey(
      List<String> msgs, TransactionName transactionName) {
    final lengthMsgs = [
      ...TransportHeader().transportHeader,
      ...PresentationHeader(transactionName: transactionName)
          .presentationHeader,
      ...msgs
    ];
    List<String> length = [];
    final msgLength = padLeftZero(lengthMsgs.length.toString(), 4).split("");
    for (var i = 0; i < msgLength.length; i += 2) {
      length.add('0x${msgLength[i]}${msgLength[i + 1]}');
    }
    final lrcMsgs = [...length, ...lengthMsgs, endKey];
    return [startKey, ...lrcMsgs, generateLrc(lrcMsgs)];
  }

  // 3.1 TRANSACTION CODE '00' VERIFY PAY ACCOUNT ID
  List<String> verifyPayAccountID() {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20))
    ];
    return completionKey(fieldDatas, TransactionName.verifyPayAccountID);
  }

  // 3.2 TRANSACTION CODE '10' CARD DETAIL INQUIRY
  List<String> cardDetailInquiry() {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20))
    ];
    return completionKey(fieldDatas, TransactionName.cardDetailInquiry);
  }

  // 3.3 TRANSACTION CODE '11' BALANCE INQUIRY
  List<String> balanceInquiry({bool receipt = true}) {
    final flag = receipt == true ? "1" : "0";
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
    ];
    return completionKey(fieldDatas, TransactionName.balanceInquiry);
  }

  // 3.4 TRANSACTION CODE '12' LAST TRANSACTION INQUIRY
  List<String> lastTransactionInquiry(String transactionId) {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
    ];
    return completionKey(fieldDatas, TransactionName.lastTransactionInquiry);
  }

  // 3.5 TRANSACTION CODE '13' READ MYKAD
  // 3.6 TRANSACTION CODE '14' READ MAGNETIC CARD
  // 3.7 TRANSACTION CODE '20' PURCHASE
  List<String> purchase(String transactionId, int amount, int cashbackAmount,
      {PaymentBy by = PaymentBy.creditCard, bool receipt = true}) {
    final flag = receipt == true ? "1" : "0";
    final paymentCode = PaymentType(by: by).code;
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
      ...FieldData(name: FieldName.amount)
          .fieldData(padLeftZero(amount.toString(), 12)),
      ...FieldData(name: FieldName.cashbackAmount)
          .fieldData(padLeftZero(cashbackAmount.toString(), 12)),
      ...FieldData(name: FieldName.merchantIndex)
          .fieldData(padLeftZero(paymentCode, 2)),
      // ...FieldData(fieldName: FieldName.walletId).fieldData(padLeftZero(1.toString(), 2)),
      ...FieldData(name: FieldName.eppTenure)
          .fieldData(padLeftZero(12.toString(), 2)),
      // ...FieldData(name: FieldName.compareCardFlag)
      //     .fieldData(padLeftZero(0.toString(), 1)),
      ...FieldData(name: FieldName.compareCardNumber)
          .fieldData(padLeftZero(0.toString(), 4)),
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
      ...FieldData(name: FieldName.cashierId)
          .fieldData(padLeftZero(0.toString(), 20)),
    ];
    return completionKey(fieldDatas, TransactionName.purchase);
  }

  // 3.8 TRANSACTION CODE '21' TOPUP
  List<String> topUp(String transactionId, int amount, {bool receipt = true}) {
    final flag = receipt == true ? "1" : "0";
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
      ...FieldData(name: FieldName.amount)
          .fieldData(padLeftZero(amount.toString(), 12)),
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
      ...FieldData(name: FieldName.cashierId)
          .fieldData(padLeftZero(0.toString(), 20)),
    ];
    return completionKey(fieldDatas, TransactionName.topUp);
  }

  // 3.9 TRANSACTION CODE '22' PREAUTH
  List<String> preAuth(String transactionId, int amount,
      {bool receipt = true}) {
    final flag = receipt == true ? "1" : "0";
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
      ...FieldData(name: FieldName.amount)
          .fieldData(padLeftZero(amount.toString(), 12)),
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
      ...FieldData(name: FieldName.cashierId)
          .fieldData(padLeftZero(0.toString(), 20)),
    ];
    return completionKey(fieldDatas, TransactionName.preAuth);
  }

  // 3.10TRANSACTION CODE '23' PREAUTH COMPLETION
  List<String> preAuthCompletion(String transactionId, int amount,
      {bool receipt = true}) {
    final flag = receipt == true ? "1" : "0";
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
      ...FieldData(name: FieldName.amount)
          .fieldData(padLeftZero(amount.toString(), 12)),
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
      ...FieldData(name: FieldName.cashierId)
          .fieldData(padLeftZero(0.toString(), 20)),
    ];
    return completionKey(fieldDatas, TransactionName.preAuthCompletion);
  }

  // 3.11TRANSACTION CODE '40' VOID
  List<String> salesVoid(String transactionId, String invoiceNo,
      {PaymentBy by = PaymentBy.creditCard, bool receipt = true}) {
    final flag = receipt == true ? "1" : "0";
    final invoiceNoFieldData = by == PaymentBy.creditCard
        ? FieldData(name: FieldName.invoiceNo)
            .fieldData(padLeftZero(invoiceNo, 6))
        : FieldData(name: FieldName.extendedInvoiceNo)
            .fieldData(padLeftSpace(padLeftZero(invoiceNo, 6), 25));

    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
      ...invoiceNoFieldData,
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
      ...FieldData(name: FieldName.cashierId)
          .fieldData(padLeftZero(0.toString(), 20)),
    ];
    return completionKey(fieldDatas, TransactionName.salesVoid);
  }

  // 3.12TRANSACTION CODE '41' REFUND
  List<String> refund(String transactionId, int amount, {bool receipt = true}) {
    final flag = receipt == true ? "1" : "0";
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
      ...FieldData(name: FieldName.amount)
          .fieldData(padLeftZero(amount.toString(), 12)),
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
      ...FieldData(name: FieldName.cashierId)
          .fieldData(padLeftZero(0.toString(), 20)),
    ];
    return completionKey(fieldDatas, TransactionName.refund);
  }

  // 3.13TRANSACTION CODE '50' SETTLEMENT
  List<String> settlement(String transactionId,
      {bool receipt = true, bool forseSettlement = true}) {
    final flag = receipt == true ? "1" : "0";
    final settlementFlag = forseSettlement == true ? "1" : "0";
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
      ...FieldData(name: FieldName.receiptRequiredFlag)
          .fieldData(padLeftZero(flag, 1)),
      ...FieldData(name: FieldName.forceSettlementFlag)
          .fieldData(padLeftZero(settlementFlag, 1)),
    ];
    return completionKey(fieldDatas, TransactionName.settlement);
  }

  // 3.14TRANSACTION CODE '51' GET BATCH DETAIL
  List<String> getBatchDetail(String transactionId) {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
    ];
    return completionKey(fieldDatas, TransactionName.getBatchDetail);
  }

  // 3.15TRANSACTION CODE '60' PRINT RECEIPT
  List<String> printReport(String receiptText) {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.receiptText)
          .fieldData(padLeftZero(receiptText, 21)),
    ];
    return completionKey(fieldDatas, TransactionName.printReport);
  }

  // 3.16TRANSACTION CODE '61' DISPLAY SCREEN
  List<String> displayScreen(String receiptText) {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.screenText)
          .fieldData(padLeftZero(receiptText, 20)),
      ...FieldData(name: FieldName.screenTimeout)
          .fieldData(padLeftZero("5", 3)),
    ];
    return completionKey(fieldDatas, TransactionName.displayScreen);
  }

  // 3.17TRANSACTION CODE '90' CARDHOLDER INQUIRY
  // 3.18TRANSACTION CODE '99' FORWARDING MESSAGE
  List<String> forwardingMessage(String transactionId) {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
    ];
    return completionKey(fieldDatas, TransactionName.forwardingMessage);
  }

  // 3.19TRANSACTION CODE 'XX' CANCEL
  List<String> cancel(String transactionId) {
    final List<String> fieldDatas = [
      ...FieldData(name: FieldName.payAccountId).fieldData(padLeftZero('', 20)),
      ...FieldData(name: FieldName.transactionId)
          .fieldData(padLeftZero(transactionId, 20)),
    ];
    return completionKey(fieldDatas, TransactionName.cancel);
  }
}
