import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomText(
    {required String text,
    double? size,
    Color? color,
    bool isAutoSize = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    double? letterSpacing,
    double minFontSize = 8,
    bool? isRoboto}) {
  TextStyle style = isRoboto == null || !isRoboto
      ? TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: letterSpacing ?? null)
      : GoogleFonts.roboto(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: letterSpacing ?? null);
  return !isAutoSize
      ? Text(text, style: style)
      : AutoSizeText(
          text,
          style: style,
          minFontSize: minFontSize,
        );
}
