import 'package:get/get.dart';

import '../Controller/trips_screen_controller.dart';

class TripsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TripsScreenController());
  }
}
