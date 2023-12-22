import 'package:freelancer_app/Controller/chargePage_controller.dart';
import 'package:get/get.dart';

class ChargeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChargeScreenController());
  }
}
