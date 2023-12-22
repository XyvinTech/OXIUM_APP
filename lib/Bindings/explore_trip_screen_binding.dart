import 'package:get/get.dart';

import '../Controller/explore_trip_screen_controller.dart';

class ExploreTripScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExploreTripScreenController());
  }
}
