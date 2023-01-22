import 'package:flutter/material.dart';
import 'package:freelancer_app/constants.dart';

//app button
class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key, this.color, required this.text, this.onTap, this.sizeheight})
      : super(key: key);
  final double? sizeheight;
  final Color? color;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        height: sizeheight ?? size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65),
          color: color ?? Color(0xff0047C3),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xffF2F2F2),
            ),
          ),
        ),
      ),
    );
  }
}

//get stated button
class StartedButton extends StatelessWidget {
  const StartedButton(
      {Key? key,
      required this.color,
      required this.text,
      this.onTap,
      this.textColor,
      this.iconColor})
      : super(key: key);
  final Color color;
  final Color? textColor;
  final Color? iconColor;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(82),
        color: color,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: textColor ?? Color(0xFF0047C3),
              ),
            ),
            IconButton(
              iconSize: 20,
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward,
                color: iconColor ?? Color(0xFF0047C3),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Login button
class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key, required this.color, required this.text, this.onTap})
      : super(key: key);
  final Color color;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        height: size.height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(65),
            color: Colors.transparent,
            border: Border.all(
              color: Color(0xff00FFB3),
              width: 2,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff00FFB3),
              ),
            ),
            IconButton(
              color: Color(0xff00FFB3),
              iconSize: 20,
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {Key? key,
      required this.color,
      required this.text,
      this.onTap,
      this.textColor,
      this.iconColor,
      required this.logo,
      this.borderWidth,
      this.borderColor})
      : super(key: key);

  final Color color;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final double? borderWidth;
  final String text;
  final Image logo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        height: size.height * 0.08,
        decoration: BoxDecoration(
          border: Border.all(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(82),
          color: color,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 27,
              child: Image.asset("assets/images/google1.png"),
            ),
            SizedBox(
              width: size.width * 0.15,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: textColor ?? Color(0xff4F4F4F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
