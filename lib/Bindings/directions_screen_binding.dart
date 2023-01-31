
import 'package:get/get.dart';

import '../Controller/directions_screen_controller.dart';

class DirectionsScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DirectionsScreenController());
  }
}
