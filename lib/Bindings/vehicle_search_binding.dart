import 'package:freelancer_app/Controller/vehicle_search_controller.dart';
import 'package:get/get.dart';

class VehicleSearchBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => VehicleSearchController());
  }

}