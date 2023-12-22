import 'package:freelancer_app/Controller/vehicles_screen_controller.dart';
import 'package:get/get.dart';

class VehicleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehiclesScreenController());
  }
}
