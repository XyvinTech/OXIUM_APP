import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/bookingModel.dart';
import 'package:freelancer_app/Model/chargeTransactionModel.dart';
import 'package:freelancer_app/Singletones/common_functions.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../Singletones/dialogs.dart';

class ChargeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt IsTabIndex = 0.obs;
  bool isLoading = false;

  late TabController tabController;
  RxList<ChargeTransactionModel> model_list = RxList();
  RxDouble boxHeight = (0.0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    tabController.addListener(() {
      log('changed');
      IsTabIndex.value = tabController.index;
      setBoxHeight();
    });
    getChargeTransactions();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    tabController.dispose();
  }

  getChargeTransactions() async {
    showLoading(kLoading);
    model_list.value =
        await CommonFunctions().getChargeTransactions('${0}', '${10}');
    hideLoading();
    setBoxHeight();
  }

  getBooking(int bookingId, String stationName, String stationAddress) async {
    if (isLoading) return;
    isLoading = true;
    showLoading(kLoading);
    BookingModel model =
        await CommonFunctions().getBooking(bookingId: "${bookingId}");
    hideLoading();

    if (model.bookingId != -1) {
      Dialogs().charge_transaction_popup(
          model: model,
          stationAddress: stationAddress,
          stationName: stationName);
    }
    isLoading = false;
  }

  setBoxHeight() {
    boxHeight.value = size.height * .28 +
        (size.height * .1) *
            (tabController.index == 0 ? model_list.length : 40.0);
  }
}
