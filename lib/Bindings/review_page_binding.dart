import 'package:get/get.dart';

import '../Controller/review_page_controller.dart';

class ReviewPageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ReviewPageController());
  }
}
