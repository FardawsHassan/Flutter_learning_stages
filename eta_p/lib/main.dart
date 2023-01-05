import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BMI Calculator',
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF0A0E21),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0A0E21),
      ),
    ),
    home: const InputPage(),
  ));
}
