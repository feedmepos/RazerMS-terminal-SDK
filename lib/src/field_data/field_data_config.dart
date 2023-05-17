import 'package:rms_terminal_sdk/src/config.dart';

enum FieldName {
  unknown,
  payAccountId,
  approvalCode,
  reponseText,
  transactionDate,
  transactionTime,
  retrievalReferenceNo,
  receiptRequiredFlag,
  terminalId,
  merchantReceiptFooter,
  customerReceiptFooter,
  receiptData,
  encryptedCardNo,
  cardNo,
  expiryDate,
  cardIssueDate,
  memberExpiryDate,
  accountBalance,
  transactionStatus,
  amount,
  cashbackAmount,
  batchNo,
  forceSettlementFlag,
  receiptText,
  screenText,
  screenTimeout,
  traceNo,
  invoiceNo,
  transactionId,
  extendedInvoiceNo,
  salesTotal,
  offlineSalesTotal,
  voidSalesTotal,
  cashbackTotal,
  voidCashbackTotal,
  refundTotal,
  voidRefundTotal,
  batchTransactionCount,
  customData,
  malaysiaNRIC,
  nameAsPerIC,
  isoMessage,
  cashierId,
  compareCardFlag,
  compareCardNumber,
  merchantName,
  merchantNo,
  cardIssueName,
  hostName,
  cardLabel,
  cardHolderName,
  contactType,
  phone,
  email,
  transactionLabel,
  hostCount,
  aid,
  applicationProfile,
  cid,
  applicationCryptogram,
  tsi,
  tvr,
  cardEntryMode,
  eppTenure,
  serialNo,
  settlementSequenceNo,
  merchantIndex,
  track1Data,
  track2Data,
  track3Data,
  walletId;

  String toJson() => name;
  static FieldName fromJson(String json) => values.byName(json);
}

enum FieldType{
  binary,
  ascii
}

class Field {
  FieldName name;
  String code;
  int? length;
  FieldType type;

  Field({
    required this.name,
    required this.code,
    this.length,
    required this.type
  });
}

class FieldDataConfig extends TerminalConfig {
  String separatorKey = '0x1c';

