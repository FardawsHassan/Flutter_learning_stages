import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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

  audioPlayer(int key) {
    final player = AudioPlayer();
    player.play(AssetSource('note$key.wav'));
  }

  Expanded keyButton(Color btn_colour, int key) {
    return Expanded(
      child: TextButton(
          onPressed: () {
            audioPlayer(key);
          },
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
            keyButton(Colors.purpleAccent, 1),
            keyButton(Colors.blueAccent, 2),
            keyButton(Colors.lightBlue, 3),
            keyButton(Colors.greenAccent, 4),
            keyButton(Colors.yellowAccent, 5),
            keyButton(Colors.orangeAccent, 6),
            keyButton(Colors.redAccent, 7),
          ],
        ),
      ),
    );
  }
}
