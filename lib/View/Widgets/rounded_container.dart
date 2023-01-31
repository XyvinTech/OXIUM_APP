import 'package:flutter/material.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';

import '../../constants.dart';

Widget rounded_container({
  Color? color,
  required String hintText,
  String? text,
  required final onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .045,
        vertical: size.height * .013,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffF2F2F2),
      ),
      child: CustomText(
        text: text ?? hintText,
        color: text != null ? Color(0xff828282) : Color(0xffBDBDBD),
      ),
    ),
  );
}
