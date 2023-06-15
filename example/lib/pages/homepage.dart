import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rms_terminal_sdk/rms_terminal_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final razer = RMSTerminalSDK();
  TextEditingController ipController = TextEditingController();
  FieldDateResponseFormat? fieldData;

  @override
  void initState() {
    super.initState();
    ipController = TextEditingController(text: '192.168.68.141');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
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
                      onPressed: () => razer.connect(ipController.text),
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
                children: [
                  TextButton(
                    onPressed: () =>
                        razer.settlement().then((value) => fieldData = value),
                    child: const Text("Settlement"),
                  ),
                  TextButton(
                    onPressed: () => razer.purchase(100),
                    child: const Text("Purchase"),
                  ),
                  TextButton(
                    onPressed: () => razer.purchase(100),
                    child: const Text("Purchase"),
                  ),
                  TextButton(
                    onPressed: () => razer.refund("000010"),
                    child: const Text("Refund"),
                  ),
                  TextButton(
                    onPressed: () => razer.cancel(),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
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
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Pay Account Id:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.payAccountId ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Approve Code:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.approvalCode ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Response Text:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.responseText ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Transaction Id:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.transactionId ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Transaction Date:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.transactionDate ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Transaction Time:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.transactionTime ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Retrieval Reference No:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.retrievalReferenceNo ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Terminal Id:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.terminalId ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Encrypt Card No:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.encryptedCardNo ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Card No:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.cardNo ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Expiry Date:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.expiryDate ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Card Issue Date:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.cardIssueDate ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Member Expiry Date:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.memberExpiryDate ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Account Balance:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.accountBalance ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Amount:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.amount ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Batch No:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.batchNo ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Trace No:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.traceNo ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Invoice No:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.invoiceNo ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Merchant Name:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.merchantName ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Merchant No:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.merchantNo ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Card Issue Name:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.cardIssueName ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Card Label:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.cardLabel ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Card Holder name:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.cardHolderName ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'AID:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.aid ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Application Profile:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.applicationProfile ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'CID:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.cid ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'TSI:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.tsi ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'TVR:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.tvr ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Card Entry Mode:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.cardEntryMode ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Custom Data',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Redemption Point:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.redemptionPoint ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Redemption Amount:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.redemptionAmount ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Net Sale Amount:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.netSaleAmount ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Balance Point:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.balancePoint ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Cashback Convenience Fee:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.cashbackConvenienceFee ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Store Id:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletStoreId ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Terminal Code:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletTerminalCode ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Invoice Number:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletInvoiceNumber ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Payer Id:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletPayerId ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Reference Id:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletReferenceId ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Transaction Id:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletTransactionId ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Currency Code:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletCurrencyCode ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Amount:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletAmount ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wallet Exchange Rate:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.walletExchangeRate ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Redemption Point:',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            fieldData?.customData?.redemptionPoint ?? '',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Merchant Receipt Footer:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.merchantReceiptFooter ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Customer Receipt Footer:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        fieldData?.customerReceiptFooter ?? '',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
