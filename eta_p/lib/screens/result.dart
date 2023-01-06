import 'package:flutter/material.dart';
import '../components/input_card.dart';
import '../components/bottom_button.dart';

class Result extends StatelessWidget {
  Result({required this.bmi, required this.messege, required this.result});

  String bmi;
  String messege;
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        margin: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 22, 14, 2),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InputCard(
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmi,
                    style: TextStyle(fontSize: 84, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      messege,
                      style: TextStyle(
                        color: Color.fromARGB(255, 223, 221, 221),
                        fontSize: 19,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              lebel: 'RE-CALCULATE',
              onpressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
