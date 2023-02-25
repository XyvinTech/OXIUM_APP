import 'package:freelancer_app/Controller/feedback_page_controller.dart';
import 'package:get/get.dart';

class FeedBackScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FeedBackPageController());
  }
}
