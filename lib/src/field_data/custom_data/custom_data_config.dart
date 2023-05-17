import 'package:rms_terminal_sdk/main.dart';

class Tag {
  String key;
  String remark;

  Tag({
    required this.key,
    required this.remark,
  });
}

class CustomDataConfig extends TerminalConfig{
  final List<Tag> tagList = [
    Tag(key: "0xB102", remark: "OTSR redemption point"),
    Tag(key: "0xB103", remark: "OTSR redemption amount"),
    Tag(key: "0xB104", remark: "OTSR net sale amount"),
    Tag(key: "0xB105", remark: "OTSR balance point"),
    Tag(key: "0xB601", remark: "Cashback convenience fee"),
    Tag(key: "0xB901", remark: "Wallet store ID"),
    Tag(key: "0xB902", remark: "Wallet terminal code"),
    Tag(key: "0xB903", remark: "Wallet invoice number"),
    Tag(key: "0xB904", remark: "Wallet payer ID"),
    Tag(key: "0xB905", remark: "Wallet reference ID"),
    Tag(key: "0xB906", remark: "Wallet transaction ID"),
    Tag(key: "0xB907", remark: "Wallet currency code"),
    Tag(key: "0xB908", remark: "Wallet amount"),
    Tag(key: "0xB909", remark: "Wallet exchange rate"),
    Tag(key: "0xB910", remark: "Wallet product name (Alipay, WeChat CN, WeChat MY, Boost, TNG WALLET, GrabPay, Razer Pay, Maybank, etc.)"),
    Tag(key: "0xB911", remark: "Wallet response code"),
  ];

   Tag byKey(String key) {
    try {
      return tagList.firstWhere((element) => element.key == key.toLowerCase());
    } catch (err) {
      return Tag(key: key, remark: "Unknown");
    }
  }
}

