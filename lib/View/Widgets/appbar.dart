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

class OnboardingCustomAppBar extends StatelessWidget {
  final String? text;
  final Widget? icon;
  const OnboardingCustomAppBar({super.key, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/goeclogo2.png",
              height: 80,
              width: 120,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final Color? color;
  final Widget? logo;
  final void Function()? skiponTap;
  final void Function()? icononTap;
  const CustomAppBar({
    super.key,
    this.text,
    this.icon,
    this.color,
    this.skiponTap,
    this.icononTap,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.055,
        right: size.width * 0.055,
        // top: size.height * .02
      ),
      // height: size.height * 0.09,
      color: color ?? kOnboardingColors,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                logo ??
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
                  InkWell(
                    onTap: skiponTap,
                    child: Text(
                      text!,
                      style: kAppSkipButtonTextStyle,
                    ),
                  ),
                if (icon != null)
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.004),
                    child: IconButton(
                      color: kwhite,
                      onPressed: skiponTap,
                      icon: icon!,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
