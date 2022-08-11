import 'package:flutter/material.dart';

Widget AppButton(Color color, String text, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 205,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    ),
  );
}
