import 'package:flutter/material.dart';

class signing_footer_text extends StatelessWidget {
  String txt;
  signing_footer_text({super.key, this.txt = ''});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
