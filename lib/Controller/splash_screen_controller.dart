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
    appData.token = await getString('token') ?? '';
    appData.userModel.value.username = await getString('username') ?? '';
    kLog('username: ' + appData.userModel.value.username);
    kLog(appData.token);
    var res = await CommonFunctions().getUserProfile();
    if (res.email.isEmpty)
      Get.offAllNamed(Routes.loginpageRoute);
    else
      Get.toNamed(Routes.homePageRoute);
  }
}
