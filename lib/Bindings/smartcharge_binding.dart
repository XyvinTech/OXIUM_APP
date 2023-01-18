import 'package:freelancer_app/Controller/smartcharge_screen_controller.dart';
import 'package:get/get.dart';

class SmartChargeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SmartChargeController());
  }
}
