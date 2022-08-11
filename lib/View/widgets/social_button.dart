import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SocialButton(
    Image image, Color color, String text, Color textColor, Function()? onTap) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6, top: 7, bottom: 7),
                child: image,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  "facebook",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
