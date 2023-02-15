import 'package:freelancer_app/Controller/partner_page_controller.dart';
import 'package:get/get.dart';

class PartnerPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PartnerPageController());
  }
}
