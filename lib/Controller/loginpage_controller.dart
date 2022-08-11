import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'dart:math';

class LoginPageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String token = AppData().token;
  }
}
