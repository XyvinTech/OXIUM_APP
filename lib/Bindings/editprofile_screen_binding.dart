import 'package:get/get.dart';

import '../Controller/editprofile_screen_controller.dart';

class EditProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>EditProfileScreenController());
  }
}