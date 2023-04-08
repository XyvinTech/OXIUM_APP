import 'package:flutter/material.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class EditProfileScreenController extends GetxController {
  RxString country = "91".obs;
  RxString textfield = "".obs;
  RxInt reload = 0.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phnNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController.text = appData.userModel.value.name;
    emailController.text = appData.userModel.value.email;
    phnNumberController.text =
        appData.userModel.value.phone.replaceAll('+91', '');
  }

  updateUserProfile() async {
    showLoading('Updating profile...');
    bool res = await CommonFunctions().putUserProfile(nameController.text,
        emailController.text, '+' + country.value + phnNumberController.text);
    hideLoading();
    if (res) {
      showSuccess('Successfully updated profile!');
      await CommonFunctions().getUserProfile();
      Get.back();
    }
  }
}
