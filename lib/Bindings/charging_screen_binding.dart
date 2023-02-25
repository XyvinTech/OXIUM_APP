
import 'package:get/get.dart';

import '../Controller/charging_screen_controller.dart';

class ChargingScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChargingScreenController());
  }
}
