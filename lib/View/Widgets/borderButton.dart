import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BorderButton extends StatelessWidget {
  BorderButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.borderColor = Colors.red,
    this.textColor = Colors.red,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(8),
    this.isForwardIcon = false,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double? fontSize;
  final Color borderColor;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets padding;
  final bool isForwardIcon;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.inter(fontSize: fontSize),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        )),
        side: MaterialStateProperty.all(BorderSide(color: borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              height: 0,
              fontWeight: fontWeight,
            ),
          ),
          if (isForwardIcon)
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: SvgPicture.asset("assets/svg/arrow_forward_icon.svg"),
            )
        ],
      ),
    );
  }
}
