import 'package:freelancer_app/Controller/splash_screen_controller.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/SharedPreferenceUtils.dart';
import 'package:get/get.dart';

import '../Singletones/app_data.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() async {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashScreenController());
  }
}
