import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart.dart';
import 'package:freelancer_app/Model/stationMarkerModel.dart';
import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/Model/vehicleModel.dart';

late Size size = Size(0, 0);
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
final String kLoading = 'Loading...';
//login-screen
final String kLoginSkipButton = 'skip';
final String kLoginJoinGoec = 'Join GO EC and make';
final String kLoginRevolutions = 'Revolutions';

final String kLoginButtonGoogle = 'Google';
final String kLoginButtonFacebook = 'Facebook';
final String kLoginButtonPhone = 'Login with Phone';
final String kLoginTermsAndPrivay = 'Login with Phone';
final String kAll = 'All';

final VehicleModel kVehicleModel = VehicleModel(
    id: -111,
    icon: '',
    vehicleDetails: '',
    evRegNumber: '',
    modelName: '',
    outputType: '',
    typeOfPorts: '',
    ratedVoltages: 0,
    capacity: 0,
    numberOfPorts: 0,
    evPort: []);
final UserModel kUserModel = UserModel(
    username: '',
    phone: '',
    email: '',
    image: '',
    status: '',
    name: '',
    total_sessions: 0,
    total_units: 0,
    rfid: '');
ChargeStationDetailsModel kChargeStationDetailsModel =
    ChargeStationDetailsModel(
        id: -1,
        name: '',
        location_name: '',
        rating: '',
        image: '',
        lattitude: -1,
        longitude: -1,
        amenities: '',
        isFavorite: false,
        Chargers: []);
StationMarkerModel kStationMarkerModel = StationMarkerModel(
    id: -1,
    lattitude: 0,
    longitude: 0,
    isBusy: false,
    amenities: '',
    charger_status: '',
    ac_dc: '',
    charger_type: '',
    charger_capacity: '');

//app-Textstyles

final TextStyle kAppSkipButtonTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: kwhite,
);

final TextStyle kAppJoinGOECTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
  color: kwhite,
);

final TextStyle kAppRevolutionsTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 59.sp,
  fontWeight: FontWeight.w600,
  color: Color(0xff00FFB3),
);

final TextStyle kAppBottomTextSpanTextStyle1 = TextStyle(
  fontFamily: "Poppins",
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  color: Color(0xffffffff),
);

final TextStyle kAppBottomTextSpanTextStyle2 = TextStyle(
  fontFamily: "Poppins",
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  color: Color(0xff00FFB3),
  decoration: TextDecoration.underline,
);

final TextStyle kAppBigTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 20.sp,
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
  color: Color(0xffBDBDBD),
);

kLog(String value) {
  log(value);
}

class Const {
  //time slot page

  static Color titleColor = const Color(0xff4B4B4B);
  static Color subTitleColor = const Color(0xff494949);
  static Color hashTagTextColor = const Color(0xffF1673B);
  static Color cardBorderColor = const Color(0xffC7C7C7);
  static Color cardBorderActiveColor = const Color(0xff579A35);

  static Color availableTextColor = const Color(0xff7AC368);
  static Color notAvailableTextColor = Color.fromARGB(255, 205, 57, 43);
  static Color activeCardBgColor = const Color(0xffF1FFEA);

  static Color activeCardTimeColor = const Color(0xff579A35);
  static Color inactiveDateTextColor = const Color(0xff828282);
  static Color inactiveDateBgtColor = Color(0xFFE2E2E2);

  static Color activeDateTextColor = const Color(0xffFF8C68);
  static Color activeDateBgtColor = const Color(0xffFF8C68).withOpacity(0.15);
}
