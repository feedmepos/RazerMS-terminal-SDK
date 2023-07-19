enum PaymentBy {
  @Deprecated('Dont Work Properly')
  all,
  creditCard,
  eWallet,
}

enum EWalletName {
  alipay,
  wechatCn,
  wechatMy,
  razerPay,
  boost,
  tngWallet,
  maybank,
  grabPay,
  shopeePay,
  unionPayQr,
  duitNowQr,
}

class PaymentType {
  PaymentBy by;

  PaymentType({
    required this.by,
  });

  String get code {
    switch (by) {
      // case PaymentBy.all:
      //   return "00";
      case PaymentBy.eWallet:
        return "02";
      case PaymentBy.creditCard:
      default:
        return "01";
    }
  }

  String eWalletCode(EWalletName name) {
    switch (name) {
      case EWalletName.alipay:
        return "01";
      case EWalletName.wechatCn:
        return "02";
      case EWalletName.wechatMy:
        return "03";
      case EWalletName.razerPay:
        return "04";
      case EWalletName.boost:
        return "05";
      case EWalletName.tngWallet:
        return "06";
      case EWalletName.maybank:
        return "07";
      case EWalletName.grabPay:
        return "08";
      case EWalletName.shopeePay:
        return "09";
      case EWalletName.unionPayQr:
        return "10";
      case EWalletName.duitNowQr:
        return "99";
      default:
        return "06";
    }
  }
}
