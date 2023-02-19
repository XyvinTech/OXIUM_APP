import 'package:freelancer_app/Controller/about_page_controller.dart';
import 'package:get/get.dart';

class AboutPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AboutPageController());
  }
}
