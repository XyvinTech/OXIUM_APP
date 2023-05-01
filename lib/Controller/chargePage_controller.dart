import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt IsTabIndex = 0.obs;

  late TabController tabController;
  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    tabController.addListener(() {
      log('changed');
      IsTabIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    tabController.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
