// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class MainBtn extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? size;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  const MainBtn({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size,
    this.color,
    this.textColor,
    this.radius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(vertical: 15),
          disabledBackgroundColor: Color.fromARGB(255, 221, 221, 221),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 65)),
          backgroundColor: color ?? Color.fromARGB(255, 0, 4, 226)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          fontSize: size ?? 14,
          fontWeight: FontWeight.w600,
          color: textColor ?? Color(0xffF2F2F2),
        ),
      )),
      onPressed: onPressed,
    );
  }
}
