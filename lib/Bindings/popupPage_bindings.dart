import 'package:freelancer_app/Controller/popuppage_controller.dart';
import 'package:get/get.dart';

class PopupPageBindigs extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopupPageController());
  }
}
