import 'package:freelancer_app/Controller/vehicle_search_controller.dart';
import 'package:get/get.dart';

import '../Controller/my_vehicles_screen_controller.dart';

class MyVehiclesBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MyVehiclesScreenController());
  }

}