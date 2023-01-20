import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String lebel;
  bool hideText;
  Function(String)? passValue;

  InputField(
      {this.lebel = 'Lebel Text', this.hideText = false, this.passValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 2),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 9,
            ),
            width: double.infinity,
            child: Text(
              lebel,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(217, 43, 40, 40)),
              textAlign: TextAlign.left,
            ),
          ),
          TextField(
            obscureText: hideText,
            onChanged: passValue,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1.5,
                  color: Color(0xff9B4AFE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
