import 'package:example/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('TCP Client Demo'),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {},
              )
            ],
          ),
          body: const HomePage(),
        ));
  }
}
