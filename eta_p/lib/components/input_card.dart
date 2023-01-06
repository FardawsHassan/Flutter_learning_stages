import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final Color background;
  final Widget? cardContent;
  final VoidCallback? onpressed;
  InputCard({
    this.cardContent,
    this.background = const Color(0xff1D1F33),
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: cardContent,
        ),
      ),
    );
  }
}
