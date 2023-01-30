import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onTap,
    this.fontSize = 16.0,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        textStyle:
            MaterialStateProperty.all(GoogleFonts.inter(fontSize: fontSize)),
        shadowColor: MaterialStateProperty.all(Color(0xff0047C3)),
      ),
      child: Text(text),
    );
  }
}
