import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);
  RxBool IsMapiconColor = false.obs;
  RxBool IschargeiconColor = false.obs;
  RxBool IstripiconColor = false.obs;
  RxBool IswalleticonColor = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
