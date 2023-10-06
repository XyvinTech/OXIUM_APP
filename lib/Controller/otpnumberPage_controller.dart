import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/Model/apiResponseModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/SharedPreferenceUtils.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../Utils/routes.dart';

class OtpNumberPageController extends GetxController {
  RxInt isIndex = (-1).obs;
  RxBool isFocus = false.obs;
  // LoginPageController? loginPageController;
  TextEditingController otpController = TextEditingController();
  String phone = '+91';
  late Timer timer;
  RxInt s = 30.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phone = Get.arguments == null ? '' : Get.arguments;
    startTimer();
  }

  onClose() {
    timer.cancel();
    super.onClose();
  }

  startTimer() {
    s.value = 30;
    timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      if (s <= 0) {
        s.value = 0;
        _timer.cancel();
      } else
        s--;
    });
  }

  resendOTP() async {
    LoginPageController _loginPageController = Get.find();
    bool res = await _loginPageController.login();
    if (res) startTimer();
  }

  verifyOTP() async {
    kLog(otpController.text);
    if (otpController.text.length != 5) return;
    showLoading(kLoading);
    ResponseModel res =
        await CommonFunctions().verifyOTP(phone, otpController.text);
    hideLoading();
    if (res.statusCode == 200) {
      appData.token = res.body['result']['token'];
      appData.userModel.value.username = res.body['result']['username'];
      await saveString('token', appData.token);
      await saveString('username', appData.userModel.value.username);
      appData.userModel.value = await CommonFunctions().getUserProfile();

      kLog(appData.userModel.value.username);
      if (appData.userModel.value.name.isEmpty ||
          appData.userModel.value.email.isEmpty) {
        Get.offAllNamed(Routes.addNameEmailPageRoute);
      } else {
        Get.offAllNamed(Routes.homePageRoute);
      }
    }
  }
}
