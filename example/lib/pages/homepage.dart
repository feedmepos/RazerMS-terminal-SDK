import 'package:flutter/material.dart';
import 'package:rms_terminal_sdk/rms_terminal_sdk.dart';

class TextData {
  String name;
  String? value;

  TextData(this.name, {this.value});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final razer = RMSTerminalSDK();
  TextEditingController ipController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  FieldDataResponseFormat? fieldData;

  @override
  void initState() {
    super.initState();
    ipController = TextEditingController(text: '192.168.0.133');
    amountController = TextEditingController(text: '500');
  }

  @override
  Widget build(BuildContext context) {
    void _showToast(String message) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(message),
          action: SnackBarAction(
              label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }

    final textData = [
      TextData('Pay Account Id:', value: fieldData?.payAccountId),
      TextData('Approve Code:', value: fieldData?.approvalCode),
      TextData('Response Text:', value: fieldData?.responseText),
      TextData('Transaction Id:', value: fieldData?.transactionId),
      TextData('Transaction Date:', value: fieldData?.transactionDate),
      TextData('Transaction Time:', value: fieldData?.transactionTime),
      TextData('Retrieval Reference No:',
          value: fieldData?.retrievalReferenceNo),
      TextData('Terminal Id:', value: fieldData?.terminalId),
      TextData('Encrypt Card No:', value: fieldData?.encryptedCardNo),
      TextData('Expiry Date:', value: fieldData?.expiryDate),
      TextData('Card Issue Date:', value: fieldData?.cardIssueDate),
      TextData('Member Expiry Date:', value: fieldData?.memberExpiryDate),
      TextData('Account Balance:', value: fieldData?.accountBalance),
      TextData('Amount:', value: fieldData?.amount),
      TextData('Batch No:', value: fieldData?.batchNo),
      TextData('Trace No:', value: fieldData?.traceNo),
      TextData('Invoice No:', value: fieldData?.invoiceNo),
      TextData('Merchant Name:', value: fieldData?.merchantName),
      TextData('Merchant No:', value: fieldData?.merchantNo),
      TextData('Card Issue Name:', value: fieldData?.cardIssueName),
      TextData('Card Label:', value: fieldData?.cardLabel),
      TextData('Card Holder name:', value: fieldData?.cardHolderName),
      TextData('AID:', value: fieldData?.aid),
      TextData('Application Profile:', value: fieldData?.applicationProfile),
      TextData('CID:', value: fieldData?.cid),
      TextData('TSI:', value: fieldData?.tsi),
      TextData('TVR:', value: fieldData?.tvr),
      TextData('Card Entry Mode:', value: fieldData?.cardEntryMode),
    ];

    final leftSide = Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 75,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: ipController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        hintText: 'IP Address',
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      await razer.connect(ipController.text);
                      _showToast('Connected');
                    } catch (err) {
                      print(err);
                      _showToast('Something went wrong');
                    }
                  },
                  child: const Text("Connect"),
                ),
                TextButton(
                  onPressed: () => razer.disconnect(),
                  child: const Text("Disconnect"),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: invoiceNoController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      hintText: 'Invoice No',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: amountController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      hintText: 'Amount',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => razer
                    .purchase(int.parse(amountController.text))
                    .then((value) {
                  setState(() {
                    fieldData = value;
                    invoiceNoController =
                        TextEditingController(text: fieldData?.invoiceNo ?? '');
                  });
                }),
                child: const Text("Purchase"),
              ),
              TextButton(
                onPressed: () =>
                    razer.refund(invoiceNoController.text).then((value) {
                  setState(() {
                    fieldData = value;
                    invoiceNoController =
                        TextEditingController(text: fieldData?.invoiceNo ?? '');
                  });
                }),
                child: const Text("Refund"),
              ),
              TextButton(
                onPressed: () => razer.cancel(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () =>
                    razer.settlement().then((value) => fieldData = value),
                child: const Text("Settlement"),
              ),
            ],
          ),
        ],
      ),
    );

    final rightSide = Expanded(
      flex: 3,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Row(
                  children: const [
                    SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Data',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ),
              ...textData
                  .map(
                    (e) => Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.name,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            e.value ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );

    return Row(
      children: [leftSide, rightSide],
    );
  }
}
