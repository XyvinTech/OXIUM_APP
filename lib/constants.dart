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
final Color ktextFieldColor = Color(0xffEEEEEE);
final Color kscaffoldBackgroundColor = Color(0xFFF5F5F5);

//appStrings
final String kAppName = 'Freelancer app';
//login-screen
final String kLoginAppName = 'App name';
final String kLoginButtonGoogle = 'Google';
final String kLoginButtonFacebook = 'Facebook';
final String kLoginButtonPhone = 'Login with Phone';
final String kLoginTermsAndPrivay = 'Login with Phone';

kLog(String value) {
  log(value);
}
