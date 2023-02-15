import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerPageController extends GetxController {
  CarouselController? carouselController;
  RxDouble currentIndex = 0.0.obs;
  String phnNumber = "+8801751051339";
  RxString country = "91".obs;
  RxString countryName = "Country".obs;
  RxString textfield = "".obs;
  RxInt reload = 0.obs;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phnNumberController = TextEditingController();
  List<dynamic> carouselText = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
