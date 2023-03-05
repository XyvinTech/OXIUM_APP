import 'package:freelancer_app/Controller/rfid_page_controller.dart';
import 'package:get/get.dart';

class RfidPageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RfidPageController());
  }
}
