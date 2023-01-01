import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freelancer_app/constants.dart';

//CustomBigText Widget
class CustomBigText extends StatelessWidget {
  final String text;
  const CustomBigText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: kAppBigTextStyle,
      ),
    );
  }
}

//CustomSmallText Widget
class CustomSmallText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  const CustomSmallText({super.key, required this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: size ?? 14,
          fontWeight: FontWeight.w400,
          color: color ?? Color(0xff828282),
        ),
      ),
    );
  }
}
