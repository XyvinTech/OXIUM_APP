import 'package:get/get.dart';

import '../Controller/bookaslot_controller.dart';

class BookASlotScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookASlotScreenController());
  }
}
