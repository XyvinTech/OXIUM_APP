import 'package:freelancer_app/Controller/qr_controller.dart';
import 'package:get/get.dart';

class QrBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrController());
  }
}
