import 'package:freelancer_app/Controller/help_page_controller.dart';
import 'package:get/get.dart';

class HelpPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpPageController());
  }
}
