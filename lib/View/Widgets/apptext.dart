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
  const CustomSmallText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: kAppSmallTextStyle,
      ),
    );
  }
}
