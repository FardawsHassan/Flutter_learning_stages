import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  Expanded keyButton(Color btn_colour) {
    return Expanded(
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
          child: Container(
            color: btn_colour,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            keyButton(Colors.purpleAccent),
            keyButton(Colors.blueAccent),
            keyButton(Colors.lightBlue),
            keyButton(Colors.greenAccent),
            keyButton(Colors.yellowAccent),
            keyButton(Colors.orangeAccent),
            keyButton(Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
