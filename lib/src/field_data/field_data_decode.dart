// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'field_data.dart';

class FieldDateResponseFormat {
  String? payAccountId;
  String? approvalCode;
  String? responseText;
  String? transactionId;
  String? transactionDate;
  String? transactionTime;
  String? retrievalReferenceNo;
  String? terminalId;
  String? merchantReceiptFooter;
  String? customerReceiptFooter;
  String? encryptedCardNo;
  String? cardNo;
  String? expiryDate;
  String? cardIssueDate;
  String? memberExpiryDate;
  String? accountBalance;
  String? amount;
  String? batchNo;
  String? traceNo;
  String? invoiceNo;
  String? merchantName;
  String? merchantNo;
  String? cardIssueName;
  String? cardLabel;
  String? cardHolderName;
  String? aid;
  String? applicationProfile;
  String? cid;
  String? tsi;
  String? tvr;
  String? cardEntryMode;
  CustomDateResponseFormat? customData;

  FieldDateResponseFormat({
    this.payAccountId,
    this.approvalCode,
    this.responseText,
    this.transactionId,
    this.transactionDate,
    this.transactionTime,
    this.retrievalReferenceNo,
    this.terminalId,
    this.merchantReceiptFooter,
    this.customerReceiptFooter,
    this.encryptedCardNo,
    this.cardNo,
    this.expiryDate,
    this.cardIssueDate,
    this.memberExpiryDate,
    this.accountBalance,
    this.amount,
    this.batchNo,
    this.traceNo,
    this.invoiceNo,
    this.merchantName,
    this.merchantNo,
    this.cardIssueName,
    this.cardLabel,
    this.cardHolderName,
    this.aid,
    this.applicationProfile,
    this.cid,
    this.tsi,
    this.tvr,
    this.cardEntryMode,
    this.customData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payAccountId': payAccountId,
      'approvalCode': approvalCode,
      'reponseText': responseText,
      'transactionId': transactionId,
      'transactionDate': transactionDate,
      'transactionTime': transactionTime,
      'retrievalReferenceNo': retrievalReferenceNo,
      'terminalId': terminalId,
      'merchantReceiptFooter': merchantReceiptFooter,
      'customerReceiptFooter': customerReceiptFooter,
      'encryptedCardNo': encryptedCardNo,
      'cardNo': cardNo,
      'expiryDate': expiryDate,
      'cardIssueDate': cardIssueDate,
      'memberExpiryDate': memberExpiryDate,
      'accountBalance': accountBalance,
      'amount': amount,
      'batchNo': batchNo,
      'traceNo': traceNo,
      'invoiceNo': invoiceNo,
      'merchantName': merchantName,
      'merchantNo': merchantNo,
      'cardIssueName': cardIssueName,
      'cardLabel': cardLabel,
      'cardHolderName': cardHolderName,
      'aid': aid,
      'applicationProfile': applicationProfile,
      'cid': cid,
      'tsi': tsi,
      'tvr': tvr,
      'cardEntryMode': cardEntryMode,
      'customData': customData?.toMap(),
    };
  }

