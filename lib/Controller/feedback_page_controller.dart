import 'package:flutter/material.dart';
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
    // TODO: implement onInit
    super.onInit();
    getArguments();
  }

  getArguments() {
    // '253-z1-1-Q  for QR code. A for App'
    var arg = Get.arguments;
    if (arg != null) {
      seperator = (arg[0] as String).split('-');
      stationId = seperator[0];
      status_model.value = arg[1];
    }
  }

  Future<bool> postReviewForChargeStation(context) async {
    showLoading(kLoading);
    bool status = await CommonFunctions().postReviewForChargeStation(
        int.parse(stationId), selectedRating.value, feedbackController.text);
    hideLoading();
    if (status) {
      FocusScope.of(context).unfocus();
      Get.toNamed(Routes.thankfeedbackPageRoute);
    }
    return status;
  }

  backToMaps() {
    Get.until((route) => Get.currentRoute == Routes.homePageRoute);
  }
}
