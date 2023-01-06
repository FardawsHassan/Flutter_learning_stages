import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  VoidCallback onpressed;
  String lebel;

  BottomButton({required this.lebel, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: const EdgeInsets.only(top: 7.5),
        padding: const EdgeInsets.only(bottom: 2),
        width: double.infinity,
        height: 65.0,
        color: kbottomAppBarColor,
        child: const Center(
          child: Text(
            'CALCULATE',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
