import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freelancer_app/constants.dart';

//CustomBigText Widget
class CustomBigText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final void Function()? ontap;
  final FontWeight? fontWeight;
  final String? fontFamily;
  const CustomBigText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.ontap,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: fontFamily ?? "Poppins",
            fontSize: size ?? 20,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: color ?? Color(0xff828282),
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}

//CustomSmallText Widget
class CustomSmallText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final void Function()? ontap;
  final FontWeight? fontWeight;
  const CustomSmallText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: color ?? Color(0xff828282),
          ),
        ),
      ),
    );
  }
}
