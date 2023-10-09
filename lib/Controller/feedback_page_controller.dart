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
  int stationId = -1;
  Rx<ChargingStatusModel> status_model = kChargingStatusModel.obs;
  TextEditingController feedbackController = TextEditingController();
  List<String> seperator = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getArguments();
  }

  getArguments() {
    // '253-z1-1-Q  for QR code. A for App'
    var arg = Get.arguments;
    if (arg != null && arg is int) {
      stationId = Get.arguments;
    } else if (arg != null) {
      seperator = (arg[0] as String).split('-');
      stationId = int.parse(seperator[0]);
      status_model.value = arg[1];
    }
  }

  Future<bool> postReviewForChargeStation(context) async {
    if (selectedRating.value < 1) {
      EasyLoading.showInfo('Please select your experience rating');
      return false;
    }
    showLoading(kLoading);
    kLog(stationId);
    kLog(seperator[1]);
    bool status = await CommonFunctions().postReviewForChargeStation(
        stationId, selectedRating.value, feedbackController.text,
        chargerName: seperator.isEmpty ? null : seperator[1]);
    hideLoading();
    if (status) {
      FocusScope.of(context).unfocus();
      Get.toNamed(Routes.thankfeedbackPageRoute);
    }
    return status;
  }

  backToMaps() {
    Get.offAllNamed(Routes.homePageRoute);
  }
}
