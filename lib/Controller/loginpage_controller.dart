import 'package:flutter/cupertino.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'dart:math';

class LoginPageController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController mailEditingController = TextEditingController();
  RxBool enableOTpButton = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString textfield = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    textEditingController.addListener(() {
      enableOTpButton.value = textEditingController.text.isNotEmpty;
    });
    super.onInit();
    String token = AppData().token;
  }
}
