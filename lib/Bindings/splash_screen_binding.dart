import 'package:freelancer_app/Controller/splash_screen_controller.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    CommonFunctions().getUserProfile();
    Get.lazyPut(() => SplashScreenController());
  }
}
