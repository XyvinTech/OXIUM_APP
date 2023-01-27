import 'package:freelancer_app/Controller/calista_cafePage_controller.dart';
import 'package:get/get.dart';

class CalistaCafePageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CalistaCafePageController());
  }
}
