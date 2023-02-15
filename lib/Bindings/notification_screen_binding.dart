import 'package:get/get.dart';

import '../Controller/notification_screen_controller.dart';



class NotificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>NotificationScreenController ());
  }
}