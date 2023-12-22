import 'package:freelancer_app/Controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => SplashScreenController());
  }
}
