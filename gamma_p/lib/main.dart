import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue.shade400,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade800,
          title: Text(
            "Dicee",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Dicee(),
      ),
    ),
  );
}

class Dicee extends StatefulWidget {
  const Dicee({super.key});

  @override
  State<Dicee> createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  @override
  int dice_number2 = Random().nextInt(6);
  int dice_number1 = Random().nextInt(6);
  void diceRoll() {
    setState(() {
      dice_number2 = Random().nextInt(6);
      dice_number1 = Random().nextInt(6);
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: diceRoll,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice${dice_number1 + 1}.png'),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: diceRoll,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice${dice_number2 + 1}.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