  final List<Field> fieldList = [
    Field(name: FieldName.payAccountId, code: "00", length: 20, type: FieldType.ascii),
    Field(name: FieldName.approvalCode, code: "01", length: 6, type: FieldType.ascii),
    Field(name: FieldName.reponseText, code: "02", length: 40, type: FieldType.ascii),
    Field(name: FieldName.transactionDate, code: "03", length: 6, type: FieldType.ascii),
    Field(name: FieldName.transactionTime, code: "04", length: 6, type: FieldType.ascii),
    Field(name: FieldName.retrievalReferenceNo, code: "06", length: 12, type: FieldType.ascii),
    Field(name: FieldName.receiptRequiredFlag, code: "09", length: 1, type: FieldType.ascii),
    Field(name: FieldName.terminalId, code: "16", length: 8, type: FieldType.ascii),
    Field(name: FieldName.merchantReceiptFooter, code: "17", length: null, type: FieldType.ascii),
    Field(name: FieldName.customerReceiptFooter, code: "18", length: null, type: FieldType.ascii),
    Field(name: FieldName.receiptData, code: "19", length: null, type: FieldType.binary),
    Field(name: FieldName.encryptedCardNo, code: "29", length: 48, type: FieldType.ascii),
    Field(name: FieldName.cardNo, code: "30", length: null, type: FieldType.ascii),
    Field(name: FieldName.expiryDate, code: "31", length: 4, type: FieldType.ascii),
    Field(name: FieldName.cardIssueDate, code: "32", length: 6, type: FieldType.ascii),
    Field(name: FieldName.memberExpiryDate, code: "33", length: 4, type: FieldType.ascii),
    Field(name: FieldName.accountBalance, code: "38", length: 12, type: FieldType.ascii),
    Field(name: FieldName.transactionStatus, code: "39", length: 2, type: FieldType.ascii),
    Field(name: FieldName.amount, code: "40", length: 12, type: FieldType.ascii),
    Field(name: FieldName.cashbackAmount, code: "42", length: 12, type: FieldType.ascii),
    Field(name: FieldName.batchNo, code: "50", length: 6, type: FieldType.ascii),
    Field(name: FieldName.forceSettlementFlag, code: "52", length: 1, type: FieldType.ascii),
    Field(name: FieldName.receiptText, code: "60", length: null, type: FieldType.ascii),
    Field(name: FieldName.screenText, code: "61", length: 20, type: FieldType.ascii),
    Field(name: FieldName.screenTimeout, code: "62", length: 3, type: FieldType.ascii),
    Field(name: FieldName.traceNo, code: "64", length: 6, type: FieldType.ascii),
    Field(name: FieldName.invoiceNo, code: "65", length: 6, type: FieldType.ascii),
    Field(name: FieldName.transactionId, code: "66", length: 20, type: FieldType.ascii),
    Field(name: FieldName.extendedInvoiceNo, code: "67", length: 25, type: FieldType.ascii),
    Field(name: FieldName.salesTotal, code: "80", length: 20, type: FieldType.ascii),
    Field(name: FieldName.offlineSalesTotal, code: "81", length: 16, type: FieldType.ascii),
    Field(name: FieldName.voidSalesTotal, code: "82", length: 16, type: FieldType.ascii),
    Field(name: FieldName.cashbackTotal, code: "83", length: 16, type: FieldType.ascii),
    Field(name: FieldName.voidCashbackTotal, code: "84", length: 16, type: FieldType.ascii),
    Field(name: FieldName.refundTotal, code: "85", length: 16, type: FieldType.ascii),
    Field(name: FieldName.voidRefundTotal, code: "86", length: 16, type: FieldType.ascii),
    Field(name: FieldName.batchTransactionCount, code: "87", length: 16, type: FieldType.ascii),
    Field(name: FieldName.customData, code: "99", length: null, type: FieldType.ascii),
    Field(name: FieldName.malaysiaNRIC, code: "A1", length: 14, type: FieldType.ascii),
    Field(name: FieldName.nameAsPerIC, code: "A2", length: 50, type: FieldType.ascii),
    Field(name: FieldName.isoMessage, code: "AA", length: null, type: FieldType.ascii),
    Field(name: FieldName.cashierId, code: "C0", length: 20, type: FieldType.ascii),
    Field(name: FieldName.compareCardFlag, code: "C1", length: 1, type: FieldType.ascii),
    Field(name: FieldName.compareCardNumber, code: "C2", length: 4, type: FieldType.ascii),
    Field(name: FieldName.merchantName, code: "D0", length: 69, type: FieldType.ascii),
    Field(name: FieldName.merchantNo, code: "D1", length: 15, type: FieldType.ascii),
    Field(name: FieldName.cardIssueName, code: "D2", length: 10, type: FieldType.ascii),
    Field(name: FieldName.hostName, code: "D3", length: 26, type: FieldType.ascii),
    Field(name: FieldName.cardLabel, code: "D4", length: 20, type: FieldType.ascii),
    Field(name: FieldName.cardHolderName, code: "D5", length: 26, type: FieldType.ascii),
    Field(name: FieldName.contactType, code: "D6", length: 1, type: FieldType.ascii),
    Field(name: FieldName.phone, code: "D7", length: 17, type: FieldType.ascii),
    Field(name: FieldName.email, code: "D8", length: 50, type: FieldType.ascii),
    Field(name: FieldName.transactionLabel, code: "D9", length: 20, type: FieldType.ascii),
    Field(name: FieldName.hostCount, code: "DA", length: 2, type: FieldType.ascii),
    Field(name: FieldName.aid, code: "E0", length: null, type: FieldType.ascii),
    Field(name: FieldName.applicationProfile, code: "E1", length: null, type: FieldType.ascii),
    Field(name: FieldName.cid, code: "E2", length: 2, type: FieldType.ascii),
    Field(name: FieldName.applicationCryptogram, code: "E3", length: 16, type: FieldType.ascii),
    Field(name: FieldName.tsi, code: "E4", length: 4, type: FieldType.ascii),
    Field(name: FieldName.tvr, code: "E5", length: 10, type: FieldType.ascii),
    Field(name: FieldName.cardEntryMode, code: "E6", length: 2, type: FieldType.ascii),
    Field(name: FieldName.eppTenure, code: "ET", length: 2, type: FieldType.ascii),
    Field(name: FieldName.serialNo, code: "FF", length: 16, type: FieldType.ascii),
    Field(name: FieldName.settlementSequenceNo, code: "S1", length: 2, type: FieldType.ascii),
    Field(name: FieldName.merchantIndex, code: "M1", length: 2, type: FieldType.ascii),
    Field(name: FieldName.track1Data, code: "T1", length: null, type: FieldType.ascii),
    Field(name: FieldName.track2Data, code: "T2", length: null, type: FieldType.ascii),
    Field(name: FieldName.track3Data, code: "T3", length: null, type: FieldType.ascii),
    Field(name: FieldName.walletId, code: "W1", length: 2, type: FieldType.ascii),
  ];

  Field byCode(String code) {
    try {
      return fieldList.firstWhere((element) => element.code == code);
    } catch (err) {
      return Field(name: FieldName.unknown, code: "-1", length: null, type: FieldType.ascii);
    }
  }
}