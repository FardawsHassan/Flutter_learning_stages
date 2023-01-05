import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _inputPageState();
}

class _inputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                inputCard(),
                inputCard(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                inputCard(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                inputCard(),
                inputCard(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            width: double.infinity,
            height: 60.0,
            color: Color(0xffEA1556),
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class inputCard extends StatelessWidget {
  const inputCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        color: Colors.grey,
      ),
    );
  }
}
