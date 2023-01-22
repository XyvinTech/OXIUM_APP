import 'dart:developer';

import 'package:flutter/material.dart';

late Size size;
double zoom = 15;

final Color kblack = Colors.black;
final Color kwhite = Colors.white;
final Color kamber = Colors.amber;
final Color kred = Colors.red;
final Color kgrey = Colors.grey;
final Color kblue = Colors.blue;
final Color ktransparent = Colors.transparent;
final Color kOnboardingBackgroundColors = Color(0xff0047C3);
final Color ktextFieldColor = Color(0xffEEEEEE);
final Color kscaffoldBackgroundColor = Color(0xFFF5F5F5);
final Color kDefaultHomePageBackgroundColor = Color(0xffF0F1F6);

//appStrings
final String kAppName = 'Freelancer app';
//login-screen
final String kLoginSkipButton = 'skip';
final String kLoginJoinGoec = 'Join GO EC and make';
final String kLoginRevolutions = 'Revolutions';

final String kLoginButtonGoogle = 'Google';
final String kLoginButtonFacebook = 'Facebook';
final String kLoginButtonPhone = 'Login with Phone';
final String kLoginTermsAndPrivay = 'Login with Phone';

//app-Textstyles

final TextStyle kAppSkipButtonTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: kwhite,
);

final TextStyle kAppJoinGOECTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: kwhite,
);

final TextStyle kAppRevolutionsTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 59,
  fontWeight: FontWeight.w600,
  color: Color(0xff00FFB3),
);

final TextStyle kAppBottomTextSpanTextStyle1 = TextStyle(
  fontFamily: "Poppins",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xffffffff),
);

final TextStyle kAppBottomTextSpanTextStyle2 = TextStyle(
  fontFamily: "Poppins",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff00FFB3),
  decoration: TextDecoration.underline,
);

final TextStyle kAppBigTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Color(0xff828282),
);

final TextStyle kAppSmallTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff828282),
);
final TextStyle kApphintTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff828282),
);

kLog(String value) {
  log(value);
}
