import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../Utils/routes.dart';

class LoginPageController extends GetxController {
  // TextEditingController textEditingController = TextEditingController();
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
  }

  saveUserNameEmail() async {
    if (nameEditingController.text.isEmpty ||
        mailEditingController.text.isEmpty) {
      EasyLoading.showInfo('Please fill up all the fields!');
      return;
    }
    showLoading(kLoading);
    bool res = await CommonFunctions().putUserNameEmail(
        nameEditingController.text, mailEditingController.text);
    if (res) Get.toNamed(Routes.addvehiclesRoute);
    hideLoading();
  }
}
