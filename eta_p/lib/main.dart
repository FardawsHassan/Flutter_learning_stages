import 'package:flutter/material.dart';
import 'inputPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BMI Calculator',
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF0A0E21),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF0A0E21),
      ),
    ),
    home: InputPage(),
  ));
}
