import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/Controller/otpnumberPage_controller.dart';
import 'package:get/get.dart';

class OtpScreenBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OtpNumberPageController());
    Get.lazyPut(() => LoginPageController());
  }
}
