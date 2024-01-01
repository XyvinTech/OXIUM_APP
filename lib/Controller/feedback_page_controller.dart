import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:get/get.dart';

import '../Singletones/common_functions.dart';
import '../Utils/toastUtils.dart';
import '../constants.dart';

class FeedBackPageController extends GetxController {
  // RxString selectName = "Payment Process".obs;
  // RxList<String> selected = [
  //   "Payment Process",
  //   "Charging Experience",
  //   "Finding Your destination",
  //   "Custom"
  // ].obs;
  RxInt selectedRating = 0.obs;
  String stationId = '-1';
  Rx<ChargingStatusModel> status_model = kChargingStatusModel.obs;
  TextEditingController feedbackController = TextEditingController();
  List<String> seperator = [];

  @override
  void onInit() {
    // / implement onInit
    super.onInit();
    getArguments();
  }

  getArguments() {
    // '253-z1-1-Q  for QR code. A for App'
    var arg = Get.arguments;
    if (arg != null && arg is String) {
      stationId = Get.arguments;
      kLog('id: $stationId');
    } else if (arg != null) {
      seperator = (arg[0] as String).split('-');
      stationId = seperator[0];
      status_model.value = arg[1];
      kLog('not id');
    }
  }

  Future<bool> postReviewForChargeStation(context) async {
    if (selectedRating.value < 1) {
      EasyLoading.showInfo('Please select your experience rating');
      return false;
    }
    showLoading(kLoading);
    kLog(stationId);
    kLog(seperator);
    bool status = await CommonFunctions().postReviewForChargeStation(
        stationId.toString(), selectedRating.value, feedbackController.text,
        chargerName: seperator.isEmpty ? null : seperator[1]);
    hideLoading();
    if (status) {
      FocusScope.of(context).unfocus();
      Get.toNamed(Routes.thankfeedbackPageRoute);
    } else {
      EasyLoading.showInfo('Something Went Wrong, Please Try Again');
      return false;
    }
    return status;
  }

  backToMaps() {
    Get.offAllNamed(Routes.homePageRoute);
  }
}
