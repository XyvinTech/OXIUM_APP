import 'package:freelancer_app/Controller/bottom_nav_screen_controller.dart';
import 'package:get/get.dart';

import '../Controller/chargePage_controller.dart';

class BottomNavScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BottomNavScreenController());
    Get.lazyPut(() => ChargeScreenController());
  }
}
