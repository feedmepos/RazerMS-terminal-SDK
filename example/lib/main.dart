import 'dart:io';

import 'package:example/pages/homepage.dart';
import 'package:flutter/material.dart';


void main() async {
  Socket socket = await Socket.connect('192.168.68.198', 8800);
  runApp(MyApp(socket));
}
class MyApp extends StatelessWidget {
  final Socket socket;

  const MyApp(
    this.socket, {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(socket: socket,),
    );
  }
}
