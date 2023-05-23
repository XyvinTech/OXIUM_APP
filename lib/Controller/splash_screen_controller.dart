import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../Singletones/app_data.dart';
import '../Singletones/common_functions.dart';
import '../Utils/SharedPreferenceUtils.dart';
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
    // ?? '222111';
    // appData.userModel.value.username = '222111';
    //pass 01521
    appData.token =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5NzgyMTk5NDU1Iiwic2NvcGVzIjpbeyJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dLCJpc3MiOiJodHRwOi8vZXpib3QuY29tIiwiaWF0IjoxNjc5NjQxNDQyLCJleHAiOjE3MTExNzc0NDJ9.Scge54LZumVuYwtZmUmNa0YNDZE28CCll2GDnafPrYk';
    kLog('username: ' + appData.userModel.value.username);
    kLog(appData.token);
    var res = await CommonFunctions().getUserProfile();

    if (res.username.isEmpty) {
      Get.offAllNamed(Routes.loginpageRoute);
    } else {
      BookingModel _bookingModel = await CommonFunctions().getActiveBooking();
      if (_bookingModel.bookingId != -1) {
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
