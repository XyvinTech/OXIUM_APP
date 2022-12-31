import 'package:flutter/material.dart';

import 'package:freelancer_app/constants.dart';

class LoginCustomAppBar extends StatelessWidget {
  final String? text;
  final Widget? icon;
  const LoginCustomAppBar({super.key, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/goeclogo.png",
              height: 33,
              width: 68,
            ),
          ],
        ),
        Row(
          children: [
            if (text != null)
              Text(
                text!,
                style: kAppSkipButtonTextStyle,
              ),
            SizedBox(
              width: 10,
            ),
            if (icon != null)
              IconButton(
                onPressed: () {},
                icon: icon!,
              ),
          ],
        )
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String? text;
  final Widget? icon;
  const CustomAppBar({super.key, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.055,
        right: size.width * 0.055,
      ),
      height: size.height * 0.09,
      color: kOnboardingBackgroundColors,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/goeclogo.png",
                height: size.height * 0.065,
                width: size.width * 0.17,
              ),
            ],
          ),
          Row(
            children: [
              if (text != null)
                Text(
                  text!,
                  style: kAppSkipButtonTextStyle,
                ),
              SizedBox(
                width: 10,
              ),
              if (icon != null)
                IconButton(
                  color: kwhite,
                  onPressed: () {},
                  icon: icon!,
                ),
            ],
          )
        ],
      ),
    );
  }
}
