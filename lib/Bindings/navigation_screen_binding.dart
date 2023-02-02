import 'package:get/get.dart';

import '../Controller/loginpage_controller.dart';
import '../Controller/navigation_screen_controller.dart';

class NavigationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationScreenController());
  }
}