  factory FieldDateResponseFormat.fromMap(Map<String, dynamic> map) {
    return FieldDateResponseFormat(
      payAccountId: map['payAccountId'] != null ? map['payAccountId'] as String : null,
      approvalCode: map['approvalCode'] != null ? map['approvalCode'] as String : null,
      responseText: map['reponseText'] != null ? map['reponseText'] as String : null,
      transactionId: map['transactionId'] != null ? map['transactionId'] as String : null,
      transactionDate: map['transactionDate'] != null ? map['transactionDate'] as String : null,
      transactionTime: map['transactionTime'] != null ? map['transactionTime'] as String : null,
      retrievalReferenceNo: map['retrievalReferenceNo'] != null ? map['retrievalReferenceNo'] as String : null,
      terminalId: map['terminalId'] != null ? map['terminalId'] as String : null,
      merchantReceiptFooter: map['merchantReceiptFooter'] != null ? map['merchantReceiptFooter'] as String : null,
      customerReceiptFooter: map['customerReceiptFooter'] != null ? map['customerReceiptFooter'] as String : null,
      encryptedCardNo: map['encryptedCardNo'] != null ? map['encryptedCardNo'] as String : null,
      cardNo: map['cardNo'] != null ? map['cardNo'] as String : null,
      expiryDate: map['expiryDate'] != null ? map['expiryDate'] as String : null,
      cardIssueDate: map['cardIssueDate'] != null ? map['cardIssueDate'] as String : null,
      memberExpiryDate: map['memberExpiryDate'] != null ? map['memberExpiryDate'] as String : null,
      accountBalance: map['accountBalance'] != null ? map['accountBalance'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      batchNo: map['batchNo'] != null ? map['batchNo'] as String : null,
      traceNo: map['traceNo'] != null ? map['traceNo'] as String : null,
      invoiceNo: map['invoiceNo'] != null ? map['invoiceNo'] as String : null,
      merchantName: map['merchantName'] != null ? map['merchantName'] as String : null,
      merchantNo: map['merchantNo'] != null ? map['merchantNo'] as String : null,
      cardIssueName: map['cardIssueName'] != null ? map['cardIssueName'] as String : null,
      cardLabel: map['cardLabel'] != null ? map['cardLabel'] as String : null,
      cardHolderName: map['cardHolderName'] != null ? map['cardHolderName'] as String : null,
      aid: map['aid'] != null ? map['aid'] as String : null,
      applicationProfile: map['applicationProfile'] != null ? map['applicationProfile'] as String : null,
      cid: map['cid'] != null ? map['cid'] as String : null,
      tsi: map['tsi'] != null ? map['tsi'] as String : null,
      tvr: map['tvr'] != null ? map['tvr'] as String : null,
      cardEntryMode: map['cardEntryMode'] != null ? map['cardEntryMode'] as String : null,
      customData: map['customData'] != null ? CustomDateResponseFormat.fromMap(map['customData'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FieldDateResponseFormat.fromJson(String source) => FieldDateResponseFormat.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FieldDateResponse {
  FieldName name;
  String message;

  FieldDateResponse({
    required this.name,
    required this.message,
  });

  String get formatedMessage {
    List<String> codes =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 '
            .split('');
    var msg = '';
    for (var i = 0; i < message.length; i++) {
      if (codes.any((element) => element == message[i])) {
        msg += message[i];
      }
    }
    return msg;
  }

  get toMap {
    if(name == FieldName.customData){
      return '"${name.toJson()}":{$message}';
    }
    else{
      return '"${name.toJson()}":"$formatedMessage"';
    }
  }
}

class FieldDecode extends FieldDataConfig {
  List<String> codes;

  FieldDecode({
    required this.codes,
  });

  Field get field {
    try {
      final nameList = hexListToUtf(codes.sublist(0, 2));
      return byCode(nameList);
    } catch (err) {
      return Field(
        name: FieldName.unknown,
        code: "-1",
        length: null,
        type: FieldType.ascii,
      );
    }
  }

  FieldName get name => field.name;

  FieldType get type => field.type;

  String get message {
    try {
      final messageList = codes.sublist(4, codes.length - 1);
      if (name == FieldName.customData) {
        return CustomDataDecode(codes: messageList).responses;
      } else {
        switch (type) {
          case FieldType.ascii:
            return hexListToUtf(messageList);
          case FieldType.binary:
            return hexListToBinary(messageList);
          default:
            return '';
        }
      }
    } catch (err) {
      return "";
    }
  }

  FieldDateResponse get response =>
      FieldDateResponse(name: name, message: message);
}

class FieldDataDecode extends FieldDataConfig {
  List<String> codes;

  FieldDataDecode({
    required this.codes,
  });

  List<String> get fieldData => codes.sublist(21, codes.length - 2);

  List<List<String>> get grouped => splitFieldDatas(fieldData);

  List<FieldDateResponse> get responses =>
      grouped.map((e) => FieldDecode(codes: e).response).toList();

  FieldDateResponseFormat get format {
    final source = '{ ${responses.map((e) => e.toMap).toList().join(',')}}';
    final v = FieldDateResponseFormat.fromJson(source);
    if (v.cardIssueName == "Wallet") {
      v.invoiceNo = v.customData?.walletInvoiceNumber;
    }
    return v;
  }

  List<List<String>> splitFieldDatas(List<String> data) {
    List<List<String>> result = [];
    var i = 0;
    while (i < data.length) {
      int length = hexLength(data.sublist(i + 2, i + 4)) + 5;
      result.add(data.sublist(i, i + length));
      i += length;
    }
    return result;
  }
}
