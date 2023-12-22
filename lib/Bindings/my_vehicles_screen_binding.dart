import 'package:get/get.dart';

import '../Controller/my_vehicles_screen_controller.dart';

class MyVehiclesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyVehiclesScreenController());
  }

}