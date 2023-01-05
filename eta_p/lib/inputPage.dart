import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum gender {
  male,
  female,
}

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
                inputCard(
                  cardContent: inputCardContent(FontAwesomeIcons.mars, 'MALE'),
                ),
                inputCard(
                  cardContent:
                      inputCardContent(FontAwesomeIcons.venus, 'FEMALE'),
                ),
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
            margin: EdgeInsets.only(top: 7.5),
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

class inputCardContent extends StatelessWidget {
  IconData icon;
  String iconLebel;
  inputCardContent(this.icon, this.iconLebel) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          iconLebel,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8d8d98),
          ),
        )
      ],
    );
  }
}

class inputCard extends StatelessWidget {
  Color background;
  Widget? cardContent;
  inputCard({this.cardContent, this.background = const Color(0xff1D1F33)}) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardContent,
      ),
    );
  }
}
