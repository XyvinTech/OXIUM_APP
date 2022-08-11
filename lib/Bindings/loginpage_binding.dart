import 'package:get/get.dart';

import '../Controller/loginpage_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}