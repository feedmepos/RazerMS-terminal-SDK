
import 'package:flutter/material.dart';
import 'package:rms_terminal_sdk/rms_terminal_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final razer = RMSTerminalSDK();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TCP Client Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => razer.connect("192.168.68.109"),
              child: const Text("Connect"),
            ),
            TextButton(
              onPressed: () => razer.disconnect(),
              child: const Text("Disconnect"),
            ),
            TextButton(
              onPressed: () => razer.settlement(),
              child: const Text("Settlement"),
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
      ),
    );
  }
}
