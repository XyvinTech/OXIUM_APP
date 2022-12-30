import 'package:flutter/material.dart';
import 'package:freelancer_app/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key, required this.color, required this.text, this.onTap})
      : super(key: key);
  final Color color;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        height: size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(82),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF0047C3),
              ),
            ),
            IconButton(
              color: Color(0xFF0047C3),
              iconSize: 20,
              onPressed: () {},
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
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        height: size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(82),
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
              onPressed: () {},
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
