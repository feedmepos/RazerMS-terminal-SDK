import '../../config.dart';

class Tag {
  String key;
  String remark;
  String name;

  Tag({
    required this.key,
    required this.remark,
    required this.name,
  });
}

class CustomDataConfig extends TerminalConfig {
  final List<Tag> tagList = [
    Tag(
        key: "0xb102",
        remark: "OTSR redemption point",
        name: "redemptionPoint"),
    Tag(
        key: "0xb103",
        remark: "OTSR redemption amount",
        name: "redemptionAmount"),
    Tag(key: "0xb104", remark: "OTSR net sale amount", name: "netSaleAmount"),
    Tag(key: "0xb105", remark: "OTSR balance point", name: "balancePoint"),
    Tag(
        key: "0xb601",
        remark: "Cashback convenience fee",
        name: "cashbackConvenienceFee"),
    Tag(key: "0xb901", remark: "Wallet store ID", name: "walletStoreId"),
    Tag(
        key: "0xb902",
        remark: "Wallet terminal code",
        name: "walletTerminalCode"),
    Tag(
        key: "0xb903",
        remark: "Wallet invoice number",
        name: "walletInvoiceNumber"),
    Tag(key: "0xb904", remark: "Wallet payer ID", name: "walletPayerId"),
    Tag(
        key: "0xb905",
        remark: "Wallet reference ID",
        name: "walletReferenceId"),
    Tag(
        key: "0xb906",
        remark: "Wallet transaction ID",
        name: "walletTransactionId"),
    Tag(
        key: "0xb907",
        remark: "Wallet currency code",
        name: "walletCurrencyCode"),
    Tag(key: "0xb908", remark: "Wallet amount", name: "walletAmount"),
    Tag(
        key: "0xb909",
        remark: "Wallet exchange rate",
        name: "walletExchangeRate"),
    Tag(
        key: "0xb910",
        remark:
            "Wallet product name (Alipay, WeChat CN, WeChat MY, Boost, TNG WALLET, GrabPay, Razer Pay, Maybank, etc.)",
        name: "walletProductName"),
    Tag(
        key: "0xb911",
        remark: "Wallet response code",
        name: "walletResponseCode"),
  ];

  Tag byKey(String key) {
    try {
      return tagList.firstWhere((element) => element.key == key.toLowerCase());
    } catch (err) {
      return Tag(key: key, remark: "Unknown", name: "Unknown");
    }
  }
}
