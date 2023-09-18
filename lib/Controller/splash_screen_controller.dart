import 'dart:async';

import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../Singletones/app_data.dart';
import '../Singletones/common_functions.dart';
import '../Utils/SharedPreferenceUtils.dart';
import '../Utils/local_notifications.dart';
import '../Utils/routes.dart';

class SplashScreenController extends GetxController {
  RxInt reload = 0.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    appData.token = await getString('token') ?? appData.token;
    appData.userModel.value.username = await getString('username') ?? '';

    // appData.userModel.value.username = '9778203391';
    // appData.token =
    //     'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5Nzc4MjAzMzkxIiwic2NvcGVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dLCJpc3MiOiJodHRwOi8vZXpib3QuY29tIiwiaWF0IjoxNjkwODc5NDMyLCJleHAiOjE3MjI0MTU0MzJ9.ietGzHoA6IZklUiPuBF1oWpwxya46Hb76To9ZVWL1Ik';
    // kLog('username: ' + appData.userModel.value.username);
    kLog(appData.token);
    var res = await CommonFunctions().getUserProfile();
    kLog(res.username);
    if (res.username.isEmpty) {
      Get.offAllNamed(Routes.loginpageRoute);
    } else {
      BookingModel _bookingModel = await CommonFunctions().getActiveBooking();
      print(_bookingModel.toJson());
      if (_bookingModel.bookingId != -1) {
        ChargingStatusModel _status = await CommonFunctions()
            .getChargingStatus("${_bookingModel.bookingId}");
        print(_status.toJson());
        appData.qr =
            '0-${_bookingModel.chargerName}-${_bookingModel.chargingpoint}-${_bookingModel.bookedvia}';
        Get.offAllNamed(Routes.chargingPageRoute,
            arguments: [appData.qr, _bookingModel]);
      } else {
        Get.offAllNamed(Routes.homePageRoute);
      }
    }
  }
}
