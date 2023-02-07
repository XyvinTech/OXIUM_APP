
import 'package:flutter/cupertino.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:get/state_manager.dart';

class LoginPageController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController mailEditingController = TextEditingController();
  RxBool enablenameTextfield = false.obs;
  RxBool enablemailTextfield = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString textfield = "".obs;
  RxString country = "91".obs;

  void nameTextfieldColorChange() {
    enablenameTextfield.value = true;
    if (enablenameTextfield == true) {
      enablemailTextfield.value = false;
    }
  }

  void mailTextFieldColorChange() {
    enablemailTextfield.value = true;
    if (enablemailTextfield == true) {
      enablenameTextfield.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // textEditingController.addListener(() {
    //   enablenameTextfield.value = nameEditingController.text.isNotEmpty;
    // });
    super.onInit();
    String token = AppData().token;
  }
}
