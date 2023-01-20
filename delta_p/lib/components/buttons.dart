import 'package:flutter/material.dart';

class SigningButton extends StatelessWidget {
  Color bgColor;
  Color fgColor;
  String lebel;
  double border = 1.3;
  VoidCallback? onpress;

  SigningButton(
      {this.bgColor = const Color(0xff9B4AFE),
      this.fgColor = Colors.white,
      this.lebel = 'Sign In',
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onpress,
      style: OutlinedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          width: bgColor == Color(0xff9B4AFE) ? 0 : border,
          color: Colors.grey,
        ),
      ),
      child: Text(
        lebel,
        style: TextStyle(color: fgColor),
      ),
    );
  }
}
