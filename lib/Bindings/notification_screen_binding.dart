  import 'package:freelancer_app/Controller/search_screen_controller.dart';
import 'package:get/get.dart';

import '../Controller/notification_screen_controller.dart';



class NotificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>NotificationScreenController ());
  }
}