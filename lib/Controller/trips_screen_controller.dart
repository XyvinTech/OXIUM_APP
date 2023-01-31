import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TripsScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt IsTabIndex = 0.obs;

  late TabController tabController;
  final TextEditingController sourceTextController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit

    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    tabController.addListener(() {
      IsTabIndex.value = tabController.index;
    });
  }
}
