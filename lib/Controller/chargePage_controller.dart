import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt IsTabIndex = 0.obs;

  TabController? tabController;
  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
