import 'package:rms_terminal_sdk/src/config.dart';

enum TransactionName {
  verifyPayAccountID,
  cardDetailInquiry,
  balanceInquiry,
  lastTransactionInquiry,
  readMyKAD,
  readMagneticCard,
  purchase,
  topUp,
  preAuth,
  preAuthCompletion,
  salesVoid, // = void
  refund,
  settlement,
  getBatchDetail,
  printReport,
  displayScreen,
  cardholderInquiry,
  forwardingMessage,
  ping,
  cancel,
}

class Transaction {
  TransactionName name;
  String code;

  Transaction({required this.name, required this.code});
}

class PresentationHeaderConfig extends TerminalConfig {
  String separatorKey = '0x1c';

  List<Transaction> transactionList = [
    Transaction(name: TransactionName.verifyPayAccountID, code: "00"),
    Transaction(name: TransactionName.cardDetailInquiry, code: "10"),
    Transaction(name: TransactionName.balanceInquiry, code: "11"),
    Transaction(name: TransactionName.lastTransactionInquiry, code: "12"),
    Transaction(name: TransactionName.readMyKAD, code: "13"),
    Transaction(name: TransactionName.readMagneticCard, code: "14"),
    Transaction(name: TransactionName.purchase, code: "20"),
    Transaction(name: TransactionName.topUp, code: "21"),
    Transaction(name: TransactionName.preAuth, code: "22"),
    Transaction(name: TransactionName.preAuthCompletion, code: "23"),
    Transaction(name: TransactionName.salesVoid, code: "40"),
    Transaction(name: TransactionName.refund, code: "41"),
    Transaction(name: TransactionName.settlement, code: "50"),
    Transaction(name: TransactionName.getBatchDetail, code: "51"),
    Transaction(name: TransactionName.printReport, code: "60"),
    Transaction(name: TransactionName.displayScreen, code: "61"),
    Transaction(name: TransactionName.cardholderInquiry, code: "90"),
    Transaction(name: TransactionName.forwardingMessage, code: "99"),
    Transaction(name: TransactionName.ping, code: "FF"),
    Transaction(name: TransactionName.cancel, code: "XX"),
  ];

  TransactionName byTransactionCode(String code) => transactionList.firstWhere((element) => element.code == code).name;
}