// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../field_data.dart';

class CustomDecode extends CustomDataConfig {
  List<String> codes;

  CustomDecode({
    required this.codes,
  });

  Tag get tag {
    try {
      final key = '0x${codes.sublist(0, 2).map((e) => hexToString(e)).join()}';
      return byKey(key);
    } catch (err) {
      return Tag(key: "Unknown", remark: "Unknown", name: "Unknown");
    }
  }

  String get key => tag.key;
  
  String get name => tag.name;

  String get remark => tag.remark;


  String get message {
    try {
      final messageList = codes.sublist(3, codes.length);
      return hexListToUtf(messageList);
    } catch (err) {
      return "";
    }
  }

  String get response => '"$name":"$message"';
}

class CustomDateResponseFormat {
  String? redemptionPoint;
  String? redemptionAmount;
  String? netSaleAmount;
  String? balancePoint;
  String? cashbackConvenienceFee;
  String? walletStoreId;
  String? walletTerminalCode;
  String? walletInvoiceNumber;
  String? walletPayerId;
  String? walletReferenceId;
  String? walletTransactionId;
  String? walletCurrencyCode;
  String? walletAmount;
  String? walletExchangeRate;
  String? walletProductName;
  String? walletResponseCode;

  CustomDateResponseFormat({
    this.redemptionPoint,
    this.redemptionAmount,
    this.netSaleAmount,
    this.balancePoint,
    this.cashbackConvenienceFee,
    this.walletStoreId,
    this.walletTerminalCode,
    this.walletInvoiceNumber,
    this.walletPayerId,
    this.walletReferenceId,
    this.walletTransactionId,
    this.walletCurrencyCode,
    this.walletAmount,
    this.walletExchangeRate,
    this.walletProductName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'redemptionPoint': redemptionPoint,
      'redemptionAmount': redemptionAmount,
      'netSaleAmount': netSaleAmount,
      'balancePoint': balancePoint,
      'cashbackConvenienceFee': cashbackConvenienceFee,
      'walletStoreId': walletStoreId,
      'walletTerminalCode': walletTerminalCode,
      'walletInvoiceNumber': walletInvoiceNumber,
      'walletPayerId': walletPayerId,
      'walletReferenceId': walletReferenceId,
      'walletTransactionId': walletTransactionId,
      'walletCurrencyCode': walletCurrencyCode,
      'walletAmount': walletAmount,
      'walletExchangeRate': walletExchangeRate,
      'walletProductName': walletProductName,
    };
  }

  factory CustomDateResponseFormat.fromMap(Map<String, dynamic> map) {
    return CustomDateResponseFormat(
      redemptionPoint: map['redemptionPoint'] != null
          ? map['redemptionPoint'] as String
          : null,
      redemptionAmount: map['redemptionAmount'] != null
          ? map['redemptionAmount'] as String
          : null,
      netSaleAmount:
          map['netSaleAmount'] != null ? map['netSaleAmount'] as String : null,
      balancePoint:
          map['balancePoint'] != null ? map['balancePoint'] as String : null,
      cashbackConvenienceFee: map['cashbackConvenienceFee'] != null
          ? map['cashbackConvenienceFee'] as String
          : null,
      walletStoreId:
          map['walletStoreId'] != null ? map['walletStoreId'] as String : null,
      walletTerminalCode: map['walletTerminalCode'] != null
          ? map['walletTerminalCode'] as String
          : null,
      walletInvoiceNumber: map['walletInvoiceNumber'] != null
          ? map['walletInvoiceNumber'] as String
          : null,
      walletPayerId:
          map['walletPayerId'] != null ? map['walletPayerId'] as String : null,
      walletReferenceId: map['walletReferenceId'] != null
          ? map['walletReferenceId'] as String
          : null,
      walletTransactionId: map['walletTransactionId'] != null
          ? map['walletTransactionId'] as String
          : null,
      walletCurrencyCode: map['walletCurrencyCode'] != null
          ? map['walletCurrencyCode'] as String
          : null,
      walletAmount:
          map['walletAmount'] != null ? map['walletAmount'] as String : null,
      walletExchangeRate: map['walletExchangeRate'] != null
          ? map['walletExchangeRate'] as String
          : null,
      walletProductName: map["walletProductName"],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomDateResponseFormat.fromJson(String source) =>
      CustomDateResponseFormat.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class CustomDataDecode extends CustomDataConfig {
  List<String> codes;

  CustomDataDecode({
    required this.codes,
  });

  List<List<String>> get grouped => splitCustomData(codes);

  String get responses =>
      grouped.map((e) => CustomDecode(codes: e).response).toList().join(",");

  List<List<String>> splitCustomData(List<String> data) {
    List<List<String>> result = [];
    var i = 0;
    while (i < data.length) {
      int length = hexToNumber(data[i + 2]) + 3;
      result.add(data.sublist(i, i + length));
      i += length;
    }
    return result;
  }
}
